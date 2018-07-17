/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package online;

import java.net.URL;
import java.util.Scanner;

/**
 *
 * @author Nice
 */
public class ReadHTMLData {
    
  
    public static void main(String[] args) throws Exception 
    {
        URL u;
        Scanner s;
        
        u=new URL("file:///C:/Users/Nice/Downloads/Result Html Pages/91.html");
        s=new Scanner(u.openStream());
        
        while(s.hasNext())
        {
            System.out.println(s.nextLine());
        }
    }
   
}


