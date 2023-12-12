import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlearning/common/global.dart';
import 'package:xlearning/common/values/colors.dart';
import 'package:xlearning/common/widgets/base_text_widget.dart';
import 'package:xlearning/screens/profile/bloc/profile_blocs.dart';
import 'package:xlearning/screens/profile/bloc/profile_events.dart';
import 'package:xlearning/screens/profile/bloc/profile_states.dart';
import 'package:xlearning/screens/profile/widgets/profile_widgets.dart';
import 'package:xlearning/common/widgets/base_text_widget.dart' as reusableText;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var userProfile = Global.storageService.getUserProfile();
    print('user profile is ${jsonEncode(userProfile)}');
    context.read<ProfileBlocs>().add(TriggerProfileName(userProfile));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBlocs, ProfileStates>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //for showing profile image
                profileIconAndEditButton(),
                SizedBox(
                  height: 30.h,
                ),
                //for showing profile name
                buildProfileName(state),
                //build row buttons
                buildRowView(context),

                // SizedBox(height: 30.h,),
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: buildListView(context),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
