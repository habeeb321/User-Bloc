import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample/home_screen/model/user_model.dart';
import 'package:sample/home_screen/repository/api_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial(loading: false)) {
    on<FetchApiEvent>((event, emit) async {
      emit(UserState(loading: true));
      var result = await ApiService.fetchUser();
      emit(UserState(loading: false, userModel: result));
    });
  }
}
