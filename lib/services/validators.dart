import 'package:app/di.dart';
import 'package:app/libraries/flush_popup.dart';
import 'package:app/utils/reg_exps.dart';

class Validators {
  String? name(String data) {
    if (data.isEmpty) return 'Please write your full name';
    return null;
  }

  String? email(String data) {
    if (data.isEmpty) return 'Please write your email address';
    if (!sl<RegExps>().email.hasMatch(data)) return 'Please write a valid email address';
    return null;
  }

  String? phone(String data) {
    if (data.isEmpty) return 'Please write your phone number';
    if (data.isNotEmpty && data.length != 10) return 'Phone number must be 10 digit';
    return null;
  }

  String? otpCode(String data) {
    if (data.isEmpty) return 'Please enter your verification code';
    if (data.length != 4) return 'verification code must be 4 digit';
    return null;
  }

  String? address(String data) {
    if (data.isEmpty) return 'Please write your address';
    return null;
  }

  String? profession(String data) {
    if (data.isEmpty) return 'Please write your profession';
    return null;
  }

  bool checkPassword(String data) => data.isNotEmpty && data.length >= 8 && sl<RegExps>().password.hasMatch(data);

  String? password(String data) {
    if (data.isEmpty) return 'Please enter your password';
    if (data.length < 6) return 'Password must be 6 characters or greater';
    var message = 'Password must contain a upper case, a lower case, a digit, a special character and a number';
    if (!sl<RegExps>().password.hasMatch(data)) return message;
    return null;
  }

  String? matchPassword(String pass, String confirmPass) {
    if (confirmPass.isEmpty) return 'Please enter your password';
    if (confirmPass.length < 6) return 'Password must be 6 characters or greater';
    var message = 'Password must contain a upper case, a lower case, a digit, a special character and a number';
    if (!sl<RegExps>().password.hasMatch(confirmPass)) return message;
    if (confirmPass != pass) return 'Password not matched. Please check your passwords.';
    return null;
  }

  void checkNewPass(String newPass) {
    if (newPass.isEmpty) return sl<FlushPopup>().onWarning(message: 'Please enter your new password first');
    if (newPass.length < 8) return sl<FlushPopup>().onWarning(message: 'New password must be 8 characters or greater');
    var message = 'Your new password must contain a upper case, a lower case, a digit, a special character and a number';
    if (!sl<RegExps>().password.hasMatch(newPass)) return sl<FlushPopup>().onWarning(message: message);
    return;
  }
}
