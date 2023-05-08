class RecommendedDoctor {
  final String name, speciality, institute, image;

  const RecommendedDoctor({
    required this.name,
    required this.speciality,
    required this.institute,
    required this.image,
  });
}

const List<RecommendedDoctor> demo_recommended_doctor = [
  RecommendedDoctor(
    name: "纪春岩 主任医师",
    speciality: "血液科",
    institute: "齐鲁医院",
    image: "assets/images/jichunyan.png",
  ),
  RecommendedDoctor(
    name: "侯明 主任医师",
    speciality: "血小板疾病、淋巴瘤、白血病",
    institute: "齐鲁医院",
    image: "assets/images/houming.png",
  ),
  RecommendedDoctor(
    name: "刘传方 主任医师",
    speciality: "贫血、白血病、淋巴瘤",
    institute: "齐鲁医院",
    image: "assets/images/liuchuanfang.png",
  ),
  RecommendedDoctor(
    name: "彭军 主任医师",
    speciality: "免疫性血小板减少症",
    institute: "齐鲁医院",
    image: "assets/images/pengjun.png",
  ),
  RecommendedDoctor(
    name: "徐从高 主任医师",
    speciality: "血液肿瘤",
    institute: "齐鲁医院",
    image: "assets/images/xuconggao.png",
  ),
];
