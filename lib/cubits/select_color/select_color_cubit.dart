import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_color_state.dart';

class SelectColorCubit extends Cubit<SelectColorState> {
  SelectColorCubit() : super(SelectColorInitial());
  int colorItemIndex = 0;
  selectColorItem( int index ){
    colorItemIndex = index ;
    emit(SelectColorSuccess()) ;
  }
}
