import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample/home_screen/model/user_model.dart';
import 'package:sample/home_screen/repository/api_service.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<FetchApiEvent>((event, emit) async {
      emit(state.copyWith(loading: true));
      var result = await ApiService.fetchUser();
      emit(state.copyWith(loading: false, userModel: result));
    });
  }
}
