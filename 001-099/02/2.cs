using System;
 
public class Euler {
    static public void Main() {
        int sum = 0;
        int a = 0, b = 1;
        while (b < 4000000) {
            int tmp = b;
            b = a + b;
            a = tmp;
            if (b % 2 == 0) {
                sum += b;
            }
        }
        Console.Out.WriteLine(sum);
    }
}
