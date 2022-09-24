import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappstatusdownloader/ui/screens/home/video_screen/video_view.dart';


class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 0.0),
            colors: <Color>[
              Color(0xff3A3A4C),
              Color(0xff272636),
            ],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(10, (index){
            return GestureDetector(
              onTap: (){
                Navigator.push (context, CupertinoPageRoute(builder: (context)=> const VideoView()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
