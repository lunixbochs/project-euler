#include <math.h>
#include <stdio.h>

int count_factors(num) {
    int factors = 0;
    int end = sqrt((double)num);
    for (int i = 1; i < end; i++) {
        if (num % i == 0) {
            factors++;
            if (i != num / i) {
                factors++;
            }
        }
    }
    return factors;
}

int main() {
    int num = 0;
    int natural = 0;

    while (1) {
        num += ++natural;
        int factors = count_factors(num);
        printf("natural: %d, num: %d, factors: %d\n", natural, num, factors);
        if (factors > 500) {
            printf("answer: %d\n", num);
            return 0;
        }
    }
    return 1;
}
