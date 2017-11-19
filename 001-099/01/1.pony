use "collections"

actor Main
  new create(env: Env) =>
    var sum:I64 = 0
    for i in Range[I64](1, 1000) do
      if ((i % 3) == 0) or ((i % 5) == 0) then
        sum = sum + i
      end
    end
    env.out.print(sum.string())
