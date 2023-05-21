class Disease {
  final String name,
      alias,
      introduction,
      symptoms,
      diagnosis,
      treatment,
      image,
      incidence,
      specialty;
  const Disease(
      {required this.name,
      required this.alias,
      required this.introduction,
      required this.symptoms,
      required this.diagnosis,
      required this.treatment,
      required this.image,
      required this.incidence,
      required this.specialty});
}

const List<Disease> demo_diseases = [
  Disease(
      name: '淋巴瘤',
      alias: 'lymphoma',
      introduction:
          '淋巴瘤（英文：lymphoma）又称淋巴癌，是由淋巴细胞病变造成的血液细胞瘤。此名称被用来单指癌症形式，而非所有这类肿瘤。最常见的早期症状是无痛性淋巴结肿大；而全身性症状，例如发烧、盗汗、体重减轻（此三者合称 B symptoms）、疲倦感甚或皮肤痒通常在晚期才出现，盗汗则通常在夜间发生',
      symptoms:
          '淋巴腺肿大是淋巴瘤患者最常见的病征，若癌细胞扩散至骨髓并损害造血系统时，会出现贫血、瘀肿及经常受细菌感染等现象。其他病征包括持续发热、夜间出汗、呼吸急促、消瘦、皮肤瘙痒和持续疲倦等',
      diagnosis:
          '通常藉由血液、尿液、骨髓检查诊断淋巴癌，而淋巴结切片可能有助于诊断。医学影像可用于淋巴癌细胞是否转移，而可发生转移处有肺、肝、脑等',
      treatment:
          '治疗淋巴瘤可能会合并化学治疗、放射线治疗、标靶治疗及手术等多种方式。非何杰金氏淋巴瘤患者的血液可能因蛋白质成分增多而较浓稠，需要接受血浆置换的治疗。某些型态的淋巴瘤可能必须采用所谓「观察等待」的策略，而某些型态则可治愈。在美国，何杰金氏淋巴瘤的五年整体存活率约85%，而非何杰金氏淋巴瘤则仅69%。在2012年，约有566,000人罹患淋巴瘤，并造成305,000死亡，占所有癌症的3至4%，为第七常见，而在儿童则为第三常见。相对于发展中国家，淋巴瘤通常多发生在发达国家。非何杰金氏淋巴瘤在美国的五年存活率为72%，何杰金氏淋巴瘤的五年存活率为87%。',
      image: 'assets/images/disease-lymphoma.jpeg',
      incidence: '0.2‱',
      specialty: '血液学、​肿瘤学'),
  Disease(
      name: '多发性⻣髓瘤',
      alias: '卡勒病',
      symptoms:
          '早期多发性骨髓瘤的病人可能没有任何特异症状，通常症状的出现是因为骨髓癌细胞在骨髓内大量堆积，骨头侵蚀和产生过量的异常抗体蛋白质（骨髓瘤蛋白），而造成一连串的病征。最主要的四个症状称为CRAB：C=Hypercalcemia（高血钙），R=Renal failure（肾衰竭），A=Anemia（贫血），B=Bone lesions（骨骼病灶）。',
      introduction:
          '多发性骨髓瘤（英语：Multiple myeloma、Plasma cell myeloma、Kahler\'s disease，缩写：MM）简称骨髓瘤（myeloma），是一种存在于骨髓内浆细胞（一种专责制造抗体的白血球）转化为癌细胞且发生克隆增殖的疾病，由于常在身上多处骨髓发生病灶而得名。多发性骨髓瘤一开始多半没有症状，若病情加重时，会有骨痛、常被感染、贫血的症状。 多发性骨髓瘤的并发症也包括淀粉样变。',
      diagnosis: """
      """,
      treatment: 'Disease',
      image: 'assets/images/disease-gusuiliu.jpg',
      incidence: '0.7%',
      specialty: '血液学及肿瘤学'),
  Disease(
      name: '急性髓样白血病',
      alias: '急性髓系白血病',
      introduction: '',
      symptoms: 'Disease',
      diagnosis: '',
      treatment: 'Disease',
      image: 'assets/images/disease-baixuebing.png',
      incidence: '0.2‱',
      specialty: '血液学及肿瘤学'),
  Disease(
      name: '血小板减少性紫癜',
      alias: '特发性血小板减少性紫癜',
      introduction:
          '特发性血小板减少性紫癜（英语：Idiopathic thrombocytopenic purpura，ITP）是因血小板免疫性破坏，导致外周血中血小板减少的出血性疾病。是最常见的血小板减少性紫癜，它是一种由复杂的多种机制共同参与的获得性自体免疫性疾病，其特征是孤立的血小板减少症，而没有临床上明显的情况导致血小板计数低；没有可靠的实验室检测来确认诊断。本病也称为原发免疫性血小板减少症(英语：primary immune thrombocytopenia)、自体免疫性血小板减少性紫癜（Autoimmune thrombocytopenia，ATP)。',
      symptoms: 'Disease',
      diagnosis: '',
      treatment: 'Disease',
      image: 'assets/images/disease-purpura.jpg',
      incidence: '0.8‱, 1.2‱',
      specialty: '血液学'),
  Disease(
      name: '急性淋巴细胞白血病',
      alias: 'Acute lymphoblastic leukemia',
      introduction: '',
      symptoms: 'Disease',
      diagnosis: '',
      treatment: 'Disease',
      image: 'assets/images/disease-Acute_leukemia-ALL.jpg',
      incidence: '0.067‱',
      specialty: '肿瘤学'),
  Disease(
      name: '过敏性紫癜',
      alias: 'IgA 血管炎',
      introduction:
          '过敏性紫癜（又称为 IgA 血管炎）是一种导致皮肤、关节、肠道和肾脏的小血管发炎、出血的疾病。这种血管炎最显著的特征是常见于腿部和臀部的紫色皮疹。过敏性紫癜还可能引起腹痛和关节疼痛。在极少数情况下，还会导致严重的肾脏损伤。',
      symptoms: 'Disease',
      diagnosis: '',
      treatment: 'Disease',
      image: 'assets/images/disease-zidian.jpg',
      incidence: '0.3‱～2.67‱',
      specialty: '血液学'),
  Disease(
      name: '再生障碍性贫血',
      alias: '再生障碍性贫血',
      introduction: '',
      symptoms: 'Disease',
      diagnosis: '',
      treatment: 'Disease',
      image: 'assets/images/disease-zaizhang.jpg',
      incidence: '0.074‱',
      specialty: '血液学及肿瘤学'),
  Disease(
      name: '噬血细胞综合症',
      alias: '噬血细胞综合征',
      introduction: '',
      symptoms: 'Disease',
      diagnosis: '',
      treatment: 'Disease',
      image: 'assets/images/disease-shixue.jpg',
      incidence: '0.01‱～0.1‱',
      specialty: '血液学'),
  Disease(
      name: '⻣髓增生异常综合征',
      alias: '骨髓发育不良综合征',
      introduction: '',
      symptoms: 'Disease',
      diagnosis: '',
      treatment: 'Disease',
      image: 'assets/images/disease-mds.jpg',
      incidence: '0.4‱',
      specialty: '血液学、肿瘤学')
];
