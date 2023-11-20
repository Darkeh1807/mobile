import 'dart:io';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/toast.dart';
import 'package:dio/dio.dart';


Future<String?> uploadFileToServer(File selectedfile, String path) async {
  late Response response;
  Dio dio = Dio();
  String percentage = "";

  if (selectedfile.path.isEmpty) {
    showToast("Please select a file first");
    return  "";
  }

  String uploadurl = "${Url.assets}/$path";
  logs.d(uploadurl);

  FormData formdata = FormData.fromMap({
    "company_docs": await MultipartFile.fromFile(
      selectedfile.path,
      filename: selectedfile.path.split('/').last,
    ),
  });

  response = await dio.post(
    uploadurl,
    data: formdata,
    onSendProgress: (int sent, int total) {
       percentage = (sent / total * 100).toStringAsFixed(2);

    },
  );

  if (response.statusCode == 201) {
    return  response.toString();
     
    
  } else {
    return 'Error during connection to the server';
    
  }
}
