#include <stdio.h>

int main() {
    int acc = 0;
    for (int i = 0; i < 1000; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
            acc += i;
        }
    }
    printf("%d\n", acc);
}
