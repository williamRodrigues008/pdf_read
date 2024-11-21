import 'dart:io';

import 'package:file_picker/file_picker.dart';

class PDFService{
  static Future<File> selectFile() async {
    FilePickerResult? fileSelected = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );
    return File(fileSelected!.files.single.path!); 
  }
}