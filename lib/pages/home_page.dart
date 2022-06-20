import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:jobin_app/theme/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,',
                      style: subtitle.copyWith(color: secondary),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        'Afiv Dicky Efendy',
                        style: title,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'Categories',
                style: title.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: darkColor),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(16)),
                ),
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
