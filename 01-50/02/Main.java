public class Main {
    public static void main(String[] args) {
        int a = 0, b = 1;
        int total = 0, tmp;
        while (b < 4000000) {
            if (b % 2 == 0) {
                total += b;
            }
            tmp = a;
            a = b;
            b += tmp;
        }
        System.out.println(total);
    }
}
