import 'package:app/components/sheets/log_out_sheet.dart';
import 'package:app/features/home/home_view_model.dart';
import 'package:app/themes/colors.dart';
import 'package:app/themes/text_styles.dart';
import 'package:app/utils/dimensions.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _viewModel = HomeViewModel();
  var _modelData = HomeViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _viewModel.initViewModel());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    SizeConfig.initMediaQuery(context);
    _viewModel = Provider.of<HomeViewModel>(context, listen: false);
    _modelData = Provider.of<HomeViewModel>(context);
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
      appBar: AppBar(
        title: const Text('Home'),
        actions: [const InkWell(onTap: logoutSheet, child: Icon(Icons.logout)), SizedBox(width: ACTION_SIZE)],
      ),
      body: Container(
        width: SizeConfig.width,
        height: SizeConfig.height,
        child: _screenView(context),
      ),
    );
  }

  Widget _screenView(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      clipBehavior: Clip.antiAlias,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.screen_padding),
      children: [
        const SizedBox(height: 12),
        Text('Hello Bruce 👋🏻', style: TextStyles.text20_500.copyWith(color: grey3)),
        const SizedBox(height: 02),
        Text('Welcome to Boilerplate', style: TextStyles.text22_600.copyWith(color: dark)),
        const SizedBox(height: 24),
        const SizedBox(height: 24),
      ],
    );
  }
}
