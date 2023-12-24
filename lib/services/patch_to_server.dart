import 'package:http/http.dart' as http;

Future<String> patchToServer(String uri, Map<String, dynamic> data,
    {String? authToken}) async {
  try {
    final url = Uri.parse(uri);

    final response = await http.patch(url, body: data, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'authorization': 'Bearer $authToken',
    });

    if (response.statusCode == 200 || response.statusCode == 204) {
      return response.body.toString();
    } else if (response.statusCode >= 500 || response.statusCode <= 509) {
      return response.body.toString();
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'An error occured: ${e.toString()}';
  }
}
