package main

import (
	"context"
	"flag"
	"log"
	"math/rand"
	"time"

	pb "github.com/DazWilkin/dart-grpc-logger/protos"

	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/timestamppb"
)

var (
	grpcEndpoint = flag.String("grpc_endpoint", "", "The gRPC endpoint of the gRPC Logger server.")
)

var (
	r = rand.New(rand.NewSource(time.Now().UnixNano()))
)

func main() {
	log.Println("[main] Starting gRPC Logger Client")
	defer func() {
		log.Println("[main] Stopping gRPC Logger Client")
	}()

	flag.Parse()
	if *grpcEndpoint == "" {
		log.Fatal("[main] Unable to start client. Requires gRPC endpoint to a gRPC Logger Server.")
	}

	dialOpts := []grpc.DialOption{
		grpc.WithInsecure(),
	}
	log.Printf("Connecting to gRPC Logger server [%s]", *grpcEndpoint)
	conn, err := grpc.Dial(*grpcEndpoint, dialOpts...)
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()

	client := NewClient(conn)

	stream, err := client.SaveLogs(context.TODO())
	if err != nil {
		log.Fatal(err)
	}

	for {
		n := r.Intn(10)
		rqst := &pb.SaveLogsRequest{
			Country: "us",
			App:     "test",
			Logs:    logs(n),
		}
		err := stream.Send(rqst)
		if err != nil {
			log.Printf("[main:loop:add] err: %s", err.Error())
		}
	}
}
func logs(n int) []*pb.Log {
	log.Printf("[main:logs] Generating %d logs", n)
	result := make([]*pb.Log, n)
	for i := 0; i < n; i++ {
		result[i] = &pb.Log{
			Id: "id",
			Timestamp: &timestamppb.Timestamp{
				Seconds: time.Now().Unix(),
			},
			Payload: "test",
		}
	}
	return result
}
