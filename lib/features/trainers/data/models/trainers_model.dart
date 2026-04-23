class TrainersModel {
  final String name;
  final String specialty;
  final String image;
  final double expYears;
  final double rating;

  TrainersModel({
    required this.name,
    required this.specialty,
    required this.image,
    required this.expYears,
    required this.rating,
  });
  factory TrainersModel.fromJson(Map<String, dynamic> json) {
    return TrainersModel(
      name: json['name'],
      specialty: json['specialty'],
      image: json['image'],
      expYears: (json['experienceYears'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
    );
  }
  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "specialty": specialty,
      "image": image,
      "expYears": expYears,
      "rating": rating,
    };
  }
}
