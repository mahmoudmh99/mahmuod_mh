import 'dart:convert';

class AinmalModel {
  String image;
  String family;
  String name;
  AinmalModel({
    required this.image,
    required this.family,
    required this.name,
  });
  AinmalModel copyWith({
    String? image,
    String? family,
    String? name,
  }) {
    return AinmalModel(
      image: image ?? this.image,
      family: family ?? this.family,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'family': family,
      'name': name,
    };
  }

  factory AinmalModel.fromMap(Map<String, dynamic> map) {
    return AinmalModel(
        image: map['image'] as String,
        family: map['family'] as String,
        name: map['name'] as String);
  }
  String toJson() => json.encode(toMap());
  factory AinmalModel.fromJson(String source) =>
      AinmalModel.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() => 'AinmalModel(image:$image,family:$family,name:$name)';
  @override
  bool operator ==(covariant AinmalModel other) {
    if (identical(this, other)) return true;
    return other.image == image && other.family == family && other.name == name;
  }

  @override
  int get hashCode => image.hashCode ^ family.hashCode ^ name.hashCode;
}
