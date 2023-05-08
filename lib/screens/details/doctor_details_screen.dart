import 'package:doctor/components/heightlight.dart';
import 'package:doctor/components/rating.dart';
import 'package:doctor/constants.dart';
import 'package:doctor/screens/appointment/appointment_screen.dart';
import 'package:flutter/material.dart';

import '../../models/RecommendDoctor.dart';
import 'components/communication.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("彭军"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/images/pengjun.png", scale: 2)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Communication(),
              ),
              Text(
                "血液科 主任医师",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text("齐鲁医院"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                child: Rating(score: 5),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "专家简介",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(
                  "山东大学齐鲁医院血液科常务副主任、主任医师，山东大学高等医学研究院副院长、教授、博士生导师，长江学者特聘教授，教育部新世纪优秀人才，山东省优秀医师，获国家杰出青年科学基金，全国百篇优秀博士学位论文奖，教育部科技进步奖一等奖，山东省自然科学奖二等奖等，中国病理生理学会实验血液学专业委员会副主任委员、山东省医学会血液病学分会副主任委员。擅长免疫性血小板减少症（ITP），白血病，再生障碍性贫血，造血干细胞移植等常见疾病的诊治，主要从事ITP的免疫发病机制和免疫耐受研究。近年来发表SCI收录论文50余篇，以通讯/共同通讯作者在国际顶尖血液学杂志Blood发表论文14篇。作为负责人承担国自然重点项目、重大研究计划集成项目、重点支持项目、科技部973项目子课题等14项国家和部级课题。",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Highlight(
                      name: "接诊量",
                      text: "10K+",
                    ),
                    Highlight(
                      name: "资历",
                      text: "20 年",
                    ),
                    Highlight(
                      name: "学术论文",
                      text: "50+",
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
                  child: Text("预约"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
