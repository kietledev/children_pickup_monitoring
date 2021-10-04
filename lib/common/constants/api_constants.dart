import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:children_pickup_monitoring/common/extensions/datetime.dart';
import 'package:crypto/crypto.dart';

const String key = "WYnIZVbJD5wSL+Pp8pmR8xUNuGA=";
const String dm = "https://mydtu.duytan.edu.vn";
int ttl = DateTime.now().ticks;

String getTokenApi({String id = ''}) {
  final String value = "${id}mydtu#dtu!39796868$key@dtu.edu.vn";
  final String token = md5.convert(utf8.encode(value)).toString();
  return token;
}

String getHeader({String id = ''}) {
  final Map<String, String> header = <String, String>{
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    'k': key,
    'dm': dm,
    'tk': getTokenApi(id: id),
    'ttl': ttl.toString(),
  };
  return json.encode(header);
}

Future<bool> checkInternetConnections() async {
  bool isConnect = false;
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty) {
      isConnect = true;
    }
  } on SocketException catch (_) {
    isConnect = false;
  }
  return isConnect;
}

String toBase64String(String hex) {
  final List<int> array = [];
  for (int i = 0; i < hex.length / 2; i++) {
    final int value = int.parse(hex.substring(i * 2, (i + 1) * 2), radix: 16);
    array.add(value);
  }

  return base64Encode(array);
}

Uint8List getBytes(String value) {
  final String hex = stringToHex(value);
  final String strBase64 = toBase64String(hex);
  final Uint8List bytes = base64Decode(strBase64);

  return bytes;
}

String stringToHex(String value) {
  String hex = '';
  for (int i = 0; i < value.length; i++) {
    final String v = value[i].codeUnits[0].toRadixString(16);
    // ignore: use_string_buffers
    hex = "$hex$v";
  }
  return hex;
}
