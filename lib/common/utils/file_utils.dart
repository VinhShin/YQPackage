import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils{
 Future<String> get _localPath async {
   final directory = await getApplicationDocumentsDirectory();

   return directory.path;
 }

 Future<String> getBase64FromFile(File file) async {
   final data = await file.readAsBytes();
   return base64Encode(data);
 }
}