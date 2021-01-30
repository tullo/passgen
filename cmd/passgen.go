package main

import (
	"fmt"
	"log"

	"github.com/tullo/password/password"
)

func main() {
	// Generate a password that is 32 characters long with 10 digits, 0 symbols,
	// allowing upper and lower case letters, disallowing repeated characters.
	res, err := password.Generate(32, 10, 0, true, false)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(res)
}
