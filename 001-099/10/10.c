#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

uint64_t sieve(int limit) {
    int *sieve = calloc(1, limit * sizeof(int));
    uint64_t total = 0;
    for (int i = 2; i < limit; i += 1) {
        if (sieve[i] == 1) {
            continue;
        } else {
            total += i;
            for (int j = i; j < limit; j += i) {
                sieve[j] = 1;
            }
        }
    }
    return total;
}

int main() {
    uint64_t total = sieve(2000000);
    printf("total: %llu\n", total);
}
