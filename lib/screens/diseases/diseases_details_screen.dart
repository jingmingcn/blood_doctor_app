import 'package:doctor/components/heightlight.dart';
import 'package:doctor/components/rating.dart';
import 'package:doctor/constants.dart';
import 'package:doctor/models/Disease.dart';
import 'package:doctor/screens/appointment/appointment_screen.dart';
import 'package:flutter/material.dart';

class DiseaseDetailsScreen extends StatelessWidget {
  const DiseaseDetailsScreen({
    Key? key,
    required this.disease,
  }) : super(key: key);

  final Disease disease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(disease.image, scale: 2)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              ),
              Text(
                "${disease.name} ${disease.alias}",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(height: defaultPadding),
              Text(
                "介绍",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(disease.introduction),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "介绍",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(disease.introduction),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "症状",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(disease.symptoms),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "诊断",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(disease.diagnosis),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "治疗及预后",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(disease.treatment),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Highlight(
                      name: "发病率",
                      text: disease.incidence,
                    ),
                    Highlight(
                      name: "医学专科",
                      text: disease.specialty,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentScreen(),
                    ),
                  ),
                  child: Text("返回"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
