import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solonomore_flutter/bloc/upload_file/upload_file_cubit.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File'),
      ),
      body: Center(
        child: BlocConsumer<UploadFileCubit, UploadFileState>(
          listener: (context, state) {
            if (state is UploadFileSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('File berhasil diunggah!')),
              );
            } else if (state is UploadFileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is UploadFileLoading) {
              return CircularProgressIndicator();
            }
            return ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  withData: true,
                  type: FileType.custom,
                  allowedExtensions: ['xlsx', 'csv'],
                );
                if (result != null && result.files.single.path != null) {
                  File file = File(result.files.single.path!);

                  // Cek apakah file ada dan ukurannya sesuai
                  if (await file.exists()) {
                    print('File size: ${await file.length()} bytes');
                    context.read<UploadFileCubit>().uploadFile(file: file);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('File tidak ditemukan.')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tidak ada file yang dipilih.')),
                  );
                }
              },
              child: Text('Unggah File'),
            );
          },
        ),
      ),
    );
  }
}