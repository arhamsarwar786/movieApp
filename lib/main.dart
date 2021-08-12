import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/download_provider.dart';
import 'Screens/splash.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

void main() async{
  runApp(MyApp());
   var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
   await Hive.openBox("downloadKey");
   await Hive.openBox("favKey");
   await Hive.openBox("downloadVal");
   await Hive.openBox("favVal");
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.amber,
  ));


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FileDownloaderProvider(),
          child: Splash(),
        ),
      ],
      child: MaterialApp(
          title: 'File Downloader',
          debugShowCheckedModeBanner: false,
          home: SafeArea(bottom: false, 
            child: Scaffold(
              primary: false,
              body: Splash(),
            )
          )
      )
    );
  }
}


