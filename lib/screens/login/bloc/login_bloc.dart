import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:doctor/exceptions/form_exceptions.dart';
import 'package:doctor/model/user_model.dart';
import 'package:doctor/services/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginFormState()) {
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final user = await AuthService.login(
          username: event.username,
          password: event.password,
        );
        emit(LoginSuccessState(
          user,
        ));
      } on FormGeneralException catch (e) {
        emit(LoginErrorState(e));
      } on FormFieldsException catch (e) {
        emit(LoginErrorState(e));
      } catch (e) {
        emit(LoginErrorState(
          FormGeneralException(message: 'Unidentified error'),
        ));
      }
    });
  }
}
