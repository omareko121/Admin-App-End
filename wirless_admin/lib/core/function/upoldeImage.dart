// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

photoFromCamera() async {
  final XFile? file = await ImagePicker().pickImage(source: ImageSource.camera , imageQuality: 100 );
}

fileuplode() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: [
    "svg",
    "SVG",
    "png",
    "PNG",
    "jpg",
    "jpeg",
    "JPEG",
    "JPG",
    "gif",
  ]);

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
