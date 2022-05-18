import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_app/layouts/states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterIntialState());

  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 10;
  void minus()
  {
    counter--;
    emit(CounterMinusState(counter));
  }
  void plus()
  {
    counter++;
    emit(CounterPlusState(counter));
  }
}