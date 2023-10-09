import 'package:http/http.dart' as http;

Future<String> getFromServer(String uri) async {
//Method to get from server and return the body of the response as s String which will then be encoded
  try {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'An error occured: ${e.toString()}';
  }
}
