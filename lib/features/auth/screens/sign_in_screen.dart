import 'package:app/components/buttons/elevate_button.dart';
import 'package:app/components/loaders/screen_loader.dart';
import 'package:app/components/menus/prefix_menu.dart';
import 'package:app/components/menus/suffux_menu.dart';
import 'package:app/constants/data_constants.dart';
import 'package:app/di.dart';
import 'package:app/extensions/flutter_ext.dart';
import 'package:app/extensions/string_ext.dart';
import 'package:app/features/auth/view_models/sign_in_view_model.dart';
import 'package:app/libraries/flush_popup.dart';
import 'package:app/services/storage_service.dart';
import 'package:app/services/validators.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/assets.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/utils/size_config.dart';
import 'package:app/widgets/core/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _obscured = true;
  var _viewModel = SignInViewModel();
  var _modelData = SignInViewModel();
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _focusNodes = [FocusNode(), FocusNode()];

  @override
  void initState() {
    _email.text = sl<StorageService>().username;
    _password.text = sl<StorageService>().password;
    _focusNodes.forEach((item) => item.addListener(() => setState(() {})));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _viewModel.initViewModel());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _viewModel = Provider.of<SignInViewModel>(context, listen: false);
    _modelData = Provider.of<SignInViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _viewModel.disposeViewModel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: SizeConfig.width,
        height: SizeConfig.height,
        child: Stack(children: [_screenView(context), if (_modelData.loader) ScreenLoader()]),
      ),
    );
  }

  Widget _screenView(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      // clipBehavior: Clip.antiAlias,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.screen_padding),
      children: [
        SizedBox(height: SizeConfig.statusBar + 24),
        const SizedBox(height: 40),
        const SizedBox(height: 68),
        Text(
          'Welcome Back 👋🏻',
          textAlign: TextAlign.start,
          style: TextStyles.text26_600.copyWith(color: dark),
        ),
        const SizedBox(height: 04),
        Text(
          'Let’s login to your account & continue',
          textAlign: TextAlign.start,
          style: TextStyles.text16_500.copyWith(color: grey2),
        ),
        const SizedBox(height: 40),
        InputField(
          controller: _email,
          hintText: 'Email Address',
          focusNode: _focusNodes.first,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          prefixIcon: PrefixMenu(icon: Assets.svg.envelope, isFocus: _focusNodes.first.hasFocus),
        ),
        const SizedBox(height: 16),
        InputField(
          controller: _password,
          hintText: 'Password',
          obscureText: _obscured,
          focusNode: _focusNodes.last,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: PrefixMenu(icon: Assets.svg.lock, isFocus: _focusNodes.last.hasFocus),
          suffixIcon: SuffixMenu(
            icon: _obscured ? Assets.svg.eye_show : Assets.svg.eye_hide,
            isFocus: _focusNodes.last.hasFocus,
            onTap: () => setState(() => _obscured = !_obscured),
          ),
        ),
        const SizedBox(height: 32),
        ElevateButton(label: 'Login', width: double.infinity, onTap: _onSignInWithEmail),
        const SizedBox(height: 32),
        /*Row(
          children: [
            const Expanded(child: Divider()),
            const SizedBox(width: 16),
            Text('or Continue with', textAlign: TextAlign.center, style: TextStyles.text14_500.copyWith(color: grey2)),
            const SizedBox(width: 16),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 16),
        OutlineButton(label: 'Google', icon: Assets.svg_image.google),
        const SizedBox(height: 12),
        OutlineButton(label: 'Apple', icon: Assets.svg.apple),*/
      ],
    );
  }

  void _onSignInWithEmail() {
    minimizeKeyboard();
    var isEmail = sl<Validators>().email(_email.text);
    if (isEmail != null) return sl<FlushPopup>().onWarning(message: isEmail);
    var isPassword = sl<Validators>().password(_password.text);
    if (isPassword != null) return sl<FlushPopup>().onWarning(message: isPassword);
    var body = {'email': _email.text.toKey, 'password': _password.text, 'medium': EMAIL_LOGIN};
    _viewModel.signIn(body);
  }
}
