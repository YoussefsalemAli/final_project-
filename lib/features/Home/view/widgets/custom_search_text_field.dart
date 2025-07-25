import 'package:final_project/features/products/controller/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchTextfield extends ConsumerWidget {
  final TextEditingController searchController;

  const CustomSearchTextfield({required this.searchController, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: searchController,
       onChanged: (value) {
        ref.read(productSearchQueryProvider.notifier).state = value;
      },
        decoration: InputDecoration(
          hintText: 'Search',
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          prefixIcon: Image.asset('assets/search_Icon.png'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
