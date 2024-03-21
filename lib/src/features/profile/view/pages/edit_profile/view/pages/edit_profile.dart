import 'package:barcodbek/src/core/componets/w_gap.dart';
import 'package:barcodbek/src/core/componets/w_text.dart';
import 'package:barcodbek/src/core/local/app_words.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/core/widgets/w_beac_button.dart';
import 'package:barcodbek/src/core/widgets/w_elvated_button.dart';
import 'package:barcodbek/src/features/profile/view/pages/edit_profile/controller/edit_controller.dart';
import 'package:barcodbek/src/features/profile/view/pages/edit_profile/view/widgets/wedit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditeProfile extends ConsumerWidget {
  const EditeProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(editController);
    var con = ref.read(editController);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WBeacButton(
                isChec: true,
                title: Words.edit_profile.tr(context),
              ),
              WGap.gap20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WText(
                    con.name ?? "Edit",
                    style: AppTextStyle.textStyle2,
                  ),
                  InkWell(
                    child: const Icon(CupertinoIcons.pen),
                    onTap: () {
                      con.onTap();
                    },
                  )
                ],
              ),
              Row(
                children: [
                  WEdit(
                    text: Words.send_a_message.tr(context),
                    controller: con.editingController,
                    con: con,
                    visible: con.isOnTap,
                    textInputType: TextInputType.text,
                    formater: [FilteringTextInputFormatter.singleLineFormatter],
                  ),
                  Visibility(
                    visible: con.isOnTap,
                    child: Expanded(
                      child: SizedBox(
                        height: 46,
                        child: WElevatedButton(
                          text: Words.send.tr(context),
                          onPressed: () {
                            if (con.editingController.text.isNotEmpty) {
                              con.nameOnTap(con.editingController.text);
                              con.editingController.clear();
                              con.isOnTap = !con.isOnTap;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: WText('Malumod yozmadigiz'),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              WText(
                "+998 90 000 00 00",
                style: AppTextStyle.textStyle2,
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
