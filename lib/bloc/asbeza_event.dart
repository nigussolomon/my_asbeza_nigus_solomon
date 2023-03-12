part of 'asbeza_bloc.dart';

abstract class AsbezaEvent extends Equatable {
  const AsbezaEvent();

  @override
  List<Object> get props => [];
}

class AsbezaFetchEvent extends AsbezaEvent {
  const AsbezaFetchEvent();

  @override
  List<Object> get props => [];
}

class HistoryEvent extends AsbezaEvent {
  final Asbeza asbeza;
  const HistoryEvent({required this.asbeza});

  @override
  List<Object> get props => [];

  get data => asbeza;
}
