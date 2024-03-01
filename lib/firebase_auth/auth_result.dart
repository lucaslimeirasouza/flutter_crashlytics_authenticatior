class AuthResult {
  final String? msgError;

  AuthResult({this.msgError});

  bool get isSuccess => msgError == null;
}
