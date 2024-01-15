part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required bool loading,
    UserModel? userModel,
  }) = _UserState;

  factory UserState.initial() => const UserState(loading: false);
}
