#include <stdint.h>
#include <stdio.h>

inline static uint64_t paths(uint64_t x, uint64_t y, uint64_t width, uint64_t height) {
    if (x == width || y == height) {
        return 1;
    } else {
        return paths(x + 1, y, width, height) + paths(x, y + 1, width, height);
    }
}

int main() {
    for (int i = 0; i < 21; i++) {
        uint64_t count = paths(0, 0, i, i);
        printf("%dx%d: %llu\n", i, i, count);
    }
}
