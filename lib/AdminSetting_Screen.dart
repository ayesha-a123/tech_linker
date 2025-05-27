import 'package:flutter/material.dart';

class AdminSettingsScreen extends StatefulWidget {
  @override
  _AdminSettingsScreenState createState() => _AdminSettingsScreenState();
}

class _AdminSettingsScreenState extends State<AdminSettingsScreen> {
  // State variables
  bool isDarkMode = false;
  bool enableNotifications = true;
  bool autoApproveInternships = false;
  bool maintenanceMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("🔒Account Settings", style: sectionTitleStyle
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Change Password"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Change Email"),
            onTap: () {},
          ),
          Divider(),

          // 🌐 App Settings
          Text("🌐 App Settings", style: sectionTitleStyle),
          SwitchListTile(
            title: Text("Dark Mode"),
            value: isDarkMode,
            onChanged: (val) {
              setState(() {
                isDarkMode = val;
              });
            },
          ),
          SwitchListTile(
            title: Text("Maintenance Mode"),
            value: maintenanceMode,
            onChanged: (val) {
              setState(() {
                maintenanceMode = val;
              });
            },
          ),
          Divider(),

          // 🔔 Notifications
          Text("🔔 Notification Settings", style: sectionTitleStyle),
          SwitchListTile(
            title: Text("Enable Notifications"),
            value: enableNotifications,
            onChanged: (val) {
              setState(() {
                enableNotifications = val;
              });
            },
          ),
          Divider(),

          // 💼 Internship Settings
          Text("💼 Internship Settings", style: sectionTitleStyle),
          SwitchListTile(
            title: Text("Auto-Approve New Internships"),
            value: autoApproveInternships,
            onChanged: (val) {
              setState(() {
                autoApproveInternships = val;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text("Set Default Internship Duration"),
            onTap: () {},
          ),
          Divider(),

          // 👥 User Management
          Text("👥 User Management", style: sectionTitleStyle),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Manage Roles & Permissions"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.block),
            title: Text("Ban/Unban Users"),
            onTap: () {},
          ),
          Divider(),

          // 💬 Feedback
          Text("💬 Feedback & Support", style: sectionTitleStyle),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Auto-Reply Message"),
            onTap: () {},
          ),
          Divider(),

          // 🔐 Advanced Settings
          Text("🛠️ Advanced Settings", style: sectionTitleStyle),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text("Backup Database"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.restore),
            title: Text("Restore Defaults"),
            onTap: () {},
          ),
          Divider(),

          // 📄 Legal
          Text("📄 Legal", style: sectionTitleStyle),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text("Privacy Policy"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.rule),
            title: Text("Terms & Conditions"),
            onTap: () {},
          ),

          SizedBox(height: 20),

          // ✅ Save Button
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Settings saved")),
              );
            },
            icon: Icon(Icons.save),
            label: Text("Save Settings"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  final TextStyle sectionTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey,
    height: 2,
  );
}
