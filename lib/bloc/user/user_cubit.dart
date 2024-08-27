import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solonomore_flutter/models/user_model.dart';
import 'package:solonomore_flutter/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  
  final List<UserModel> partyUsers = List.generate(
      5,
      (index) => UserModel(
          age: 0,
          rank: '',
          role: '',
          communication_style: '',
          game_mode: '',
          gender: '',
          play_style: '',
          username: ''));
  Map<String, bool> listOfRoles = {
    "goldlane": false,
    "midlane": false,
    "jungler": false,
    "explane": false,
    "roamer": false,
  };
  final UserRepository userRepository;
  UserCubit(this.userRepository) : super(UserInitial());

  Future<void> getDataUser(String username) async {
    emit(UserLoading());
    try {
      final result = await userRepository.getDataUser(username);
      if (result == null) {
        emit(const UserFailure('User Not Found'));
      } else {
        partyUsers[0] = result;
        for (var user in partyUsers) {
          if (listOfRoles.containsKey(user.role)) {
            listOfRoles[user.role] = true; // Mark the role as filled
          }
        }
        emit(UserGetSuccess(result));
      }
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  Future<void> updateGenderData(String username, String gender) async {
    emit(UserLoading());
    try {
      await userRepository.updateGenderData(gender, username);
      emit(UserSuccess());
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  Future<void> updateAgeData(String username, int age) async {
    emit(UserLoading());
    try {
      await userRepository.updateAgeData(age, username);
      emit(UserSuccess());
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  Future<void> updatePreferenceData(String username, String rank, String role,
      String play_style, String communication_style, String game_mode) async {
    emit(UserLoading());
    try {
      await userRepository.updatePreferenceData(
          username, rank, role, play_style, communication_style, game_mode);
      emit(UserSuccess());
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  Future<void> findParty() async {
    emit(FindPartyLoading());
    try {
      final currentUser = partyUsers.first;
      List<String> unfilledRoles = [];
      listOfRoles.forEach((role, isFilled) {
        if (!isFilled) {
          unfilledRoles.add(role); // Collect roles that are not filled
        }
      });

      final result = await userRepository.getDataUser(currentUser.username);
      final res = await userRepository.findParty(
          rank: currentUser.rank,
          role: currentUser.role,
          age: currentUser.age,
          gender: currentUser.gender,
          playStyle: currentUser.play_style,
          communicationStyle: currentUser.communication_style,
          gameMode: currentUser.game_mode,
          rolesNeeded: unfilledRoles);
      if (res.isEmpty) {
        emit(const FindPartyFailure('User Not Found'));
      } else {
        for (var fetchedUser in res) {
          for (int i = 0; i < partyUsers.length; i++) {
            if (partyUsers[i].username.isEmpty &&
                !listOfRoles[fetchedUser.role]!) {
              partyUsers[i] = fetchedUser;
              listOfRoles[fetchedUser.role] = true; // Mark this role as filled
              break; // Move to the next fetched user
            }
          }
        }
        emit(FindPartySuccess(res, result));
      }
    } catch (e) {
      emit(FindPartyFailure(e.toString()));
    }
  }
}
