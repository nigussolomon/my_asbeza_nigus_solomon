import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/model.dart';
import '../model/repository.dart';

part 'asbeza_event.dart';
part 'asbeza_state.dart';

class AsbezaBloc extends Bloc<AsbezaEvent, AsbezaState> {
  final _apiServiceProvider = ApiServiceProvider();
  AsbezaBloc() : super(AsbezaInitial()) {
    on<AsbezaEvent>((event, emit) async {
      emit(AsbezaLoading());
      try {
        final activity = await _apiServiceProvider.fetchActivity();
        emit(AsbezaSuccess(asbeza: activity!));
      } catch (e) {
        print(e);
        emit(AsbezaInitial());
      }
    });
  }
}
