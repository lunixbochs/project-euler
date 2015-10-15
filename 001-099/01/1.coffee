sum = (n for n in [1..999] when n % 5 == 0 or n % 3 == 0).reduce (a, b) -> a + b
console.log(sum)
