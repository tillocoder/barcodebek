import 'package:barcodbek/src/core/style/app_colors.dart';
import 'package:barcodbek/src/core/style/app_icons.dart';
import 'package:barcodbek/src/core/style/text_style.dart';
import 'package:barcodbek/src/features/home/view/pages/home_Page.dart';
import 'package:barcodbek/src/features/sections/view/pages/sections_pages.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          'Profile',
          style: AppTextStyle.textStyle2,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ...List.generate(
            6,
            (index) => Padding(
                padding: const EdgeInsets.all(5),
                child: wSWButton(
                  index: index,
                  page: [
                    const HomePage(),
                  ],
                  context: context,
                  child: ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: AppColorss.c_D6BEFF, borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppIcons.profileIcons[index],
                        ),
                      ),
                    ),
                    title: Text(
                      profileTexts[index],
                      style: AppTextStyle.textStyle3,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

List<String> profileTexts = [
  'Edit Profile',
  'Sotuvchilarim',
  'Sozlash',
  'Savdo tarixi',
  'Terms & Privacy Policy',
  'Log Out',
];
