use "collections"

primitive Maths[T: (Real[T] val & Number & Comparable[T] val)]
  fun min(a: T, b: T): T =>
    if a <= b then a else b end

  fun factors(n: T): Array[T] =>
    var out = Array[T]
    out.push(1)
    out.push(n)
    var limit: T = (n / 2) + 1
    var right: T = n
    for i in Range[T](2, limit) do
      if i > right then break end
      if (n % i) == 0 then
        out.push(i)
        right = min(n / i, right)
      end
    end
    out

  fun isprime(n: T): Bool =>
    factors(n).size() == 2

actor Main
  new create(env: Env) =>
    var largest: U64 = 0
    for f in Maths[U64].factors(600851475143).values() do
      if Maths[U64].isprime(f) then
        env.out.print(f.string())
      end
    end