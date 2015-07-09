package main

import "fmt"

func fib() chan int {
	ret := make(chan int)
	go func() {
		a, b := 0, 1
		for {
			ret <- b
			a, b = b, a+b
		}
	}()
	return ret
}

func main() {
	total := 0
	for i := range fib() {
		if i >= 4000000 {
			break
		}
		if i%2 == 0 {
			total += i
		}
	}
	fmt.Println(total)
}
