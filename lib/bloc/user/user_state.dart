part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserGetSuccess extends UserState {
  final UserModel userModel;

  const UserGetSuccess(this.userModel);
}

final class UserSuccess extends UserState {}

final class UserFailure extends UserState {
  final String message;

  const UserFailure(this.message);
}

final class FindPartyLoading extends UserState {}

final class FindPartySuccess extends UserState {
  final UserModel? userApi;

  final List<UserModel> partyUsers;

  const FindPartySuccess(this.partyUsers, this.userApi);

  @override
  List<Object> get props => [partyUsers];
}

final class FindPartyFailure extends UserState {
  final String message;

  const FindPartyFailure(this.message);
}