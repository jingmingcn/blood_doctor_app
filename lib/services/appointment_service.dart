import 'package:doctor/exceptions/form_exceptions.dart';
import 'package:doctor/model/appointment_model.dart';
import 'package:doctor/services/helper_service.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AppointmentService {
  static const apptCreatePath = "api/appt/create";

  static Future<Appt> create_(
      {required int userId,
      required String username,
      required String doctorName,
      required String apptDate}) async {
    final response = await http.post(
      HelperService.buildUri(apptCreatePath),
      headers: HelperService.buildHeaders(),
      body: jsonEncode(
        {
          'userId': userId,
          'username': username,
          'doctorName': doctorName,
          'apptDate': apptDate,
        },
      ),
    );

    final statusType = (response.statusCode / 100).floor() * 100;

    switch (statusType) {
      case 200:
        final json = jsonDecode(response.body);
        final appt = Appt.fromJson(json);
        // saveUser(user);

        return appt;
      case 400:
        final json = jsonDecode(response.body);
        throw handleFormErrors(json);
      case 300:
      case 500:
      default:
        throw FormGeneralException(message: 'Error contacting the server!');
    }
  }
}
