import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product_model.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 8 – Fake Store'),
      ),
      body: Column(
        children: [
          // FILTER
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

          // LIST
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
                  itemBuilder: (context, index) {
                    final product = data[index];

                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: Image.network(product.image, width: 50),
                        title: Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text('\$${product.price}'),
                        trailing: const Icon(Icons.arrow_forward_ios),

                        /// ⭐ CHUYỂN SANG MÀN CHI TIẾT
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailScreen(product: product),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
