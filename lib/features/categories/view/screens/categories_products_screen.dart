import 'package:dio/dio.dart';
import 'package:final_project/Core/widgets/back_arrwo.dart';
import 'package:final_project/features/products/models/product_model.dart';
import 'package:final_project/features/products/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categorySlug;
  const CategoryProductsScreen({super.key, required this.categorySlug});

  Future<List<dynamic>> fetchProducts() async {
    final response = await Dio().get('https://dummyjson.com/products/category/$categorySlug');
    return response.data['products'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
backgroundColor:Colors.white,
        leading: BackArrow(onPressed: ()=>Navigator.pop(context),
        ),
        title: Text(
          categorySlug.replaceAll('-', ' ').toUpperCase(),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final products = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,        
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,     
              ),
              itemBuilder: (context, index) {
       final product = ProductModel.fromJson(products[index]);
                return ProductCard(product: product);
              },
            ),
          );
        },
      ),
    );
  }
}
