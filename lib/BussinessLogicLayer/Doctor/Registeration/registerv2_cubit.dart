import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registerv2_state.dart';

class Registerv2Cubit extends Cubit<Registerv2State> {
  Registerv2Cubit() : super(Registerv2Initial());
}
