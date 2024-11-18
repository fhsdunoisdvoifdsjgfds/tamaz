import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/utils.dart';
import '../core/fonts.dart';
import '../widgets/cup_button.dart';
import '../widgets/my_svg.dart';
import '../widgets/title_data.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10 + getTop(context)),
        const TitleText('Settings'),
        const Spacer(),
        const _Button(id: 1, title: 'Profile'),
        const _Button(id: 3, title: 'Privacy Policy'),
        const _Button(id: 4, title: 'Terms of use'),
        const _Button(id: 5, title: 'Support page'),
        const Spacer(flex: 2),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(
        bottom: 16,
        left: 32,
        right: 32,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff333333),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupButton(
        onPressed: () {
          if (id == 1) {
            context.push('/profile');
          } else if (id == 3) {
            launchUrl(Uri.parse(
                'https://docs.google.com/document/d/12jkEi8y18V9_4XJMk9DooxaNkjw7zeZZNNdq_CX0VeQ/edit?usp=sharing'));
          } else if (id == 4) {
            launchUrl(Uri.parse(
                'https://docs.google.com/document/d/1mL3XSjn8mSM9haEbvtG7yS-p5B3bOCxL9HR8OAkb1X0/edit?usp=sharing'));
          } else if (id == 5) {
            launchUrl(Uri.parse('https://forms.gle/auQDgktWJSf9eGRn6'));
          }
        },
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: Center(
                child: MySvg('assets/s$id.svg'),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: Fonts.w400,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }
}
