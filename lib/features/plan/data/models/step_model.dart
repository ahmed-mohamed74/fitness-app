class StepModel {
  final int? week;
  final int? day;
  final String? workoutName;
  final int? duration;
  final String? reps;

  StepModel({this.week, this.day, this.workoutName, this.duration, this.reps});

  factory StepModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) return StepModel();

    return StepModel(
      week: map['week'] as int?,
      day: map['day'] as int?,
      workoutName: map['workoutName'] as String?,
      duration: map['duration'] as int?,
      reps: map['reps'] as String?,
    );
  }
}