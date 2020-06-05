import 'dart:math' show Random;

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

import '../protos/google/protobuf/timestamp.pb.dart';
import '../protos/logger.pb.dart';
import '../protos/logger.pbenum.dart';
import '../protos/logger.pbgrpc.dart';
import '../protos/logger.pbjson.dart';

class Client {
  ClientChannel channel;
  LoggerClient client;

  Future<void> main(List<String> args) async {
    print ('[Client:main] Entered');
    print ('[Client:main] Configuring channel');
    channel = ClientChannel('127.0.0.1',
        port: 50051,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure())
    );
    print ('[Client:main] Creating gRPC Logger Client');
    client = LoggerClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));

    try {
      await runSaveLogs();
    } catch (ex) {
      print('$ex');
    }

    await channel.shutdown();
  }

  Future<void> runSaveLogs() async {
    print ('[Client:runSaveLogs] Entered');

    Stream<SaveLogsRequest> generateLogs(int count) async* {
      print ('[Client:generateLogs] Count=${count}');
      final random = Random();
      
      for (int i = 0; i < count; i++) {
        var batch = random.nextInt(10);
        print ('[Client:generateLogs] Batch=${batch}');

        var logs = <Log>[];
        for (int j = 0 ; j < batch; j++) {
          var timestamp = Timestamp()
          ..seconds = Int64((new DateTime.now().millisecondsSinceEpoch/1000).round());

          logs.add(Log()
            ..id = "id"
            ..timestamp = timestamp
            ..payload = "test"
          );
        }
        
        final rqst = SaveLogsRequest()
          ..country = "us"
          ..app = "test";
          
        var l = rqst.logs;
        l..addAll(logs);

        yield rqst;
        await Future.delayed(Duration(milliseconds: 200 + random.nextInt(100)));
      }
    }

    final resp = await client.saveLogs(generateLogs(10));
    print('[Client:runSaveLogs] Finished');
  }

}

main(List<String> args) async {
  await Client().main(args);
}
