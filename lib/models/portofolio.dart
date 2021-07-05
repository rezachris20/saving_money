part of 'models.dart';

class Portofolio {
  final String id;
  final String name;
  final int target;
  final int isActive;
  final int isAchievement;
  final int mySavings;
  final DateTime lastSavings;

  Portofolio(
      {this.id,
      this.name,
      this.target,
      this.isActive,
      this.isAchievement,
      this.mySavings,
      this.lastSavings});

  factory Portofolio.fromJson(Map<String, dynamic> data) => Portofolio(
      id: data['portofolio']['id'].toString(),
      name: data['portofolio']['name'],
      target: data['target'],
      isActive: data['is_active'],
      mySavings: data['my_saving'],
      lastSavings: DateFormat("yyyy-MM-dd").parse(data['last_saving']),
      isAchievement: data['is_achievement']);

  factory Portofolio.fromJsonDropdown(Map<String, dynamic> data) => Portofolio(
      id: data['portofolio']['id'].toString(),
      name: data['portofolio']['name'],
      target: data['target'],
      isActive: data['is_active'],
      isAchievement: data['is_achievement']);

  factory Portofolio.jsonSuccess(Map<String, dynamic> data) => Portofolio(
        id: data['id'].toString(),
        name: data['name'],
      );
  
  factory Portofolio.jsonAddTarget(Map<String, dynamic> data) => Portofolio(
    id: data['id'].toString(),
    target: data['target']
  );

  Portofolio copyWith(
          {String id,
          String name,
          int target,
          int isActive,
          int isAchievement,
          DateTime lastSavings,
          int mySavings}) =>
      Portofolio(
          id: id ?? this.id,
          name: name ?? this.name,
          target: target ?? this.target,
          isActive: isActive ?? this.isActive,
          isAchievement: isAchievement ?? this.isAchievement,
          lastSavings: lastSavings ?? this.lastSavings,
          mySavings: mySavings ?? this.mySavings);
  @override
  List<Object> get props =>
      [id, name, target, isActive, isAchievement, mySavings, lastSavings];
}

List<Portofolio> mockPortofolio = [
  Portofolio(
    id: '1',
    name: 'Pensiun',
    target: 4000000,
    isActive: 1,
    isAchievement: 1,
  ),
  Portofolio(
    id: '3',
    name: 'Camera',
    target: 5000000,
    isActive: 1,
    isAchievement: 1,
  ),
  Portofolio(
    id: '4',
    name: 'Lain-Lain',
    target: 5000000,
    isActive: 1,
    isAchievement: 1,
  ),
];
