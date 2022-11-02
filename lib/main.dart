import 'package:bloc_selector/Core/Bloc/them_bloc.dart';
import 'package:bloc_selector/Core/Bloc/user_bloc.dart';
import 'package:bloc_selector/Features/Screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Themebloc changeTheme = Themebloc();
  final UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Themebloc>(
          create: (context) => changeTheme,
        ),
        BlocProvider(
          create: (context) => userBloc,
        )
      ],
      child: BlocBuilder<Themebloc, bool>(
        bloc: changeTheme,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo Bloc Selector',
            theme: state == true ? ThemeData.dark() : ThemeData.light(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
