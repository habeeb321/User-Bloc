part of 'user_bloc.dart';

class UserState {
  final bool loading;
  UserModel? userModel;

  UserState({required this.loading, this.userModel});
}

class UserInitial extends UserState {
  UserInitial({required super.loading});
}
