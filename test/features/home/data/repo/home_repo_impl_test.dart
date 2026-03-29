import 'package:c5_elevate_online/config/base_response/base_response.dart';
import 'package:c5_elevate_online/features/home/api/data_sources/home_local_data_source_impl.dart';
import 'package:c5_elevate_online/features/home/api/data_sources/home_remote_data_source_impl.dart';
import 'package:c5_elevate_online/features/home/data/models/product_dto.dart';
import 'package:c5_elevate_online/features/home/data/repo/home_repo_impl.dart';
import 'package:c5_elevate_online/features/home/domain/models/product_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSourceImpl, HomeLocalDataSourceImpl])
void main() {
  //Arrange
  late HomeRepoImpl homeRepoImpl;
  late MockHomeRemoteDataSourceImpl mockHomeRemoteDataSource;
  late MockHomeLocalDataSourceImpl mockHomeLocalDataSource;
  late List<ProductDTO> productsDTOs;
  late String errMsg;
  setUpAll(() {
    errMsg = "Something went wrong. Please try again later.";
    productsDTOs = List.generate(
      5,
      (index) => ProductDTO(
        id: index.toString(),
        title: "Product $index",
        price: index + 1000,
        imageCover: "https://via.placeholder.com/150 ${index.toString()}",
      ),
    );
    provideDummy<BaseResponse<List<ProductDTO>>>(
      SuccessBaseResponse<List<ProductDTO>>(data: []),
    );

    mockHomeRemoteDataSource = MockHomeRemoteDataSourceImpl();
    mockHomeLocalDataSource = MockHomeLocalDataSourceImpl();
    homeRepoImpl = HomeRepoImpl(
      mockHomeRemoteDataSource,
      mockHomeLocalDataSource,
    );
  });

  group("Get Products Function Test Group", () {
    group("Success Cases", () {
      test("Test Success Case with empty data (no products DTOs)", () async {
        //Arrange
        when(mockHomeRemoteDataSource.getProducts()).thenAnswer(
          (_) async => SuccessBaseResponse<List<ProductDTO>>(data: []),
        );

        //ACT
        final result = await homeRepoImpl.getProducts();

        //Assert
        expect(result, isA<SuccessBaseResponse<List<ProductModel>>>());
        expect(
          (result as SuccessBaseResponse<List<ProductModel>>).data,
          isEmpty,
        );
        verify(mockHomeRemoteDataSource.getProducts()).called(1);
        verifyNever(mockHomeRemoteDataSource.getCategories());
      });
      test("Test Success Case with 5 DTOs", () async {
        //Arrange

        when(mockHomeRemoteDataSource.getProducts()).thenAnswer(
          (_) async =>
              SuccessBaseResponse<List<ProductDTO>>(data: productsDTOs),
        );

        //ACT
        final result = await homeRepoImpl.getProducts();

        //Assert
        expect(result, isA<SuccessBaseResponse<List<ProductModel>>>());
        expect(
          (result as SuccessBaseResponse<List<ProductModel>>).data.length,
          productsDTOs.length,
        );

        //Product with index 0
        expect(result.data[0].title, productsDTOs[0].title);
        expect(result.data[0].id, productsDTOs[0].id);
        expect(result.data[0].price, productsDTOs[0].price);
        expect(result.data[0].image, productsDTOs[0].imageCover);

        //Last Product
        expect(result.data.last.title, productsDTOs.last.title);
        expect(result.data.last.id, productsDTOs.last.id);
        expect(result.data.last.price, productsDTOs.last.price);
        expect(result.data.last.image, productsDTOs.last.imageCover);

        verify(mockHomeRemoteDataSource.getProducts()).called(1);
        verifyNever(mockHomeRemoteDataSource.getCategories());
      });
    });

    group("Failure Cases", () {
      test("Test Error Case with Error Message", () async {
        //Arrange

        when(mockHomeRemoteDataSource.getProducts()).thenAnswer(
          (_) async =>
              ErrorBaseResponse<List<ProductDTO>>(errorMessage: errMsg),
        );
        //ACT
        final result = await homeRepoImpl.getProducts();

        //Assert
        expect(result, isA<ErrorBaseResponse<List<ProductModel>>>());
        expect(
          (result as ErrorBaseResponse<List<ProductModel>>).errorMessage,
          isNotEmpty,
        );
        expect(result.errorMessage, isNotNull);
        expect(result.errorMessage, errMsg);

        verify(mockHomeRemoteDataSource.getProducts()).called(1);
        verifyNever(mockHomeRemoteDataSource.getCategories());
      });
    });
  });
}
