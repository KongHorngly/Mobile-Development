// import 'package:flutter/material.dart';
// import '../../../models/grocery.dart';

// // ---------------------------------------------
// // Stateless widget : GroceryItemTile
// // Displays one GroceryItem: category color, name and quantity
// // ---------------------------------------------

// class GroceryItemTile extends StatelessWidget {
//   const GroceryItemTile({super.key, required this.item});

//   final GroceryItem item;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Container(
//         width: 15,
//         height: 15,
//         color: item.category.color,
//       ),
//       title: Text(item.name),
//       trailing: Text(
//         item.quantity.toString(),
//         style: const TextStyle(color: Colors.grey),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/grocery_app/models/grocery.dart';

// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------

// The widget shall take as required parameter a Grocery

//   Use a ListTile widget to layout the elements

// https://api.flutter.dev/flutter/material/ListTile-class.html

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: 16, height: 16, color: grocery.category.color),
      title: Text(grocery.name),
    );
  }
}
