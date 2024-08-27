part of 'upload_file_cubit.dart';

abstract class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  List<Object> get props => [];
}

class UploadFileInitial extends UploadFileState {}

class UploadFileLoading extends UploadFileState {}

class UploadFileSuccess extends UploadFileState {
  final Response response;

  const UploadFileSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class UploadFileError extends UploadFileState {
  final String error;

  const UploadFileError(this.error);

  @override
  List<Object> get props => [error];
}