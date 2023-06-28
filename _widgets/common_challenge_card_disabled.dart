import 'package:flutter/material.dart';
import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter_appexp/challenges/domain/challenge.dart';
import 'package:get/get.dart';

class CChallengeDisableCard extends StatefulWidget {
  final Challenge challenge;
  final int indexContent;
  const CChallengeDisableCard({
    Key? key,
    required this.challenge,
    required this.indexContent,
  }) : super(key: key);

  @override
  State<CChallengeDisableCard> createState() => _CChallengeDisableCardState();
}

class _CChallengeDisableCardState extends State<CChallengeDisableCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: const Color.fromARGB(255, 241, 236, 236),
            boxShadow: [
              BoxShadow(
                color: Pallete.gray200,
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 4.0,
              ),
            ],
          ),
          height: 125,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 2,
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
                      flex: 3,
                      child: Text(
                        widget.challenge.contentText,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       InkWell(
                    //         onTap: () {},
                    //         child: const Icon(
                    //           Icons.bookmark_border,
                    //           size: 18,
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 16,
                    //       ),
                    //       InkWell(
                    //         onTap: () {},
                    //         child: Row(
                    //           children: const [
                    //             Icon(
                    //               Icons.mode_comment_outlined,
                    //               size: 18,
                    //             ),
                    //             SizedBox(
                    //               width: 5,
                    //             ),
                    //             Text('3')
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
                    value: isChecked,
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
