package main

import (
	"io"
	"log"
	"time"

	pb "github.com/DazWilkin/dart-grpc-logger/protos"
)

var _ pb.LoggerServer = (*Server)(nil)

type Server struct {
	pb.UnimplementedLoggerServer
}

func NewServer() *Server {
	return &Server{}
}
func (s *Server) SaveLogs(stream pb.Logger_SaveLogsServer) error {
	startTime := time.Now()
	log.Printf("[Server:SaveLogs] %s Entered", startTime.Format(time.RFC3339))

	for {
		rqst, err := stream.Recv()
		if err == io.EOF {
			endTime := time.Now()
			log.Printf("[Server:SaveLogs] %s EOF", endTime.Format(time.RFC3339))
			return stream.SendAndClose(&pb.DummyResult{
				Success: true,
				Error:   "",
			})
		}
		if err != nil {
			return err
		}
		log.Printf("[Server:SaveLogs] Received %d logs", len(rqst.GetLogs()))
		for _, l := range rqst.GetLogs() {
			log.Printf("[Server:SaveLogs] %s Log: %s", time.Now().Format(time.RFC3339), l.GetPayload())
		}
	}

}
