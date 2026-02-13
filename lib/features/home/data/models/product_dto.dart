import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';

class ProductDto  {
  int? id;
  String? name;
  String? description;
  double? price;
  String? image;

  ProductDto({this.id, this.name, this.description, this.price, this.image});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }

  ProductModel toDomain() {
    return ProductModel(
      id: id ?? 0,
      title: name ?? "",
      description: description ?? "",
      price: price ?? 0,
      image: image ?? "",
    );
  }
}
