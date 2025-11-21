import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop_provider.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  final String initialCategory;

  const ProductListScreen({Key? key, required this.initialCategory})
    : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    final shopData = Provider.of<ShopProvider>(context);
    final products = shopData.getProductsByCategory(selectedCategory);

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '$selectedCategory Shoes',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement Search (opsional, sesuaikan jika ada)
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
        elevation: 0,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildChip('Formal'),
                  const SizedBox(width: 10),
                  _buildChip('Sport'),
                  const SizedBox(width: 10),
                  _buildChip('Casual'),
                  const SizedBox(width: 10),
                  _buildChip('Sneakers'),
                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItem(product: products[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: selectedCategory == label ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selectedCategory == label ? Colors.white : Colors.black87,
            fontWeight: selectedCategory == label
                ? FontWeight.bold
                : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
