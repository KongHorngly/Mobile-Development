 
class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  final String id;
  final String name;
  final int quantity;
  final GroceryCategory category;
}


enum GroceryCategory {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other

   final String label;
  final Color color;

  const GroceryCategory(this.label, this.color);
}
