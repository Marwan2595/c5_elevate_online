import 'package:c5_elevate_online/calculator.dart';
import 'package:test/test.dart';

//AAA Rule
//Arrange - > create and get all dependencies and variables
//Act - > call the function under testing
//Assert - > check the result

//setUp - > this is a function that runs before each test
//setUpAll - > this is a function that runs once before all tests
//tearDown - > this is a function that runs after each test
//tearDownAll -> this is a function that runs once after all tests
void main() {
  late Calculator calculator;

  setUp(() {
    print(">>>>>>>>>>>This is setup");
  });
  setUpAll(() {
    print(">>>>>>>>>>>This is setUpAll");
    calculator = Calculator();
  });
  tearDown(() {
    print(">>>>>>>>>>>This is tearDown");
  });
  tearDownAll(() {
    print(">>>>>>>>>>>This is tearDownAll");
  });

  test("Test add two positive numbers returns a positive number", () {
    print("Test add two positive numbers");
    //Arrange
    int num1 = 2;
    int num2 = 5;
    //Act
    int result = calculator.add(num1, num2);
    //Assert
    expect(result, 7);
    expect(result, isPositive);
    expect(result, isNotNull);
    expect(result, isA<int>());
  });

  test("Test add one zero and one non-zero number", () {
    print("Test add one zero and one non-zero number");
    //Arrange
    int num1 = 0;
    int num2 = 5;
    //Act
    int result = calculator.add(num1, num2);
    //Assert
    expect(result, num2);
    expect(result, isPositive);
    expect(result, isNotNull);
    expect(result, isA<int>());
  });
}
//dry => don't repeat yourself