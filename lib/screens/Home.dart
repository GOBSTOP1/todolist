import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getTheme();
    print(currentTheme);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список дел'),
        leading: IconButton(onPressed: (){
          setState(() {
            SetTheme();
          });
        }, icon: Icon(Icons.monochrome_photos),),
      ),
    );
  }
}
