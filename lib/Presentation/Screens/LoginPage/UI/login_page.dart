import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Business_Logic/Bloc/LoginAuth/auth_bloc.dart';
import '../../../Components/loader.dart';
import '../../../Components/spacers.dart';
import '../Widgets/button.dart';
import '../Widgets/text_data_widget.dart';
import '../Widgets/text_form_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    loginBtnFocus.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              buildErrorLayout();
            } else if (state is AuthLoaded) {
              Navigator.of(context)
                  .pushNamed('/dashboard', arguments: state.username);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const LoadingWidget();
            } else {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextData(message: "User",),
        const HeightSpacer(myHeight: 50),
        InputField(
          focusNode: usernameFocus,
          textController: username,
          label: "Username",
          icons: const Icon(Icons.person, color: Colors.blue),
        ),
        const HeightSpacer(myHeight: 20),
        InputField(
          focusNode: passwordFocus,
          textController: password,
          label: "Password",
          icons: const Icon(Icons.lock, color: Colors.blue),
        ),
        const HeightSpacer(myHeight: 20),
        ButtonWidget(
          focusNode: loginBtnFocus,
          userName: username,
          password: password,
        ),
      ],
    );
  }

  ScaffoldFeatureController buildErrorLayout() {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter username/password!"),
      ),
    );
  }
}
