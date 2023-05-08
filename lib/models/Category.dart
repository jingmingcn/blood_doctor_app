class Category {
  final String icon, title;

  const Category({required this.icon, required this.title});
}

const List<Category> demo_categories = [
  Category(icon: "assets/icons/Pediatrician.svg", title: "血液科"),
  Category(icon: "assets/icons/Neurosurgeon.svg", title: "脑神经科"),
  Category(icon: "assets/icons/Cardiologist.svg", title: "心脏病科"),
  Category(icon: "assets/icons/Psychiatrist.svg", title: "心理科"),
];
