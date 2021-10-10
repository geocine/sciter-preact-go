<h1 align="center">
  <br>
  <a href="https://github.com/geocine/sciter-preact-go#readme"><img src="https://imgur.com/RttgvBT.png" alt="header" width="600"/></a>
  <br>
  Sciter Preact Go Starter
  <br>
</h1>

This is a [Sciter](https://sciter.com/) starter application using [Sciter.JS](https://github.com/c-smile/sciter-js-sdk). You can use JSX on the standalone module of [Preact](https://preactjs.com/) without any additional build step. The desktop application will be using Go bindings through [Sciter.Go](https://github.com/sciter-sdk/go-sciter). 

## Development

### Dependencies

Update to  latest [Sciter.Go](https://github.com/sciter-sdk/go-sciter) SDK
```
go get https://github.com/sciter-sdk/go-sciter@master
```
Use sciter binaries from version `4.4.6.8` of [Sciter.JS](https://github.com/c-smile/sciter-js-sdk) by checking out `c27c567`
```
git clone git@github.com:c-smile/sciter-js-sdk.git
git checkout c27c567
```
> If you do not use version 4.4.6.8 , you will encounter a crash while building see [go-sciter#297](https://github.com/sciter-sdk/go-sciter/issues/297) as the API has changed on 4.4.7.x onwards


### Development
Set your `SCITER_BIN` variable on the `Makefile` to point to the binary folder `sciter-js-sdk/bin`.

To run the application run this command:
```
make run
```

## Production

### Building
To build the application run this command. The output will be on the `bin` directory
```
make build
```
