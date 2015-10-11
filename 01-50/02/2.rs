struct Fib {
    a: u64,
    b: u64,
    limit: u64,
}

impl Iterator for Fib {
    type Item = u64;
    fn next(&mut self) -> Option<u64> {
        let tmp = self.a;
        self.a = self.b;
        self.b += tmp;
        if self.a < self.limit {
            Some(self.a)
        } else {
            None
        }
    }
}

fn main() {
    let f = Fib {a: 1, b: 1, limit: 4000000};
    let s = f.filter(|x| x % 2 == 0).fold(0, |a, b| a + b);
    println!("{}", s);
}
