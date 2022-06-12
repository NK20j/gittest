package btvnt1;

import java.util.Scanner;

public class b2 {
	public static void main(String args[])
    {
		Scanner sc=new Scanner(System.in);
		int num;
		System.out.print("Dien mot so nguyen: ");
		num=sc.nextInt();
		System.out.println("Binh phuong cua "+ num + " la: "+ num * num);
		System.out.println("Lap phuong cua "+ num + " la: "+ num * num * num);
	}
}