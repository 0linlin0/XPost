package com.theplutin.handler;

import core.Encoding;
import core.imp.Payload;
import shells.plugins.java.ZimbraPlugin;

public class HandlerBase {
    Payload payload;
    Encoding encoding;
    public void init(Encoding encoding,Payload payload){
        this.encoding = encoding;
        this.payload = payload;
    }
}
