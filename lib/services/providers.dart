import 'package:app/features/auth/view_models/sign_in_view_model.dart';
import 'package:app/features/home/home_view_model.dart';
import 'package:app/global_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => GlobalViewModel()),
  // Auth
  ChangeNotifierProvider(create: (_) => SignInViewModel()),
  // Home
  ChangeNotifierProvider(create: (_) => HomeViewModel()),
];
