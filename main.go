package main

import (
	"log"
	"path/filepath"

	"github.com/markbates/pkger"

	"github.com/sciter-sdk/go-sciter"
	"github.com/sciter-sdk/go-sciter/window"
)

func main() {
	pkger.Include("/res")
	pkger.Include("/libsciter.dylib")

	w, err := window.New(sciter.SW_TITLEBAR|
		sciter.SW_RESIZEABLE|
		sciter.SW_CONTROLS|
		sciter.SW_MAIN|
		sciter.SW_ENABLE_DEBUG,
		nil)
	if err != nil {
		log.Fatal(err)
	}
	fullpath, err := filepath.Abs("./res/main.html")
	if err != nil {
		log.Fatal(err)
	}
	w.LoadFile(fullpath)
	w.SetTitle("Hello, world")
	w.Show()
	w.Run()
}