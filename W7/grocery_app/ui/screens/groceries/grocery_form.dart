import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

// ---------------------------------------------
// Stateful widget : GroceryForm
// 2 text fields (name, quantity) + Cancel / Add item buttons
// ---------------------------------------------

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController =
      TextEditingController(text: '1');

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _onCancel() {
    Navigator.of(context).pop();
  }

  void _onAddItem() {
    // Validate the form before creating the item.
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final newItem = GroceryItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text,
      quantity: int.parse(_quantityController.text),
      // For now we don't select the grocery type, we assume it's always food.
      category: GroceryCategory.other,
    );

    // Pass the created item back to the previous screen via pop().
    Navigator.of(context).pop(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        // Push the form above the keyboard.
        bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add a new item',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a name.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantity'),
              validator: (value) {
                final quantity = int.tryParse(value ?? '');
                if (quantity == null || quantity <= 0) {
                  return 'Please enter a valid quantity.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _onCancel,
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _onAddItem,
                  child: const Text('Add item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
