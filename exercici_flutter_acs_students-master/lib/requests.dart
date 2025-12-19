import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
import 'tree.dart';

const String BASE_URL = "http://localhost:8080";
final DateFormat DATEFORMATTER = DateFormat('yyyy-MM-ddThh:mm');

Future<http.Response> sendRequest(Uri uri) async {
  return http.get(uri).then((http.Response response) {
    if (response.statusCode == 200) {
      print("statusCode=${response.statusCode}");
      print(response.body);
    } else {
      print("statusCode=${response.statusCode}");
      throw Exception('failed to get answer to resquest $uri');
    }

    return response;
  });
}

Future<Tree> getTree(String areaId) async {
  Uri uri = Uri.parse("${BASE_URL}/get_children?$areaId");
  return sendRequest(uri).then((http.Response response) {
    Map<String, dynamic> decoded = convert.jsonDecode(response.body);
    return Tree(decoded);
  });
}

Future<void> lockDoor(Door door) async {
  await lockUnlockDoor(door, 'lock');
}

Future<void> unlockDoor(Door door) async {
  await lockUnlockDoor(door, 'unlock');
}

Future<void> lockUnlockDoor(Door door, String action) async {
  assert((action == 'lock') | (action == 'unlock'));
  String strNow = DATEFORMATTER.format(DateTime.now());
  print(DateTime.now());
  print(strNow);
  Uri uri = Uri.parse("${BASE_URL}/reader?credential=11343&action=$action"
      "&datetime=$strNow&doorId=${door.id}");
// credential 11343 corresponds to user Ana of Administrator group
  print('door ${door.id} is ${door.state}');
  print('${action} ${door.id}, uri $uri');
  await sendRequest(uri);
}

Future<void> openCloseDoor(Door door) async {
  String action = door.closed ? 'open' : 'close';
  String strNow = DATEFORMATTER.format(DateTime.now());
  print(DateTime.now());
  print(strNow);
  Uri uri = Uri.parse("${BASE_URL}/reader?credential=11343&action=$action"
      "&datetime=$strNow&doorId=${door.id}");
// credential 11343 corresponds to user Ana of Administrator group
  print('door ${door.id} is ${door.state}');
  print('${action} ${door.id}, uri $uri');
  await sendRequest(uri);
}
