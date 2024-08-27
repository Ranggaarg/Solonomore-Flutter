import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';
import 'package:solonomore_flutter/repositories/upload_file_repository.dart';

part 'upload_file_state.dart';


class UploadFileCubit extends Cubit<UploadFileState> {
  final FileRepository fileRepository;

  UploadFileCubit({required this.fileRepository}) : super(UploadFileInitial());

  Future<void> uploadFile({required File file}) async {
    try {
      emit(UploadFileLoading());
      final response = await fileRepository.uploadFile(file);
      emit(UploadFileSuccess(response));
    } catch (error) {
      emit(UploadFileError(error.toString()));
    }
  }
}