import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/Business_Logic/Bloc/LoginAuth/auth_bloc.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.focusNode,
    required this.userName,
    required this.password,
  });

  final FocusNode focusNode;
  final TextEditingController userName;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: OutlinedButton(
        focusNode: focusNode,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.blue, width: 1),
            minimumSize: const Size(double.infinity, 54),
            backgroundColor: Colors.blue[50]),
        onPressed: () {
          print(userName.text);
          print(password.text);

          BlocProvider.of<AuthBloc>(context)
              .add(LoginEvent(userName.text, password.text));
        },
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
