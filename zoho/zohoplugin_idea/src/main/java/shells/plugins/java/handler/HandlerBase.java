package shells.plugins.java.handler;

import core.Encoding;
import core.imp.Payload;

public class HandlerBase {
    Payload payload;
    Encoding encoding;
    public void init(Encoding encoding,Payload payload){
        this.encoding = encoding;
        this.payload = payload;
    }
}
