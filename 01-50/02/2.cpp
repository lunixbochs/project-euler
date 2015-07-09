#include <iostream>

int main() {
    int a = 0, b = 1;
    int total = 0;
    int tmp;
    while (b < 4000000) {
        tmp = a;
        a = b;
        b += tmp;
        if (b % 2 == 0) {
            total += b;
        }
    }
    std::cout << total << std::endl;
}
