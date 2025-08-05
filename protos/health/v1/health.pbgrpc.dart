///
//  Generated code. Do not modify.
//  source: health/v1/health.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'health.pb.dart' as $1;
export 'health.pb.dart';

class HealthClient extends $grpc.Client {
  static final _$check =
      $grpc.ClientMethod<$1.HealthCheckRequest, $1.HealthCheckResponse>(
          '/grpc.health.v1.Health/Check',
          ($1.HealthCheckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.HealthCheckResponse.fromBuffer(value));
  static final _$watch =
      $grpc.ClientMethod<$1.HealthCheckRequest, $1.HealthCheckResponse>(
          '/grpc.health.v1.Health/Watch',
          ($1.HealthCheckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.HealthCheckResponse.fromBuffer(value));

  HealthClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.HealthCheckResponse> check(
      $1.HealthCheckRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$check, request, options: options);
  }

  $grpc.ResponseStream<$1.HealthCheckResponse> watch(
      $1.HealthCheckRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$watch, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class HealthServiceBase extends $grpc.Service {
  $core.String get $name => 'grpc.health.v1.Health';

  HealthServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$1.HealthCheckRequest, $1.HealthCheckResponse>(
            'Check',
            check_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.HealthCheckRequest.fromBuffer(value),
            ($1.HealthCheckResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.HealthCheckRequest, $1.HealthCheckResponse>(
            'Watch',
            watch_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $1.HealthCheckRequest.fromBuffer(value),
            ($1.HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.HealthCheckResponse> check_Pre($grpc.ServiceCall call,
      $async.Future<$1.HealthCheckRequest> request) async {
    return check(call, await request);
  }

  $async.Stream<$1.HealthCheckResponse> watch_Pre($grpc.ServiceCall call,
      $async.Future<$1.HealthCheckRequest> request) async* {
    yield* watch(call, await request);
  }

  $async.Future<$1.HealthCheckResponse> check(
      $grpc.ServiceCall call, $1.HealthCheckRequest request);
  $async.Stream<$1.HealthCheckResponse> watch(
      $grpc.ServiceCall call, $1.HealthCheckRequest request);
}
