import 'package:http/http.dart' as http;

Future<String> patchToServer(String uri, Map<String, dynamic> data) async {
  try {
    final url = Uri.parse(uri);

    final response = await http.patch(
      url,
      body: data,
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return response.body.toString();
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'An error occured: ${e.toString()}';
  }
}
