import 'dart:typed_data';

import 'package:grpc/grpc.dart';

import '../api/api.pb.dart';
import '../api/api.pbgrpc.dart';
import '../api/api.dart';

userSearch(String name) async {
  try {
    final response = await stub.userSearch(
      UserSearchRequest(
        name: name,
      ),
      options: CallOptions(
        timeout: Duration(milliseconds: 2584),
      ),
    );
    for (var i = 0; i < response.adresses.length / 64; i += 64) {
      var singleAdress = response.adresses.sublist(
          i,
          i + 64 > response.adresses.length
              ? response.adresses.length
              : i + 64);
      
    }
  } catch (Exception) {
    return [];
  }
}
