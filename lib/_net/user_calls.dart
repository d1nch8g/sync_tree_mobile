import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import '../_net/api.pb.dart';
import '../_net/api.pbgrpc.dart';
import '../_net/api.dart';

Future<bool> userCreate(
  Uint8List publicKey,
  Uint8List messageKey,
  String name,
  Uint8List sign,
) async {
  final response = await stub.userCreate(
    UserCreateRequest(
      publicKey: publicKey,
      messsageKey: messageKey,
      publicName: name,
      sign: sign,
    ),
  );
  return response.passed;
}

Future<bool> userUpdate(
  Uint8List publicKey,
  Uint8List messageKey,
  String name,
  Uint8List sign,
) async {
  final response = await stub.userUpdate(
    UserUpdateRequest(
      publicKey: publicKey,
      messsageKey: messageKey,
      publicName: name,
      sign: sign,
    ),
  );
  return response.passed;
}

Future<bool> userSend(
  Uint8List publicKey,
  int amount,
  Uint8List reciever,
  Uint8List sign,
) async {
  final response = await stub.userSend(
    UserSendRequest(
      publicKey: publicKey,
      sendAmount: Int64(amount),
      recieverAdress: reciever,
      sign: sign,
    ),
  );
  return response.passed;
}

Future<bool> userDeposit(
  Uint8List publicKey,
  Uint8List marketAdress,
  int amount,
  Uint8List sign,
) async {
  final response = await stub.userDeposit(
    UserDepositRequest(
      publicKey: publicKey,
      marketAdress: marketAdress,
      amount: Int64(amount),
      sign: sign,
    ),
  );
  return response.passed;
}

Future<bool> userWithdrawal(
  Uint8List publicKey,
  Uint8List marketAdress,
  int amount,
  Uint8List sign,
) async {
  final response = await stub.userWithdrawal(
    UserWithdrawalRequest(
      publicKey: publicKey,
      marketAdress: marketAdress,
      amount: Int64(amount),
      sign: sign,
    ),
  );
  return response.passed;
}

Future<bool> userSendMessage(
  Uint8List publicKey,
  Uint8List marketAdress,
  String message,
  Uint8List sign,
) async {
  final response = await stub.userSendMessage(
    UserSendMessageRequest(
      publicKey: publicKey,
      adress: marketAdress,
      message: message,
      sign: sign,
    ),
  );
  return response.passed;
}

