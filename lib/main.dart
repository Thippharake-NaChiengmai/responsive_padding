import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Responsive Padding challenge')),
        body: MyHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    final boxText = isTablet ? 'Large Screen' : 'Small Screen';

    return Padding(
      padding: EdgeInsets.all(isTablet ? 32.0 : 16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final boxWidth = constraints.maxWidth;

          final useVerticalLayout = boxWidth < 600;

          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: useVerticalLayout
                ? Column(children: _contentWidgets(boxText))
                : Row(children: _contentWidgets(boxText)),
          );
        },
      ),
    );
  }

  List<Widget> _contentWidgets(String text) {
    return [
      Expanded(
        child: Container(
          height: 100,
          color: Colors.blue,
          child: Center(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    ];
  }
}
