import 'package:flutter/material.dart';
import 'package:flutter_appexp/content/controller/content_controller.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../_core/app_export.dart';
import '../challenges/presentation/challenge_screen/challenge_screen.dart';
import 'common_title_local.dart';
import '../_dialogs/app_loading.dart';

class CPercentBar extends StatefulWidget {
  final String title;
  final int amount;
  final int total;
  final int index;

  final Function? onClick;

  const CPercentBar({
    Key? key,
    required this.title,
    required this.amount,
    required this.total,
    required this.index,

    this.onClick,
  }) : super(key: key);

  @override
  State<CPercentBar> createState() => _CPercentBarState();

}

class _CPercentBarState extends State<CPercentBar> {
  final controller = Get.find<ContentController>();
  final dashController = Get.find<DashboardController>();
  final loading = false.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Load().loaderListener(loading);
        loading.toggle();
        await dashController.getChallenge(widget.index);
        loading.toggle();
        Get.to(ChallengeScreen(
          index: widget.index,
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CTitleLocal(widget.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: LinearPercentIndicator(
                    percent: widget.amount / widget.total,
                    lineHeight: 9,
                    progressColor: (widget.amount < widget.total)
                        ? Pallete.blueProgress
                        : fromHex("#a3dd59"),
                    backgroundColor: Pallete.greyProgress,
                    barRadius: const Radius.circular(20),
                    alignment: MainAxisAlignment.start,
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  "${widget.amount}/${widget.total}",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
