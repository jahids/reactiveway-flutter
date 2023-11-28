import 'dart:convert';
import 'package:crudapp/Style/Style.dart';
import 'package:http/http.dart' as http;

Future<bool> ProductCreateRequest(FormValues) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = jsonEncode(FormValues);
  var PostHeader = {"Content-Type": "application/json"};

  var resp = await http.post(URL, headers: PostHeader, body: PostBody);
  var resultbody = jsonDecode(resp.body);

  if (resp.statusCode == 200 && resultbody['status'] == "success") {
    SuccessToast("Request is Success");
    return true;
  } else {
    ErrorToast("Request failes");
    return false;
  }
}
