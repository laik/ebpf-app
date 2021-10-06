COMMIT := $(shell git describe --dirty --always)
LDFLAGS := "-s -w -X main.GitCommit=$(COMMIT)"

generate:
	go generate ./...

build: generate
	go build -o xdp-redirect cmd/xdp/*.go 
	
lint:
	golangci-lint run

test:
	go test -race ./...  -v