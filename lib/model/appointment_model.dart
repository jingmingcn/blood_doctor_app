class Appt {
  int id;
  int userId;
  String username;
  String doctorName;
  String apptDate;

  Appt({
    required this.id,
    required this.userId,
    required this.username,
    required this.doctorName,
    required this.apptDate,
  }) {}

  factory Appt.fromJson(Map<String, dynamic> json) {
    final appt = Appt(
      id: json['id'],
      userId: json['userId'],
      username: json['username'],
      doctorName: json['doctorName'],
      apptDate: json['apptDate'],
    );
    return appt;
  }
}
