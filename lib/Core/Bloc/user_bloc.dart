import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({'name': '', 'age': 0});

  void changeName(String newName) {
    emit({
      'name': newName,
      'age': state['age'],
    });
  }

  void changeAge(dynamic newAge) {
    emit({
      'name': state['name'],
      'age': newAge,
    });
  }
}
