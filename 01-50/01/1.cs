using System;
 
public class Euler {
    static public void Main() {
        int sum = 0;
        for (int i = 0; i < 1000; i++) {
            if (i % 5 == 0 || i % 3 == 0) {
                sum += i;
            }
        }
        Console.Out.WriteLine(sum);
    }
}
