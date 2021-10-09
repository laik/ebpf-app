COMMIT := $(shell git describe --dirty --always)
LDFLAGS := "-s -w -X main.GitCommit=$(COMMIT)"
BIN = bin

generate:
	go generate ./...

build: generate
	go build -o ${BIN}/xdp-redirect cmd/xdp/*.go 
	go build -o ${BIN}/clsact cmd/tc/*.go 
	
lint:
	golangci-lint run

test:
	go test -race ./...  -v