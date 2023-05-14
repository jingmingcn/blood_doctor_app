import 'package:doctor/models/Disease.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class DiseaseCard extends StatelessWidget {
  const DiseaseCard({
    Key? key,
    required this.disease,
    required this.press,
  }) : super(key: key);

  final Disease disease;
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
                    disease.name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding / 4),
                  Text(
                    disease.alias,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Text(
                    "发病率",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "${disease.incidence}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "医学专科",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    disease.specialty,
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
                disease.image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
