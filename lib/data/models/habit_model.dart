/// Habit represents a single trackable habit in FocusFlow.
///
/// Keep this model immutable and add serialization/mapping as needed
/// (e.g., Isar annotations, JSON converters).
class Habit {
  final int id;
  final String name;

  const Habit({required this.id, required this.name});
}

/// HabitModel
///
/// Represents a habit entity in the app's domain.
/// Add fields and serialization/mapping as needed.

class HabitModel {
  final int id;
  final String name;
  final bool isCompleted;

  const HabitModel({required this.id, required this.name, this.isCompleted = false});
}


