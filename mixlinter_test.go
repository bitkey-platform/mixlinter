package mixlinter_test

import (
	"testing"

	"github.com/bitkey-platform/mixlinter"

	"golang.org/x/tools/go/analysis/analysistest"
)

func Test(t *testing.T) {
	testdata := analysistest.TestData()
	analysistest.Run(t, testdata, mixlinter.Analyzer, "a")
}
