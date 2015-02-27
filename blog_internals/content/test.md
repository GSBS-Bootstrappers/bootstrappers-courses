title: Using Go for parellel-izing bioinformatics
date: 2015-02-23
category: golang
---

# Using `Go` for parellel-izing bioinformatics

```go
package main

import (
	"fmt"
	"sync"
)

type RNARead struct {
	sequence string
	name     string
}

func doWork(input chan RNARead, output chan RNARead) {
	newItem := <-input
	fmt.Println(newItem)

	output <- newItem
	wg.Done()
}

func main() {

	var wg sync.WaitGroup

	numCPUs := 10
	input := make(chan RNARead, 10000)
	output := make(chan RNARead, 10000)

	for i := 0; i < numCPUs; i++ {
		go doWork(input, output)
		wg.Add(1)
	}

	wg.Wait()
}
```