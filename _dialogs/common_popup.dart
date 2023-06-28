import 'package:flutter/material.dart';

Future<dynamic> showPopupDialog(
  BuildContext context, {
  String? title,
  required Widget content,
  Function? primaryButtonFunction,
  String primaryButtonText = "Compartilhar",
  Function? exitButtonFunction,
  String exitButtonText = "Fechar",
}) async {
  showDialog(
    context: context,
    builder: ((context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  (title != null) ? Text(title) : Container(),
                  content,
                  (primaryButtonFunction != null)
                      ? Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              primaryButtonFunction();
                            },
                            child: Text(primaryButtonText),
                          ),
                        )
                      : Container(),
                  (exitButtonFunction != null)
                      ? Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              exitButtonFunction();
                            },
                            child: Text(exitButtonText),
                          ),
                        )
                      : Container(),
                ],
              )
            ],
          ),
        ),
      );
    }),
  );
}
