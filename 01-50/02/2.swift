var a = 0, b = 1;
var total = 0;
while b < 4000000 {
    if b % 2 == 0 {
        total += b;
    }
    var tmp = a;
    a = b;
    b += tmp;
}
println(total);
