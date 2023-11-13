abstract class TextFieldValidator<T> {
  TextFieldValidator({required this.errorText});

  final String errorText;

  bool isValid(T value);

  String? call(T value) {
    return isValid(value) ? null : errorText;
  }
}
