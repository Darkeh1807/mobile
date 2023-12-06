

import 'package:file_picker/file_picker.dart';

Future<FilePickerResult?> uploadFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ["pdf"],
  );
  return result;
}
