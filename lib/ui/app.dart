import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappstatusdownloader/core/viewmodel/home_viewmodel/home_viewmodel.dart';
import 'package:whatsappstatusdownloader/ui/screens/splash/splash_screen.dart';

class StatusDownloader extends StatelessWidget {
  const StatusDownloader({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:  [
      ChangeNotifierProvider(create: (_)=> HomeViewModelProvider()),
    ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
          home: SplashScreen()),
    );
  }
}
