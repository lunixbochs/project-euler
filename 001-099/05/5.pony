use "collections"

primitive Maths[T: (Real[T] val & Number & Comparable[T] val)]
  fun max(a: Iterator[T]): T =>
    var best: T = 0
    for v in a do
      if v > best then best = v end
    end
    best

  fun min(a: T, b: T): T =>
    if a <= b then a else b end

  fun factors(n: T): Seq[T] =>
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

  fun gcd(a: T, b: T): T =>
    var sa = Set[T]
    var sb = Set[T]
    sa.union(factors(a).values())
    sb.union(factors(b).values())
    sa.intersect(sb)
    max(sa.values())

  fun lcm(args: Iterator[T]): T =>
    try
      var a: T = args.next()?
      while args.has_next() do
        var b = args.next()?
        a = (a * b) / gcd(a, b)
      end
      a
    else 0 end

actor Main
  new create(env: Env) =>
    var nums = Range[U64](1, 20)
    env.out.print(Maths[U64].lcm(nums).string())
