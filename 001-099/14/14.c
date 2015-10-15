#include <stdio.h>
#include <stdint.h>

int64_t chain_length(start) {
    int64_t len = 1;
    int64_t n = start;
    while (n > 1) {
        len++;
        if (n % 2 == 0) {
            n = n / 2;
        } else {
            n = (3 * n) + 1;
        }
    }
    return len;
}

int main() {
    struct {
        int64_t n, len;
    } best = {0};
    for (int64_t i = 0; i < 1000000; i++) {
        int64_t len = chain_length(i);
        if (len >= best.len) {
            best.n = i;
            best.len = len;
        }
    }
    printf("%lld = %lld\n", best.n, best.len);
}
