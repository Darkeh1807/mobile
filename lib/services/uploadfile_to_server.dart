import 'dart:io';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/toast.dart';
import 'package:dio/dio.dart';

Future<String?> uploadFileToServer(File selectedFile, String path) async {
  final dio = Dio();
  try {
    if (selectedFile.path.isEmpty) {
      showToast("Please select a file first");
      return null;
    }
    final uploadUrl = "${Url.assets}/$path";
    logs.d(uploadUrl);

    final formData = FormData.fromMap({
      "company_docs": await MultipartFile.fromFile(
        selectedFile.path,
        filename: selectedFile.path.split('/').last,
      ),
    });

    final response = await dio.post(uploadUrl, data: formData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.toString();
    } else {
      final errorMessage =
          "Error: ${response.statusCode} - ${response.statusMessage}";
      showToast(errorMessage);
      return null;
    }
  } on DioException catch (e) {
    final errorMessage = "Error: ${e.message}";
    showToast(errorMessage);
    return null;
  } catch (e) {
    const errorMessage = "Unexpected error occurred";
    showToast(errorMessage);
    logs.e("Error uploading file: $e");
    return null;
  }
}
