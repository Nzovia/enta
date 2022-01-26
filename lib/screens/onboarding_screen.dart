import 'package:enta/components/widgets/body_widget.dart';
import 'package:enta/components/widgets/buttons_widget.dart';
import 'package:enta/screens/create_user.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            //holds all the pages
            PageViewModel(
              title: "ENTA",
              bodyWidget: const BodyWidget(),
              image: buildImage("assets/popcorn.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Movies",
              body: "Enjoy your movies, series, animes and "
                  "Trailers from your personal devices",
              image: buildImage("assets/popcorn.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Music",
              body: "Enjoy your Music and Videos and download",
              image: buildImage("assets/music.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Novels & Mangas",
              body:
                  "Book readers with this feature can enjoy the favorite novels and "
                  "mangas straight from your devices",
              image: buildImage("assets/book.png"),
              footer: ButtonWidget(
                text: "Get Started",
                onClicked: () => gotHome(context),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text(
            "Continue",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200),
          ),
          //what happens when done
          onDone: () => gotHome(context),
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: getDotsDecorations(),
          animationDuration: 1000,
          skipFlex: 0,
          nextFlex: 0,
        ),
      );

  buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 700,
        ),
      );

  //styling for our dots navigator
  getDotsDecorations() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        size: Size(10.0, 10.0),
        activeSize: Size(20, 20),
        activeColor: Colors.green,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  //styling for the page
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.w900, fontSize: 45, color: Colors.black45),
        bodyTextStyle:
            const TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
        descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),

        pageColor: Colors.white,
      );

  //a method to navigate when onBoarding is done,
  void gotHome(context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => CreateUser()));
  }
}
