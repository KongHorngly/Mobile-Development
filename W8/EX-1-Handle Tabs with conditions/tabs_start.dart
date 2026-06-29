import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(child: Text("Green Screen")),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(child: Text("Red Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(child: Text("Blue Screen")),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs selectedTab = AppTabs.red;

  Widget get content {
    switch (selectedTab) {
      case AppTabs.red:
        return const RedScreen();
      case AppTabs.green:
        return const GreenScreen();
      case AppTabs.blue:
        return const BlueScreen();
    }
  }

  void selectTab(AppTabs tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.red,
              onPressed: () => selectTab(AppTabs.red),
            ),
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.green,
              onPressed: () => selectTab(AppTabs.green),
            ),
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.blue,
              onPressed: () => selectTab(AppTabs.blue),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
