var a = 0, b = 1;
var total = 0, tmp;
while (b < 4000000) {
    tmp = a, a = b;
    b += tmp;
    if (b % 2 == 0) {
        total += b;
    }
}
console.log(total);
