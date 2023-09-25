class Lawyer {
  final String name;
  final String specialization;

  Lawyer({required this.name, required this.specialization});

  factory Lawyer.fromJson(Map<String, dynamic> json) {
    return Lawyer(
      name: json['name'],
      specialization: json['frontend_specialization[]'],
    );
  }
}