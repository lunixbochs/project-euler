var sum:int = 0;
for (var i:int = 0; i < 1000; i++) {
    if (i % 5 == 0 || i % 3 == 0) {
        sum += i;
    }
}
trace(sum);
