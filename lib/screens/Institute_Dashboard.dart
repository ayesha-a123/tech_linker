import 'package:flutter/material.dart';
import 'package:tech_linker/widget/list_tiles.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InstituteDashboard extends StatefulWidget {
  const InstituteDashboard({super.key});

  @override
  State<InstituteDashboard> createState() => _InstituteDashboardState();
}

class _InstituteDashboardState extends State<InstituteDashboard> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           UserAccountsDrawerHeader(
             currentAccountPicture: GestureDetector(
               onTap: _pickImage,
               child: CircleAvatar(
                 radius: 30,
                 backgroundColor: Colors.white,
                 backgroundImage: _profileImage != null
                     ? FileImage(_profileImage!)
                     : null,
                 child: _profileImage == null
                     ? Icon(Icons.apartment, size: 40, color: Colors.black)
                     : null,
               ),
             ),
               accountName: Text('InstituteName'), 
               accountEmail: Text('InstituteEmail')
           ),
            CustomListTiles(icon: Icons.dashboard, title: 'Dashboard', onTap: (){}, color: Colors.white),
            CustomListTiles(icon: Icons.work_outline, title: 'Internships', onTap: (){}, color: Colors.white),
            CustomListTiles(icon: Icons.assignment_outlined, title: 'Applications Received', onTap: (){}, color: Colors.white),
            CustomListTiles(icon: Icons.how_to_reg, title: 'ShortListed Candidates', onTap: (){}, color: Colors.white),
            CustomListTiles(icon: Icons.message_outlined, title: 'Messages', onTap: (){}, color: Colors.white),
            CustomListTiles(icon: Icons.notifications_none, title: 'Notifications', onTap: (){}, color: Colors.white),
            CustomListTiles(icon: Icons.logout, title: 'LogOut', onTap: (){}, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
