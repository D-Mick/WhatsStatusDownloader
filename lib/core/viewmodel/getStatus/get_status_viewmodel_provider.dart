import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsappstatusdownloader/res/strings.dart';

class GetStatusViewModelProvider extends ChangeNotifier{
  void getAllStatus() async{
    final status = await Permission.storage.request();


    if(status.isDenied){
      Permission.storage.request();
      /// TODO: implement dialog to show users why it's important to accept the permission
      return;
    }

    Directory? directoryPath = await getExternalStorageDirectory();
    log(directoryPath!.path);

    if(status.isGranted){
      final directory = Directory(whatsAppPath);
      log(directory.toString());

      if(directory.existsSync()){
        final allStatus = directory.listSync(recursive: true);
        log(allStatus.toString());
      }else{
        log("No WhatsApp found!");
        // TODO: implement show users no whatsApp found
      }
    }
  }
}