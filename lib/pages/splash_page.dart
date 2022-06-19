import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobin_app/pages/starter_page.dart';
import 'package:jobin_app/theme/style.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const StarterPage(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: const Color(0xff696999),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xff696999),
                  boxShadow: [
                    const BoxShadow(
                      offset: Offset(4, 4),
                      color: Colors.black45,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      offset: const Offset(-4, -4),
                      color: secondary,
                      blurRadius: 5,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Icon(
                  Icons.work,
                  size: 100,
                  color: whiteColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'JobIn',
                  style: tagline,
                ),
              ),
              Text(
                'Find your new job anywhere',
                style: subtitle.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
