import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/screentime_cubit.dart';
import 'package:task/data/network_service.dart';
import 'package:task/data/repository.dart';
import 'package:task/presentation/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Repository repository = Repository(networkService: NetworkService());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 1.0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
      ),
      home: BlocProvider(
        create: (context) => ScreentimeCubit(repository: repository),
        child: const HomeScreen(),
      ),
    );
  }
}
