package main

import (
	"context"

	pb "github.com/DazWilkin/dart-grpc-logger/protos"
	"google.golang.org/grpc"
)

var _ pb.LoggerClient = (*Client)(nil)

type Client struct {
	client pb.LoggerClient
}

func NewClient(conn *grpc.ClientConn) *Client {
	return &Client{
		client: pb.NewLoggerClient(conn),
	}
}
func (c *Client) SaveLogs(ctx context.Context, opts ...grpc.CallOption) (pb.Logger_SaveLogsClient, error) {
	return c.client.SaveLogs(ctx)
}
