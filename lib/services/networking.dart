import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking
{
  Networking(this.url);

  final String url;

  Future<dynamic> getdata() async
  {
    var urt = Uri.parse(url);
    http.Response response=await http.get(urt);
    if(response.statusCode==200) {
      String data = response.body;
      return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }
  }

}