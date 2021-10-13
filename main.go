package main

import (
	"log"

	"github.com/sciter-sdk/go-sciter"
	"github.com/sciter-sdk/go-sciter/window"
)

func main() {

	w, err := window.New(sciter.SW_TITLEBAR|
		sciter.SW_RESIZEABLE|
		sciter.SW_CONTROLS|
		sciter.SW_MAIN|
		sciter.SW_ENABLE_DEBUG,
		nil)
	if err != nil {
		log.Fatal(err)
	}
	// 1. Handle resources via sciter archive loader.
	// It handles URLs like `this://app/`.
	w.SetResourceArchive(resources)

	// 2. Load a packaged resource.
	err = w.LoadFile("this://app/main.html")
	if err != nil {
		log.Fatal(err)
	}
	w.SetTitle("Hello, world")
	w.Show()
	w.Run()
}
