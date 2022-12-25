import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class LoginController extends ControllerMVC {
  final status = PublishSubject<bool>();
  login() => status.add(true);
}
