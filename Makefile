# Modify this to the patch of your sciter-js-sdk
SCITER_BIN = /Users/Aivan/Documents/Desktop/PL/sciter-js-sdk/bin

# Mac stuff below

link:
	ln -s $(SCITER_BIN)/libsciter.dylib libsciter.dylib

# For some reason the `DYLD_LIBRARY_PATH` is not being read if you just do a normal `go run` command
# Even though you have the `DYD_LIBRARY_PATH` on your environment variables
run:
ifeq ($(OS),Windows_NT)
	echo "TODO"
else
	chmod +x $(SCITER_BIN)/macosx/packfolder
	$(SCITER_BIN)/macosx/packfolder ./res res.go -v resources -go
	go run -exec "env DYLD_LIBRARY_PATH=$(SCITER_BIN)/macosx" .
endif

clean:
	rm -rf bin

build: clean
ifeq ($(OS),Windows_NT)
	echo "TODO"
else
	mkdir bin
	cd bin && mkdir temp
	cd bin/temp && mkdir frameworks && mkdir assets
	chmod +x $(SCITER_BIN)/macosx/packfolder
	curl -L https://unpkg.com/htm/preact/standalone.mjs?module > ./res/preact.js
	$(SCITER_BIN)/macosx/packfolder ./res res.go -v resources -go
	go build -ldflags="-s -w" -o ./bin/temp/assets/app .
	cp $(SCITER_BIN)/macosx/libsciter.dylib ./bin/temp/frameworks/libsciter.dylib
	./utils/mbuild \
		-assets ./bin/temp/assets \
		-frameworks ./bin/temp/frameworks \
		-bin app \
		-icon ./assets/icon.png \
		-identifier com.starter.app \
		-name "App" \
		-o ./bin
	rm -rf bin/temp
endif