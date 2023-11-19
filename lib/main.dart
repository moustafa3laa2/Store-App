import 'package:flutter/material.dart';
import 'package:stroe_app/screens/home_screen.dart';

void main(){
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id : (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}