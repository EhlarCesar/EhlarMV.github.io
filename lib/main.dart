import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:myapp/home/home_page.dart'; 


bool shouldUseFirebaseEmulator = false;
late final FirebaseApp app;
late final FirebaseAuth auth;
Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBPcOmEBbzUItwvg17a73ydgnhfU64uV4Q",
      appId: "1:563961134160:web:1c96985a0f3dad7e772555",
      messagingSenderId: "563961134160",
      projectId: "streaming-9e486",
    ),
  );

  auth = FirebaseAuth.instanceFor(app: app);

  if (shouldUseFirebaseEmulator) {
    await auth.useAuthEmulator('localhost', 9099);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Streaming',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


