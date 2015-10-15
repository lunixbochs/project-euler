var a:int = 0, b:int = 1;
var total:int = 0, tmp:int;
while (b < 4000000) {
    tmp = a, a = b;
    b += tmp;
    if (b % 2 == 0) {
        total += b;
    }
}
trace(total);
