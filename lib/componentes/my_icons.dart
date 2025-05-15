import 'package:flutter/material.dart';

class MyIcons extends StatelessWidget {
final String path;
const MyIcons({super.key, required this.path});

@override
Widget build(BuildContext context) {
return Container(
padding: EdgeInsets.all(10),
decoration: BoxDecoration(
border: Border.all(color: Colors.white),
borderRadius: BorderRadius.circular(20),
color: Colors.white
),
child: Image.asset(path, height: 50),
);
}
}
