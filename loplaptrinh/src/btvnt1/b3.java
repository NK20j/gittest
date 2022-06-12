package btvnt1;

import java.util.Scanner;

public class b3 {
	
	    public static void main(String[] args) {

	        Scanner sc = new Scanner(System.in);

	        System.out.print("Enter a number: ");
	        int num = sc.nextInt();

	        if(num % 2 == 0)
	            System.out.println(num + " la chan");
	        else
	            System.out.println(num + " is le");
	  }
}

