import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_push_notification_remote_config_desafio/firebase_auth/auth_interface.dart';
import 'package:flutter_push_notification_remote_config_desafio/firebase_auth/auth_result.dart';

class CustomFirebaseAuth implements AuthInterface {
  CustomFirebaseAuth._internal();
  static final CustomFirebaseAuth _singleton = CustomFirebaseAuth._internal();
  factory CustomFirebaseAuth() => _singleton;

  @override
  Future<AuthResult> login(String user, String pass) async {
    if (_isValidsInputs(user, pass)) {
      try {
        var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user,
          password: pass,
        );
        return result.user != null
            ? AuthResult()
            : AuthResult(msgError: 'Not Authenticated');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'week-password') {
          return AuthResult(msgError: 'The password provided is too weak');
        } else if (e.code == 'email-already-in-use') {
          return AuthResult(
              msgError: 'The account already exists for that email');
        }
      } catch (e) {
        return AuthResult(msgError: e.toString());
      }
    }
    return AuthResult(msgError: 'Not Register, Invalid Inpts');
  }

  @override
  Future<AuthResult> register(String user, String pass) async {
    if (_isValidsInputs(user, pass)) {
      try {
        var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user,
          password: pass,
        );
        return result.user != null
            ? AuthResult()
            : AuthResult(msgError: 'Not Authenticated');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'week-password') {
          return AuthResult(msgError: 'The password provided is too weak');
        } else if (e.code == 'email-already-in-use') {
          return AuthResult(
              msgError: 'The account already exists for that email');
        }
      } catch (e) {
        return AuthResult(msgError: e.toString());
      }
    }
    return AuthResult(msgError: 'Not Register, Invalid Inpts');
  }

  bool _isValidsInputs(String user, String pass) =>
      user.isNotEmpty && pass.isNotEmpty && pass.length >= 6;
}
