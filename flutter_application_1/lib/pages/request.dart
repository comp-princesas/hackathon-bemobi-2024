import 'package:http/http.dart' as http;
import 'dart:convert';

postRequest(String email, String password) async {
  var urlPost = Uri.parse('http://127.0.0.1:8000/myapp/register/');
  var responsePost = await http.post(
    urlPost,
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (responsePost.statusCode == 201) {
    var data = jsonDecode(responsePost.body);
    print('POST Response: $data');
    return 0;
  } else {
    print('POST Request failed with status: ${responsePost.statusCode}');
    return null;
  }
}

getRequest(String email, String password) async {
  // var urlGet = Uri.parse('http://127.0.0.1:8000/');
  // var responseGet = await http.get(urlGet);

  // if (responseGet.statusCode == 200) {
  //   var data = jsonDecode(responseGet.body);
  //   print('GET Response: $data');
  //   return data;
  // } else {
  //   print('GET Request failed with status: ${responseGet.statusCode}');
  //   return null;
  // }
}
