import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/model/data_model.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/services/data_service.dart';

class AppCubites extends Cubit<CubitStates> {

  AppCubites({ required this.data }) : super(InitialState()) {
    
    emit(WelcomeState());
  
  }

  final DataServices data;
  late final tempat;
  void getData() async {
    try {

      emit(LoadingState());
      tempat = await data.getInfo();
      emit(LoadedState(tempat));
    } catch (e) {


    }
  }

  DetailPage(DataModel data) {
    emit(DetailState(data));
  }
  
  GoHome() {
    emit(LoadedState(tempat));
  }
}