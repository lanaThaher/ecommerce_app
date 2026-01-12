import 'package:ecommerce_app/features/home/presentation/manager/cubit/navigation_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    emit(NavigationChanged(index));
  }
}
