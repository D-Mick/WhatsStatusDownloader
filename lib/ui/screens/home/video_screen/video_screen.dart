import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappstatusdownloader/core/viewmodel/getStatus/get_status_viewmodel_provider.dart';
import 'package:whatsappstatusdownloader/ui/screens/home/video_screen/video_view.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  //variable to make sure we don't keep calling the getAllStatus everytime
  bool fetched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GetStatusViewModelProvider>(
          builder: (context, data, child) {
            if(fetched == false){
              data.getAllStatus('.mp4');
              Future.delayed(Duration(milliseconds: 1), (){
                fetched = true;
              });
            }
            return data.getWhatsAppAvailable == false ? const Center(
              child: Text("WhatsApp not available"),
            ) : data.getWhatsAppVideos.isEmpty ?
            const Center(
              child: Text("No videos found"),
            ) :
            Container(
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
                children: List.generate(data.getWhatsAppVideos.length, (index){
                  final videos = data.getWhatsAppVideos[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push (context, CupertinoPageRoute(builder: (context)=> const VideoView()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Image(
                        image: FileImage(File(videos.path)),
                      ),
                    ),
                  );
                }),
              ),
            );
          }
      ),
    );
  }
}
