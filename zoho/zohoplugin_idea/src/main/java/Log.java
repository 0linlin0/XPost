/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Administrator
 */
public class Log {
    public static void adddata(String str,javax.swing.JTextArea textarea){
        textarea.append("[*] "+str+"\r\n");
    }
    
    public static void addtitle(String str,javax.swing.JTextArea textarea){
        textarea.append("[+] "+str+"\r\n");
    }
    public static void clear(javax.swing.JTextArea textarea){
        textarea.setText("");
    }
}
