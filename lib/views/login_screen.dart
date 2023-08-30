import 'package:first_bloc_app/bloc/login_bloc.dart';
import 'package:first_bloc_app/bloc/login_event.dart';
import 'package:first_bloc_app/bloc/login_state.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginBloc = LoginBloc();

  final TextStyle _textStyle = const TextStyle(fontSize: 30);

  onPressed() {
    loginBloc.send(LoginEvent.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        initialData: LoginState.initial(),
        stream: loginBloc.state,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (snapshot.data!.isLoading)
                const CircularProgressIndicator()
              else if (snapshot.data!.isFailure)
                Text(
                  'login that bai',
                  style: _textStyle,
                )
              else
                Text(
                  'login thanh cong',
                  style: _textStyle,
                ),
              Center(
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Send'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
