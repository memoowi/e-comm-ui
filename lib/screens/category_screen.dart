import 'package:flutter/material.dart';
import 'package:flutter_pertama/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;
  const CategoryScreen({super.key, required this.category});

  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: -40,
                child: Image.asset(
                  category.icon!,
                  fit: BoxFit.cover,
                  width: 300,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 50,
                right: 50,
                child: Text(
                  category.title!,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall!.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
