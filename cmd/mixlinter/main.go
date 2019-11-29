package main

import (
	"github.com/bitkey-platform/mixlinter"
	"golang.org/x/tools/go/analysis/singlechecker"
)

func main() {
	singlechecker.Main(mixlinter.Analyzer)
}
