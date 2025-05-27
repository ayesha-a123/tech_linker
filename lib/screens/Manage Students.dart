import 'package:flutter/material.dart';
import 'package:tech_linker/screens/StudentDetailScreen.dart';

class ManageStudentsScreen extends StatefulWidget {
  const ManageStudentsScreen({super.key});

  @override
  State<ManageStudentsScreen> createState() => _ManageStudentsScreenState();
}
class _ManageStudentsScreenState extends State<ManageStudentsScreen> {
  Map<String, List<Map<String, String>>> studentNotifications = {};
  List<Map<String, String>> allStudents = [
    {'name': 'Ayesha', 'email': 'ayesha@example.com' , 'Address':'Gujranwala','Phone':'12345678','Graduation':'Bs ComputerScience','Identity':'34101-556798'},
    {'name': 'Bisma', 'email': 'bisma@example.com' , 'Address':'Gujranwala','Phone':'12345678','Graduation':'Bs ComputerScience','Identity':'34101-556798'},
    {'name': 'Saniya', 'email': 'sania@example.com' , 'Address':'Lahore','Phone':'12345678','Graduation':'Bs InformationTechnology','Identity':'34101-556798'},
    {'name': 'Nimra', 'email': 'nimra1@example.com' , 'Address':'Gujranwala','Phone':'12345678','Graduation':'Bs DataScience','Identity':'34101-556798'},
    {'name': 'Muskan', 'email': 'muskan@example.com' , 'Address':'Rawalpindi','Phone':'12345678','Graduation':'Automata','Identity':'34101-556798'},
    {'name': 'Bazgah', 'email': 'bazgah@example.com' , 'Address':'Islamabad','Phone':'12345678','Graduation':'Bs ComputerScience','Identity':'34101-556798'},
    {'name': 'Momina', 'email': 'momina@example.com' , 'Address':'Gujranwala','Phone':'12345678','Graduation':'Bs InformationTechnology','Identity':'34101-556798'},
    {'name': 'Hafsa', 'email': 'hafsa@example.com' , 'Address':'Lahore','Phone':'12345678','Graduation':'Bs ComputerScience','Identity':'34101-556798'},
    {'name': 'Eman', 'email': 'eman@example.com' , 'Address':'Gujranwala','Phone':'12345678','Graduation':'Bs InformationTechnology','Identity':'34101-556798'},
    {'name': 'Barriya', 'email': 'barriya@example.com' , 'Address':'Gujranwala','Phone':'12345678','Graduation':'Bs ComputerScience','Identity':'34101-556798'},
  ];

  List<Map<String, String>> filteredStudents = [];
  List<Map<String, String>> deletedStudents = [];



  @override
  void initState() {
    super.initState();
    filteredStudents = allStudents;
  }

  void _filterStudents(String query) {
    final results = allStudents.where((student) {
      final name = student['name']!.toLowerCase();
      final email = student['email']!.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input) || email.contains(input);
    }).toList();

    setState(() {
      filteredStudents = results;
    });
  }
  void _deleteStudent(int index) {
    final deleted = allStudents[index];
    setState(() {
      deletedStudents.add(deleted);
      allStudents.removeAt(index);
      filteredStudents = List.from(allStudents);
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Student deleted'),
          action: SnackBarAction(
              label: 'Undo',
              onPressed:(){
                setState(() {
                  allStudents.insert(index, deleted);
                  deletedStudents.remove(deleted);
                  filteredStudents=List.from(allStudents);
                });
              } ),
        )
    );
  }
  // void _restoreStudent(Map<String, String> student) {
  //   setState(() {
  //     allStudents.add(student);
  //     deletedStudents.remove(student);
  //     filteredStudents = allStudents;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Manage Students',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0XFF6750A4),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: _filterStudents,
              decoration: InputDecoration(
                hintText: 'Search by name or email',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStudents.length,
              itemBuilder: (context, index) {
                final student = filteredStudents[index];
                return ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text(student['name']!,style: TextStyle(color: Colors.white,fontSize: 18),),
                  subtitle: Text(student['email']!,style: TextStyle(color:Colors.white),),
                  onTap: () async {
                    final originalIndex = allStudents.indexOf(student);
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Studentdetailscreen(
                          student: student,
                          onDelete: () => _deleteStudent(originalIndex),
                          Notification:()=>Notification,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
