import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/pages/main_pages.dart';
import 'package:travel/pages/welcome_page.dart';

class AppCubitesLogics extends StatefulWidget {
  const AppCubitesLogics({ Key? key }) : super(key: key);

  @override
  _AppCubitesLogicsState createState() => _AppCubitesLogicsState();
}

class _AppCubitesLogicsState extends State<AppCubitesLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubites, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          } else if (state is DetailState) {
            return DetailPage();
          } else if (state is LoadedState) {
            return MainPage();
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else  {
            return Container();

          }
        },
      )
    );
  }
}