import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlearning/common/global.dart';
import 'package:xlearning/common/routes/names.dart';
import 'package:xlearning/common/values/constant.dart';
// import 'package:xlearning/screens/application/bloc/app_blocs.dart';
import 'package:xlearning/screens/application/bloc/app_events.dart';
import 'package:xlearning/screens/home/bloc/home_page_blocs.dart';
import 'package:xlearning/screens/home/bloc/home_page_events.dart';
import 'package:xlearning/screens/profile/settings/bloc/settings_blocs.dart';

import '../../../common/widgets/base_text_widget.dart';
import 'bloc/settings_states.dart';
import '../settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    // context.read<AppBlocs>().add(const TriggerAppEvent(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Settings"),
      body: SingleChildScrollView(child:
          BlocBuilder<SettingsBlocs, SettingStates>(builder: (context, state) {
        return Column(
          children: [settingsButton(context, removeUserData)],
        );
      })),
    );
  }
}
