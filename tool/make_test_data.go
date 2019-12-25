package main

import (
	"bytes"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"unicode"
)

var filename = flag.String("output", "is_print.txt", "output file name")

func main() {

    flag.Parse()

    var buf bytes.Buffer

	for i := rune(0); i <= unicode.MaxRune; i++ {
		if unicode.IsPrint(i) {
		    fmt.Fprintf(&buf, "t\n")
		} else {
		    fmt.Fprintf(&buf, "f\n")
		}
	}

    err := ioutil.WriteFile(*filename, buf.Bytes(), 0644)
    if err != nil {
        log.Fatal(err)
    }
}
