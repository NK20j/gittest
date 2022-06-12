package btvnt1;

import java.util.Scanner;

public class b1 {
	public static void main(String args[])
    {
        int number, i, tong=0, TBC;
        int num[] = new int[50];
        Scanner sc = new Scanner(System.in);
        number = sc.nextInt();
        System.out.print("Dien " +number+ " so : ");
        for(i=0; i<number; i++){
            num[i] = sc.nextInt();
            tong = tong + num[i];
        }
 
        TBC = tong/number;
        System.out.println("tong " +tong);
        System.out.println("TBC = " +TBC);
    }
}

