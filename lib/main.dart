import 'package:audio_player_app/ui/audio_player/view/audio_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Audio Player',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AudioPlayerView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
