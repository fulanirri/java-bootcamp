package com.german.app;

import java.util.Scanner;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.print("What's yourname?");
        
        Scanner sc = new Scanner(System.in);
        
        String name = sc.nextLine();
        
        System.out.println( "Hello:"+name+"!!!" );
    }
}
