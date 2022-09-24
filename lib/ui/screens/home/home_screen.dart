import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappstatusdownloader/core/viewmodel/home_viewmodel/home_viewmodel.dart';
import 'package:whatsappstatusdownloader/ui/screens/home/image_screen/image_screen.dart';
import 'package:whatsappstatusdownloader/ui/screens/home/video_screen/video_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Widget> pages = [
    const ImageScreen(),
    const VideoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModelProvider>(
      builder: (context, nav, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: pages[nav.currentPageIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value){
                nav.changeCurrentIndex(value);
              },
              currentIndex: nav.currentPageIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.image,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: "Image"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.business,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: "Video"),
              ]),
        );
      },
    );
  }
}
