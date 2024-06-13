/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shells.plugins.java;

import java.awt.*;

/**
 *
 * @author Administrator
 */
public class Log {
    public static void adddata(String str, TextArea textarea){
        textarea.append("[*] "+str+"\r\n");
    }
    
    public static void addtitle(String str, TextArea textarea){
        textarea.append("[+] "+str+"\r\n");
    }
    public static void clear(TextArea textarea){
        textarea.setText("");
    }
}
