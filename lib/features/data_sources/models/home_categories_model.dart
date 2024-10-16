class HomeCategoriesModel {
  final int? id;
  final String? name;
  final String? image;

  HomeCategoriesModel({
    this.id,
    this.name,
    this.image,
  });

  factory HomeCategoriesModel.fromJson(Map<String, dynamic> json) =>
      HomeCategoriesModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}