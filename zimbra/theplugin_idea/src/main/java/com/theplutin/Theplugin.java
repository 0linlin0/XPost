/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.theplutin;
import javax.swing.*;
import java.awt.*; 

/**
 *
 * @author Administrator
 */
public class Theplugin  extends javax.swing.JFrame {
    public Theplugin(){
        JFrame frame = new JFrame("myplugin");
        Container contentPane = frame.getContentPane();
        JPanel corePanel = new JPanel(new GridBagLayout());
        JPanel panel = new UI();
//        frame.setLayout(new GridBagLayout());
        corePanel.add(panel, new GridBagConstraints());
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        contentPane.add(corePanel);
        frame.setSize(1189,692);
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        System.out.println("Hello World!");
        new Theplugin();
    }
}
