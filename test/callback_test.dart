import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void readData(void Function() onDataReadComplete) {
  print('Reading data');
  onDataReadComplete();
}

abstract class OnDataReadComplete {
  void call();
}

class MockOnDataReadComplete extends Mock implements OnDataReadComplete {}

void main() {
  test('onDataReadComplete gets called whenever readData runs', () {
    //Creates the mock object
    final mockOnDataReadComplete = MockOnDataReadComplete();

    //Runs the function
    readData(mockOnDataReadComplete);

    //Confirm that the mock object is called
    verify(mockOnDataReadComplete()).called(1);
  });
}
