import 'package:http/http.dart' as http;
import 'dart:convert';

var baseUrl = 'http://localhost:3000/api/';
onLogginIn(String email, String password) async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');
  assert(response.statusCode == 200);
  final jsonData = json.decode(response.body);
  return jsonData;
}

onSignUp(String firstname, String mobile, String email, String password,
    String confirmPassword) async {
  final response = await http.post(
    baseUrl + 'auth/signup',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'fullname': firstname,
      'mobile': mobile,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword
    }),
  );
  assert(response.statusCode == 200);
  final jsonData = json.decode(response.body);
  return jsonData;
}
