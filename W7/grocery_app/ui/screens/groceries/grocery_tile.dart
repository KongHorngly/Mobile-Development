import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

// ---------------------------------------------
// Stateless widget : GroceryItemTile
// Displays one GroceryItem: category color, name and quantity
// ---------------------------------------------

class GroceryItemTile extends StatelessWidget {
  const GroceryItemTile({super.key, required this.item});

  final GroceryItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 15,
        height: 15,
        color: item.category.color,
      ),
      title: Text(item.name),
      trailing: Text(
        item.quantity.toString(),
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
