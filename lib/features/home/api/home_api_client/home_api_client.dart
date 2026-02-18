import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeApiClient {
  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return ['Category 1', 'Category 2', 'Category 3'];
  }

  Future<List<ProductDto>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ProductDto(
        id: 1,
        name: 'Product 1',
        description: 'Description for Product 1',
        price: 29.99,
        image: 'https://example.com/product1.jpg',
      ),
      ProductDto(
        id: 2,
        name: 'Product 2',
        description: 'Description for Product 2',
        price: 49.99,
        image: 'https://example.com/product2.jpg',
      ),
      ProductDto(
        id: 3,
        name: 'Product 3',
        description: 'Description for Product 3',
        price: 59.99,
        image: 'https://example.com/product3.jpg',
      ),
    ];
  }
}
