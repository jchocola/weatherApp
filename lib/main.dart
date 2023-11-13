import 'package:flutter/material.dart';
import 'LoadingScreen.dart';
void main()
{
  return(runApp(MyApp()));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
