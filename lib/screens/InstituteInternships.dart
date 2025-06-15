import 'package:flutter/material.dart';
import 'package:tech_linker/widget/intern_Card.dart';

class Instituteinternships extends StatefulWidget {
  const Instituteinternships({super.key});

  @override
  State<Instituteinternships> createState() => _InstituteinternshipsState();
}

class _InstituteinternshipsState extends State<Instituteinternships> {
  List<>
  void onFeatured(){}
  void onDelete(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('My Internships',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,shadows:[Shadow(color: Colors.black,blurRadius: 2,offset: Offset(2, 2)),Shadow(color: Colors.deepPurple,blurRadius: 6,offset: Offset(2, 2))]),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search by title',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 7),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black,width: 3)
                  )

                ),
              ),
            ),
            InternCard(text: 'Flutter Developer', posted: '12May2025', institute: 'Era Tech', location: 'Mumtaz Market', onTap: (){}, featured: true , onFeaturedTap: onFeatured, onDeleteTap: onDelete),
            InternCard(text: 'UI/UX', posted: '12Feb2025', institute: 'Era Tech', location: 'Mumtaz Market', onTap: (){}, featured:false , onFeaturedTap: onFeatured, onDeleteTap: onDelete),
            InternCard(text: 'React Node', posted: '12Jan2025', institute: 'Era Tech', location: 'Mumtaz Market', onTap: (){}, featured: false , onFeaturedTap: onFeatured, onDeleteTap: onDelete),
            InternCard(text: 'Java Script', posted: '9April2025', institute: 'Era Tech', location: 'Mumtaz Market', onTap: (){}, featured: false , onFeaturedTap: onFeatured, onDeleteTap: onDelete),
            InternCard(text: 'Java Node', posted: '4Jan2025', institute: 'Era Tech', location: 'Mumtaz Market', onTap: (){}, featured: false , onFeaturedTap: onFeatured, onDeleteTap: onDelete),
            InternCard(text: 'Graphic Designing', posted: '2April2025', institute: 'Era Tech', location: 'Mumtaz Market', onTap: (){}, featured: false , onFeaturedTap: onFeatured, onDeleteTap: onDelete),
            InternCard(text: 'React Native', posted: '13Jan2025', institute: 'Era Tech', location: 'Mumtaz Market', onTap: (){}, featured: false , onFeaturedTap: onFeatured, onDeleteTap: onDelete),
          ],
        ),
      ),
    );
  }
}
