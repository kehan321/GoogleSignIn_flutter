import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// Adjust import according to your file structure

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign-In Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final userCredential = await loginWithGoogle();
            if (userCredential != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          },
          child: Text('Sign In with Google'),
        ),
      ),
    );
  }
}

Future<UserCredential?> loginWithGoogle() async {
  try {
    // Initialize GoogleSignIn instance
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Prompt the user to select an account by initiating sign-in
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print("Google sign-in error: $e");
  }
  return null;
}

Future<void> signOut() async {
  try {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Sign out from Google
    await GoogleSignIn().signOut();

    // Optionally, force sign-in to pick another account next time
    // GoogleSignIn().disconnect(); // Uncomment if you want to completely clear Google Sign-In state
  } catch (e) {
    print("Sign out error: $e");
  }
}

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
                  SizedBox(height: 8),
                  Text('Phone: ${user.phoneNumber ?? 'No number'}', style: TextStyle(fontSize: 20)),
                ],
              )
            : Text('No user signed in', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
