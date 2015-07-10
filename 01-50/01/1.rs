fn main() {
    let s = (1..1000)
        .filter(|x| x % 5 == 0 || x % 3 == 0)
        .fold(0, |a, b| a + b);
    println!("{}", s);
}
