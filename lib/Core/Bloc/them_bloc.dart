import 'package:bloc/bloc.dart';

class Themebloc extends Cubit<bool> {
  Themebloc() : super(false);

  void themeChange() => emit(!state);
}
