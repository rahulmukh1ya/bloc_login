import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/Presentation/Screens/Dashboard/UI/dashboard.dart';
import 'package:bloc_login/Business_Logic/Bloc/Dashboard/dashboard_bloc.dart';
import '../../Business_Logic/Bloc/LoginAuth/auth_bloc.dart';
import '../Screens/LoginPage/UI/login_page.dart';

class RouteGenerator {
  final AuthBloc _authBloc = AuthBloc();
  final DashboardBloc _dashboardBloc = DashboardBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthBloc>.value(
            value: _authBloc,
            child: const MyHomePage(
              title: "Flutter Login Bloc",
            ),
          ),
        );

      case '/dashboard':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<DashboardBloc>.value(
              value: _dashboardBloc,
              child: Dashboard(title: "Dashboard", username: args),
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text("Error in Navigation"),
          ),
        );
      },
    );
  }
}
