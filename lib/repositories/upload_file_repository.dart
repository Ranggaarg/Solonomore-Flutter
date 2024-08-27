import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'dart:io';

class FileRepository {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "http://192.168.8.100:4100",
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  ));

  Future<Response> uploadFile(File file) async {
    try {
      String? mimeType = lookupMimeType(file.path);
      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: DioMediaType.parse(mimeType ?? '')
        ),
      });
      return await dio.post('/users/upload', data: formData);
    } catch (e) {
      throw Exception('Gagal mengunggah file: $e');
    }
  }
}
