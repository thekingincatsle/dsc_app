import 'package:dsc_app/utils/colors.dart';
import 'package:dsc_app/utils/strings.dart';
import 'package:dsc_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class RecruitmentScreen extends StatelessWidget {
  static const tag = '/recruitment';
  const RecruitmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomedDrawer(),
      backgroundColor: BACK_GROUND_COLOR,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: BACK_GROUND_COLOR,
        centerTitle: true,
        title: Text(TITLE_RECRUITMENT,
            style: TextStyle(color: Colors.black87, fontSize: 18)),
      ),
      body: Center(
        child: const Text('Không có thông tin tuyển dụng'),
      ),
    );
  }
}
