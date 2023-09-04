import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/LoginScreen.dart';
import 'package:e_commerce/Data_Provider/remote/FireBase.dart';

class settings extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<settings> {
  late User _user;
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    _getUserName();
  }

  void _getUserName() {
    // Retrieve the username from Firebase
    _userName = _user.displayName ?? 'Unknown User';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xffB81736),
      //   title: Text('User Profile',),
      // ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xffB81736),
            Color(0xff281537),
          ])),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(
                  _user.photoURL ?? 'https://example.com/default-avatar.jpg',
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                        ),
                        iconColor: Color(0xffB81736),
                        title: Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          _userName,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ListTile(
                        leading: Icon(
                          Icons.dark_mode,
                        ),
                        iconColor: Color(0xffB81736),
                        title: Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                        ),
                        iconColor: Color(0xffB81736),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Handle settings button action
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.language,
                        ),
                        iconColor: Color(0xffB81736),
                        title: Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Handle language button action
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout,
                        ),
                        iconColor: Color(0xffB81736),
                        title: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () async {
                          await FireBase().SignOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
