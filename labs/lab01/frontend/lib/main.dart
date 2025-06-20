import 'package:flutter/material.dart';
import 'package:frontend/counter_app.dart';
import 'package:frontend/profile_card.dart';
import 'package:frontend/registration_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 01 Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black,
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Lab 01 Demo',
          style: TextStyle(), 
        ),
      ),
      body: const SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Profile Card Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const ProfileCard(
              name: 'John Doe',
              email: 'john@example.com',
              age: 30,
              avatarUrl: 'data:image/jpeg;base64,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',
            ),
            const SizedBox(height: 24),
            const Text(
              'Counter App Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const CounterApp(),
            const SizedBox(height: 24),
            const Text(
              'Registration Form Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const RegistrationForm(),
          ],
        ),
      ),
    );
  }
}
