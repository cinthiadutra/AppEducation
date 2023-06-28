import 'package:flutter/material.dart';
import 'package:flutter_appexp/_core/constants/pallete.dart';
import 'package:flutter_appexp/_widgets/common_drawer_app.dart';
import 'package:flutter_appexp/_widgets/widgets_export.dart';
import 'package:flutter_appexp/achievements/presentation/section/section_challenge.dart';
import 'package:flutter_appexp/achievements/presentation/section/section_ranking.dart';
import 'package:flutter_appexp/achievements/presentation/section/section_skills.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ExpacerAppBar(texto: 'Conquistas', estaNahome: false),
        endDrawer: customDrawer(context),
        backgroundColor: Pallete.whiteA700,
        body: FutureBuilder(
          future: controller.fazerFluxoDashboard(),
            builder: (BuildContext context, snap) {
              switch (snap.connectionState) {
                case ConnectionState.none:
                  return Container();
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  return ListView(shrinkWrap: true, children: const [
                    SectionRanking(),
                    SectionDesafios(),
                    SectionSkills()
                  ]);
              }
            }
        ));
  }
}
