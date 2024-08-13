import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/signin.dart';
// Adjust import according to your file structure

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: user != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (user.photoURL != null)
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                      radius: 50,
                    ),
                  SizedBox(height: 16),
                  Text('Name: ${user.displayName ?? 'No Name'}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Email: ${user.email ?? 'No Email'}', style: TextStyle(fontSize: 20)),
                ],
              )
            : Text('No user signed in', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}







Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print("Sign out error: $e");
  }
}
