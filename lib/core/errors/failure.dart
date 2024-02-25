abstract class Failure{

  final String message;
  final int statusCode;

  const Failure({
    required this.message,
    required this.statusCode
  });
}

class ApiFailure extends Failure{
  const ApiFailure({
    required super.message,
    required super.statusCode
  });
}