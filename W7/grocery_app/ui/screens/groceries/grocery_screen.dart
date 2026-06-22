// import 'package:flutter/material.dart';
// import '../../../data/mock_grocery_data.dart';
// import '../../../models/grocery.dart';
// import 'grocery_form.dart';
// import 'grocery_tile.dart';

// class GroceryScreen extends StatefulWidget {
//   const GroceryScreen({super.key});

//   @override
//   State<GroceryScreen> createState() => _GroceryScreenState();
// }

// class _GroceryScreenState extends State<GroceryScreen> {
//   // Local, mutable copy of the mock data so we can add new items to it.
//   final List<GroceryItem> _groceryItems = List.of(allGroceryItems);

//   void onCreate() async {
//     // ---------------------------------------------
//     // Navigate to the form screen using showModalBottomSheet
//     // ---------------------------------------------
//     final newItem = await showModalBottomSheet<GroceryItem>(
//       context: context,
//       isScrollControlled: true,
//       builder: (ctx) => const GroceryForm(),
//     );

//     // showModalBottomSheet returns null if the user cancelled / dismissed it.
//     if (newItem == null) {
//       return;
//     }

//     setState(() {
//       _groceryItems.add(newItem);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget content = const Center(child: Text('No items added yet.'));

//     if (_groceryItems.isNotEmpty) {
//       // ---------------------------------------------
//       //  Loop on groceries with an ListView builder
//       //  For each grocery items, create a GroceryItemTile (grocery_tile.dart)
//       // ---------------------------------------------
//       content = ListView.builder(
//         itemCount: _groceryItems.length,
//         itemBuilder: (ctx, index) => GroceryItemTile(item: _groceryItems[index]),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Groceries'),
//         actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
//       ),
//       body: content,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/grocery_app/ui/screens/groceries/grocery_form.dart';
import 'package:flutter_application_1/grocery_app/ui/screens/groceries/grocery_tile.dart';
import '../../../data/mock_grocery_data.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  void onCreate() {
    // ---------------------------------------------
    // Navigate to the form screen using showModalBottomSheet
    // ---------------------------------------------
    // https://api.flutter.dev/flutter/material/showModalBottomSheet.html
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const GroceryForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (allGroceryItems.isNotEmpty) {
      // ---------------------------------------------
      //  Loop on groceries with an ListView builder
      //  For each grocery items, create a GroceryTile (grocery_tile.dart)
      // ---------------------------------------------
      // https://api.flutter.dev/flutter/widgets/ListView-class.html

      content = ListView.builder(
        itemCount: allGroceryItems.length,

        itemBuilder: (ctx, index) {
          return GroceryTile(grocery: allGroceryItems[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
