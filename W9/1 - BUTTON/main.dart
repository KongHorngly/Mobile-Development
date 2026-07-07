import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class ButtonStatus {
  final String title;
  final bool selected;

  ButtonStatus({required this.title, required this.selected});

  factory ButtonStatus.fromJson(Map<String, dynamic> json) {
    return ButtonStatus(
      title: json["title"] as String? ?? "button",
      selected: json["selected"] as bool? ?? false,
    );
  }
}


class RepositoryException implements Exception {
  final String message;

  RepositoryException(this.message);
}

class AsyncData<T> {
  final bool loading;
  final T? data;
  final String? error;

  AsyncData.loading() : loading = true, data = null, error = null;

  AsyncData.success(this.data) : loading = false, error = null;

  AsyncData.error(this.error) : loading = false, data = null;
}



class ButtonRepository {
  final String url =
      "https://du-bist-gut-genug-default-rtdb.firebaseio.com/Button.json";

  Future<ButtonStatus> getButtonStatus() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        throw RepositoryException(
          "Failed to fetch button (${response.statusCode})",
        );
      }

      final decoded = jsonDecode(response.body);

      if (decoded == null || decoded is! Map<String, dynamic>) {
        return ButtonStatus(title: "button", selected: false);
      }

      return ButtonStatus.fromJson(decoded);
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }

  Future<void> updateButtonStatus(bool selected) async {
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"selected": selected}),
      );

      if (response.statusCode != 200) {
        throw RepositoryException("Failed to update button");
      }
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ButtonRepository repository = ButtonRepository();

  AsyncData<ButtonStatus> data = AsyncData.loading();

  @override
  void initState() {
    super.initState();
    _fetchButtonData();
  }

  Future<void> _fetchButtonData() async {
    setState(() {
      data = AsyncData.loading();
    });

    try {
      final button = await repository.getButtonStatus();

      setState(() {
        data = AsyncData.success(button);
      });
    } on RepositoryException catch (e) {
      setState(() {
        data = AsyncData.error(e.message);
      });
    }
  }

  Future<void> _toggleButton() async {
    final button = data.data!;

    final newValue = !button.selected;

    try {
      await repository.updateButtonStatus(newValue);
      await _fetchButtonData();
    } on RepositoryException catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (data.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Firebase Button")),
        body: Center(child: Text(data.error!)),
      );
    }

    final button = data.data!;

    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Button")),
      body: Center(
        child: SizedBox(
          width: 220,
          height: 60,
          child: ElevatedButton(
            onPressed: _toggleButton,
            style: ElevatedButton.styleFrom(
              backgroundColor: button.selected
                  ? Colors.lightBlue
                  : Colors.white,
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              button.title.toUpperCase(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
