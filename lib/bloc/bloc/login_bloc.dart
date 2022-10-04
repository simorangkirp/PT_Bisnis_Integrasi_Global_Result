import 'package:big_test/bloc/event/login_event.dart';
import 'package:big_test/model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/database_helper.dart';
import '../../services/rest_api.dart';
import '../state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState());
  RestApi api = RestApi();
  LoginModel loginModel = LoginModel();
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    var db = DB();
    try {
      if (event is LoginUser) {
        yield OnloadLogin();
        Map<String, dynamic> body = {
          "password": event.password ?? "",
          "kode_driver": event.codeDriver ?? "",
        };
        var json = await api.login(body);
        await db.saveUser(json);
        yield LoginSuccess();
      }
    } catch (e) {
      // print(e.toString());
      yield LoginError(e.toString());
    }
  }
}
