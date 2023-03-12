import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_asbeza/model/model.dart';
import '../model/repository.dart';

part 'asbeza_event.dart';
part 'asbeza_state.dart';

class AsbezaBloc extends Bloc<AsbezaEvent, AsbezaState> {
  final _apiServiceProvider = ApiServiceProvider();
  List history = [];
  AsbezaBloc() : super(AsbezaInitial()) {
    on<AsbezaFetchEvent>((event, emit) async {
      emit(AsbezaLoading());
      try {
        final activity = await _apiServiceProvider.fetchActivity();
        emit(AsbezaSuccess(asbeza: activity!, history: history));
      } catch (e) {
        emit(AsbezaInitial());
      }
    });

    on<HistoryEvent>((event, emit) => {history.add(event.data)});
  }
}
