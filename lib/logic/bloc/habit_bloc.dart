import 'package:flutter_bloc/flutter_bloc.dart';

/// HabitBloc coordinates habit-related events and states.
///
/// Wire this BLoC to UI screens and repositories/services in the
/// data and logic layers.

// Events
abstract class HabitEvent {}

class LoadHabits extends HabitEvent {}

// States
abstract class HabitState {}

class HabitsInitial extends HabitState {}

class HabitsLoading extends HabitState {}

class HabitsLoaded extends HabitState {
  final List<dynamic> habits; // Replace with List<HabitModel> when wired
  HabitsLoaded(this.habits);
}

class HabitsError extends HabitState {
  final String message;
  HabitsError(this.message);
}

// Bloc
class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc() : super(HabitsInitial()) {
    on<LoadHabits>((event, emit) async {
      emit(HabitsLoading());
      // TODO: connect to repository and emit HabitsLoaded([...])
      emit(HabitsLoaded(const []));
    });
  }
}
