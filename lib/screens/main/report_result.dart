import 'package:doctor/constants.dart';
import 'package:flutter/material.dart';

class ReportResult extends StatefulWidget {
  final Map<String, dynamic> report;

  ReportResult({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  _ReportResultState createState() => _ReportResultState();
}

class _ReportResultState extends State<ReportResult> {
  @override
  Widget build(BuildContext context) {
    var result = widget.report['result'];
    return Scaffold(
      appBar: AppBar(title: Text("风险预警报告")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultPadding / 2)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style:
                                TextButton.styleFrom(backgroundColor: redColor),
                            child: Text(result),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: defaultPadding * 2),
                    Row(
                      children: [
                        Expanded(
                          child: buildMetricInfo("日期", ""),
                        ),
                        Expanded(
                          child: buildMetricInfo("时间", "上午 10:30"),
                        ),
                        Expanded(
                          child: buildMetricInfo("医师", "彭军"),
                        ),
                      ],
                    ),
                    Divider(height: defaultPadding * 2),
                    Row(
                      children: [
                        Expanded(
                          child: buildMetricInfo(
                            "科室",
                            "血液科",
                          ),
                        ),
                        Expanded(
                          child: buildMetricInfo("医院", "齐鲁医院"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Column buildMetricInfo(String title, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: textColor.withOpacity(0.62),
        ),
      ),
      Text(
        text,
        maxLines: 1,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    ],
  );
}
