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
    var label = widget.report['label'];
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
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    result == 1 ? redColor : primaryColor),
                            child: Text(label),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: defaultPadding * 2),
                    for (var i = 0; i < 8; i++) ...[
                      Row(
                        children: [
                          Expanded(
                            child: buildMetricInfo(
                              i * 3 < 22
                                  ? widget.report['bloodtest'][i * 3]['name']
                                  : '',
                              i * 3 < 22
                                  ? widget.report['bloodtest'][i * 3]['alias']
                                  : '',
                              i * 3 < 22
                                  ? widget.report['bloodtest'][i * 3]['value']
                                  : '',
                              i * 3 < 22
                                  ? widget.report['bloodtest'][i * 3]['range']
                                  : '',
                            ),
                          ),
                          Expanded(
                            child: buildMetricInfo(
                              (i * 3 + 1) < 22
                                  ? widget.report['bloodtest'][(i * 3 + 1)]
                                      ['name']
                                  : '',
                              (i * 3 + 1) < 22
                                  ? widget.report['bloodtest'][(i * 3 + 1)]
                                      ['alias']
                                  : '',
                              (i * 3 + 1) < 22
                                  ? widget.report['bloodtest'][(i * 3 + 1)]
                                      ['value']
                                  : '',
                              (i * 3 + 1) < 22
                                  ? widget.report['bloodtest'][(i * 3 + 1)]
                                      ['range']
                                  : '',
                            ),
                          ),
                          Expanded(
                            child: buildMetricInfo(
                                (i * 3 + 2) < 22
                                    ? widget.report['bloodtest'][(i * 3 + 2)]
                                        ['name']
                                    : '',
                                (i * 3 + 2) < 22
                                    ? widget.report['bloodtest'][(i * 3 + 2)]
                                        ['alias']
                                    : '',
                                (i * 3 + 2) < 22
                                    ? widget.report['bloodtest'][(i * 3 + 2)]
                                        ['value']
                                    : '',
                                (i * 3 + 2) < 22
                                    ? widget.report['bloodtest'][(i * 3 + 2)]
                                        ['range']
                                    : ''),
                          ),
                        ],
                      ),
                      Divider(height: defaultPadding * 2),
                    ],
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

Column buildMetricInfo(String title, String alias, String text, String range) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        maxLines: 1,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: textColor.withOpacity(0.62),
        ),
      ),
      Text(
        alias,
        style: TextStyle(
          fontSize: 12,
          color: textColor.withOpacity(0.62),
        ),
      ),
      Text(
        range,
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor.withOpacity(0.62),
        ),
      ),
    ],
  );
}
