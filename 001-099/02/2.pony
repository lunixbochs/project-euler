use "collections"

class Fib[T: (Real[T] val & Number)] is Iterator[T]
  var limit: T
  var a: T = 1
  var b: T = 1

  new create(limit': T) => limit = limit'
  fun has_next(): Bool => b < limit
  fun ref next(): T => b = a = a + b

actor Main
  new create(env: Env) =>
    var sum: I64 = 0
    var fib = Fib[I64](4_000_000)
    for n in fib do
      if (n % 2) == 0 then
        sum = sum + n
      end
    end
    env.out.print(sum.string())
