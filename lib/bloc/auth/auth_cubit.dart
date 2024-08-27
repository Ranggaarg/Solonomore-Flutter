import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solonomore_flutter/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  Future<void> login (String username, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.login(username, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register (String username, String email, String password) async {
    emit(AuthLoading());
    try {
    await authRepository.register(username, email, password);
    emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }  
}
