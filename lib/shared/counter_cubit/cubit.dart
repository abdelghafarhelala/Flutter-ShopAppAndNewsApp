import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/shared/counter_cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());
  int count = 0;
  static CounterCubit get(context) => BlocProvider.of(context);

  void Minus() {
    count--;
    emit(CounterMinusState());
  }

  void Plus() {
    count++;
    emit(CounterPlusState());
  }
}
