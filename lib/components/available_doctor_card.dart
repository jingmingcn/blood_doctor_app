import 'package:doctor/models/AvailableDoctor.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/details/doctor_details_screen.dart';
import 'rating.dart';

class AvailableDoctorCard extends StatelessWidget {
  const AvailableDoctorCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final AvailableDoctor info;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorDetailsScreen(),
              ));
        },
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.name!,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    info.sector!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: Rating(score: 5),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Text(
                    "资历",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    "${info.experience} 年",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Text(
                    "接诊量",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    info.patients!,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
              Image.asset(
                info.image!,
                height: 120,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
