import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product_model.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  final ApiService _api = ApiService();
  late Future<List<Product>> _products;
  String? _selectedCategory;
  List<String> _categories = ['Tất cả'];

  @override
  void initState() {
    super.initState();
    _products = _api.getProducts();
    _loadCategories();
  }

  void _loadCategories() async {
    final cats = await _api.getCategories();
    setState(() {
      _categories = ['Tất cả', ...cats];
    });
  }

  void _filter(String? category) {
    setState(() {
      _selectedCategory = category;
      if (category == null || category == 'Tất cả') {
        _products = _api.getProducts();
      } else {
        _products = _api.getProductsByCategory(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter
        Padding(
          padding: const EdgeInsets.all(12),
          child: DropdownButton<String>(
            value: _selectedCategory ?? 'Tất cả',
            isExpanded: true,
            items: _categories
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: _filter,
          ),
        ),

        // Product list
        Expanded(
          child: FutureBuilder<List<Product>>(
            future: _products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Lỗi: ${snapshot.error}'));
              }

              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  final p = data[i];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.network(p.image, width: 50),
                      title: Text(p.title, maxLines: 2),
                      subtitle: Text('\$${p.price}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
