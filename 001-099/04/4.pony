use "collections"

actor Main
  new create(env: Env) =>
    var largest: USize = 0
    for a in Range(100, 999) do
      for b in Range(100, 999) do
        var cur = a * b
        if ispalindrome(cur.string()) then
          largest = if cur > largest then cur else largest end
        end
      end
    end
    env.out.print(largest.string())

  fun ispalindrome(s: String): Bool =>
    s == s.reverse()
