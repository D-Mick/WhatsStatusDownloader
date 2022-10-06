import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsappstatusdownloader/res/strings.dart';

class GetStatusViewModelProvider extends ChangeNotifier{
  List<FileSystemEntity> _getWhatsAppImages = [];
  List<FileSystemEntity> _getWhatsAppVideos = [];

  //loading state
  bool _getAvailableWhatsApp = false;

  List<FileSystemEntity> get getWhatsAppImages => _getWhatsAppImages;

  List<FileSystemEntity> get getWhatsAppVideos=> _getWhatsAppVideos;

  bool get getWhatsAppAvailable => _getAvailableWhatsApp;

  void getAllStatus(String fileExtension) async{
    final status = await Permission.storage.request();


    if(status.isDenied){
      Permission.storage.request();
      /// TODO: implement dialog to show users why it's important to accept the permission
      return;
    }

    if(status.isGranted){
      final directory = Directory(whatsAppPath);
      log(directory.toString());

      if(directory.existsSync()){
        final allStatusItems = directory.listSync();

        //condition to know which file extension and put them in their respective list
        if(fileExtension == ".jpg"){
          _getWhatsAppImages = allStatusItems.where((element) => element.path.endsWith('.jpg')).toList();
          notifyListeners();
        }else{
          _getWhatsAppVideos = allStatusItems.where((element) => element.path.endsWith('.mp4')).toList();
          notifyListeners();
        }

        _getAvailableWhatsApp = true;
        notifyListeners();
      }else{
        log("No WhatsApp found!");
        _getAvailableWhatsApp = false;
        notifyListeners();
      }
    }
  }
}