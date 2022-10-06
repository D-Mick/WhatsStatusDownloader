import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappstatusdownloader/core/viewmodel/getStatus/get_status_viewmodel_provider.dart';
import 'package:whatsappstatusdownloader/ui/screens/home/image_screen/image_view.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetStatusViewModelProvider>(context, listen: false).getAllStatus();
  }

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
                Navigator.push (context, CupertinoPageRoute(builder: (context)=> const ImageView()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
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
