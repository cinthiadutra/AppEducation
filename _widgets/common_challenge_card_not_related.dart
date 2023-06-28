import 'package:flutter/material.dart';
import 'package:flutter_appexp/challenges/domain/challenge.dart';
import 'package:flutter_appexp/content/controller/content_controller.dart';
import 'package:flutter_appexp/content/presentation/content_mock_not_related.dart';
import 'package:flutter_appexp/dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import '../_core/app_export.dart';
import '../_dialogs/app_loading.dart';

class CChallengeCardNotRelated extends StatefulWidget {
  final Challenge challenge;
  final int indexContent;
  final String idContent;
  const CChallengeCardNotRelated({
    Key? key,
    required this.challenge,
    required this.indexContent,
    required this.idContent,
  }) : super(key: key);

  @override
  State<CChallengeCardNotRelated> createState() =>
      _CChallengeCardNotRelatedState();
}

class _CChallengeCardNotRelatedState extends State<CChallengeCardNotRelated> {
  final controller = Get.find<ContentController>();
  final dashController = Get.find<DashboardController>();
  final loading = false.obs;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          Load().loaderListener(loading);
          loading.toggle();
          await controller.getListCommentsByEntity(widget.idContent.toString());
          loading.toggle();
          Get.to(
            ContentMockNotRelatedScreen(
              indexContent: widget.indexContent,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Pallete.gray200,
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 4.0,
              ),
            ],
          ),
          height: 130,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 1,
              ),
              Expanded(
                child: Image.network(
                  widget.challenge.imageUrl,
                  scale: 2.0,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: Get.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.people,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.challenge.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        widget.challenge.contentText,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Expanded(
                    //   flex: 1,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       // InkWell(
                    //       //   onTap: () {},
                    //       //   child: const Icon(
                    //       //     Icons.bookmark_border,
                    //       //     size: 18,
                    //       //   ),
                    //       // ),
                    //       const SizedBox(
                    //         width: 16,
                    //       ),
                    //       InkWell(
                    //         onTap: () {},
                    //         child: Row(
                    //           children: [
                    //             const Icon(
                    //               Icons.mode_comment_outlined,
                    //               size: 18,
                    //             ),
                    //             const SizedBox(
                    //               width: 5,
                    //             ),
                    //             Text('${widget.challenge.totalComents}')
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Checkbox(
                    activeColor: Pallete.greenCheck,
                    checkColor: Pallete.greenTick,
                    value: widget.challenge.isChecked!,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
              )
            ],
          ),
        ));
  }
}
