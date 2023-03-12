part of 'asbeza_bloc.dart';

abstract class AsbezaState extends Equatable {
  const AsbezaState();

  @override
  List<Object> get props => [];
}

class AsbezaInitial extends AsbezaState {}

class AsbezaLoading extends AsbezaState {}

class AsbezaSuccess extends AsbezaState {
  final List asbeza;
  final List history;
  const AsbezaSuccess({required this.asbeza, required this.history});
}
