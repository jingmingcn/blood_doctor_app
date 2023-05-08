class AvailableDoctor {
  final String? name, sector, patients, image;
  final int? experience;

  AvailableDoctor(
      {this.name, this.sector, this.experience, this.patients, this.image});
}

List<AvailableDoctor> demoAvailableDoctors = [
  AvailableDoctor(
    name: "陈学良",
    sector: "主任医师",
    experience: 30,
    patients: '1.08K',
    image: "assets/images/chenxueliang.png",
  ),
  AvailableDoctor(
    name: "宋强",
    sector: "主任医师",
    experience: 30,
    patients: '2.7K',
    image: "assets/images/songqiang.png",
  ),
  AvailableDoctor(
    name: "王鲁群",
    sector: "主任医师",
    experience: 20,
    patients: '2.7K',
    image: "assets/images/wangluqun.png",
  ),
  AvailableDoctor(
    name: "陈春燕",
    sector: "主任医师",
    experience: 20,
    patients: '2.7K',
    image: "assets/images/chenchunyan.png",
  ),
  AvailableDoctor(
    name: "董孝媛",
    sector: "副主任医师",
    experience: 10,
    patients: '2.7K',
    image: "assets/images/dongxiaoyuan.png",
  ),
];
