import java.util.Scanner;

public class Practica01{

	public static void main(String[] args){
		Grafica g = new Grafica();

		System.out.println("Escribe un numero entero mayor a 1000");
		Scanner sc = new Scanner();
		int c = sc.nextInt(System.in);
		g.redBarabasi(c);

		System.out.println("Grafica "+ g);
	}
}