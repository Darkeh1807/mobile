import 'package:http/http.dart' as http;

Future<String> postToServer(String uri, Map<String, dynamic> data) async {
  try {
    final url = Uri.parse(uri);
    final response = await http.post(
      url,
      body: data,
    );

    if (response.statusCode == 201) {
      return response.body.toString();
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'An error occured: ${e.toString()}';
  }
}

Future<String> postUrlEncodeToServer(
    String uri, Map<String, dynamic> data) async {
  try {
    final url = Uri.parse(uri);

    //Convert request data into the x-www-urlencoded format

    final body = Uri.encodeQueryComponent(
        data.entries.map((entry) => "${entry.key}=${entry.value}").join("&"));
    final response = await http.post(url, body: body, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (response.statusCode == 201) {
      return response.body.toString();
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'An error occured: ${e.toString()}';
  }
}
