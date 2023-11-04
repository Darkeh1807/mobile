import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future< File?> uploadFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ["pdf"],
  );
  if (result != null) {
    PlatformFile file = result.files.first;
    return File(file.path.toString());
  }
  return null;
}
