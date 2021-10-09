<h1 align="center">
  <br>
  <a href="https://github.com/geocine/sciter-preact-go#readme"><img src="https://imgur.com/mp5PGg3.png" alt="header" width="600"/></a>
  <br>
  Sciter React Go Starter
  <br>
</h1>

This is a [Sciter](https://sciter.com/) starter application using the [Sciter.JS SDK](https://github.com/c-smile/sciter-js-sdk). You can use JSX on the standalone module of [Preact](https://preactjs.com/) without any additional build step since Sciter uses [QuickJSPP](https://github.com/c-smile/quickjspp). The desktop application will be using Go bindings through [go-sciter](https://github.com/sciter-sdk/go-sciter). 

## Development

### Dependencies

Use latest [go-sciter](https://github.com/sciter-sdk/go-sciter) SDK
```
go get https://github.com/sciter-sdk/go-sciter@master
```
Use sciter binaries from version `4.4.6.8` of [sciter-js-sdk](https://github.com/c-smile/sciter-js-sdk) by checking out `c27c567`
```
git clone git@github.com:c-smile/sciter-js-sdk.git
git checkout c27c567
```
> If you do not use version 4.4.6.8 , you will encounter segmentation fault while building see [go-sciter#297](https://github.com/sciter-sdk/go-sciter/issues/297) as the API has changed on 4.4.7.x onwards
Update the `preact.js` dependency by running this
```
cd res
./get-preact.sh
```

### Development on Mac
Set your `DYLD_LIBRARY_PATH` to point to the binary `sciter-js-sdk/bin/macosx`. To run the application use this
```
go run -exec "env DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH" main.go
```
> For some reason the `DYLD_LIBRARY_PATH` is not being read if you just do a normal `go run` command

## Production

### Building
Copy the Sciter binary from the `DYLD_LIBRARY_PATH`
```
cp $DYLD_LIBRARY_PATH/libsciter.dylib ./libsciter.dylib
```
Building the binary by running `.\build.sh`
