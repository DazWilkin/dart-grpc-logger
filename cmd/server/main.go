package main

import (
	"context"
	"flag"
	"log"
	"net"

	"google.golang.org/grpc"

	pb "github.com/DazWilkin/dart-grpc-logger/protos"
)

var (
	grpcEndpoint = flag.String("grpc_endpoint", "", "The gRPC endpoint to listen on.")
)

func main() {
	log.Println("[main] Starting gRPC Logger Server")
	defer func() {
		log.Println("[main] Stopping gRPC Logger Server")
	}()

	flag.Parse()

	log.Println("[main] Creating a gRPC Server")
	grpcServer := grpc.NewServer()
	pb.RegisterLoggerServer(grpcServer, NewServer())

	ctx := context.Background()
	ctx, cancel := context.WithCancel(ctx)
	defer cancel()

	listen, err := net.Listen("tcp", *grpcEndpoint)
	if err != nil {
		log.Fatal(err)
	}
	log.Printf("Starting gRPC Listener [%s]\n", *grpcEndpoint)
	log.Fatal(grpcServer.Serve(listen))
}
