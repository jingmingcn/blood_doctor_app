import 'package:doctor/components/custom_app_bar.dart';
import 'package:doctor/constants.dart';
import 'package:doctor/models/Disease.dart';
import 'package:doctor/screens/details/doctor_details_screen.dart';
import 'package:doctor/screens/diseases/diseases_details_screen.dart';
import 'package:flutter/material.dart';

import 'components/disease_card.dart';

class DiseasesScreen extends StatelessWidget {
  const DiseasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('知识普及'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(text: "", title: "血液疾病"),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: demo_diseases.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                  ),
                  itemBuilder: (context, index) => DiseaseCard(
                    disease: demo_diseases[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DiseaseDetailsScreen(disease: demo_diseases[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
