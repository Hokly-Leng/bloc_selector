import 'package:bloc_selector/Core/Bloc/them_bloc.dart';
import 'package:bloc_selector/Core/Bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Themebloc changeTheme = BlocProvider.of<Themebloc>(context);
    UserBloc user = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            selector: (state) => state['name'],
            builder: (context, state) => Text('UserName: $state'),
          ),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            selector: (state) {
              return state['age'];
            },
            builder: (context, state) {
              return Text('Age: $state');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Write Your Username',
            ),
            onChanged: (value) => user.changeName(value),
          ),
        ],
      ),

      // body: BlocBuilder<UserBloc, Map<String, dynamic>>(
      //   bloc: user,
      //   builder: (context, state) {
      //     return ListView(
      //       padding: const EdgeInsets.all(20),
      //       children: [
      //         Text('UserName: ${state['name']}'),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         Text('AGE: ${state['age']}'),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         TextField(
      //           decoration: const InputDecoration(
      //             border: OutlineInputBorder(),
      //             hintText: 'Write your own name',
      //           ),
      //           onChanged: (value) => user.changeName(value),
      //         ),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         Row(
      //           children: [
      //             IconButton(
      //               onPressed: () => user.changeAge(state['age'] - 1),
      //               icon: const Icon(Icons.remove),
      //             ),
      //             IconButton(
      //               onPressed: () => user.changeAge(state['age'] + 1),
      //               icon: const Icon(Icons.add),
      //             ),
      //           ],
      //         ),
      //       ],
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeTheme.themeChange(),
        child: const Icon(Icons.light),
      ),
    );
  }
}
