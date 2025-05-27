import 'package:flutter/material.dart';
class CustomListTiles extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTiles({super.key,required this.icon,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon,color: Colors.white,),
      title: Text(title,style: TextStyle(color: Colors.white),),
    );
  }
}
