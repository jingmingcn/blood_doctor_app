import 'package:doctor/models/AvailableDoctor.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.press,
  }) : super(key: key);

  final AvailableDoctor doctor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding / 4),
                  Text(
                    doctor.sector!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Text(
                    "资历",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "${doctor.experience} 年",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "接诊量",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    doctor.patients!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                doctor.image!,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
