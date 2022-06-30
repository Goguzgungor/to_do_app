import 'package:flutter/material.dart';
import 'package:to_do_app/ui/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'ToDo App', home: HomeView());
  }
}
