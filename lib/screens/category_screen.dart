import 'package:flutter/material.dart';
import 'package:flutter_pertama/data/dummy_products.dart';
import 'package:flutter_pertama/models/category_model.dart';
import 'package:flutter_pertama/models/product_model.dart';
import 'package:flutter_pertama/widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;
  const CategoryScreen({super.key, required this.category});

  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Banner
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.white],
                  // stops: [0.5, 1.0],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: -50,
                    child: Image.asset(
                      category.icon!,
                      height: 400,
                      color: Colors.white54,
                      // colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        category.title!.toUpperCase(),
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  offset: const Offset(1, 1),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Product List
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3 / 5,
                ),
                itemCount: DummyProducts.products.length > 10
                    ? 10
                    : DummyProducts.products.length,
                itemBuilder: (context, index) {
                  final List<ProductModel> randomProduct = List.from(
                    DummyProducts.products,
                  )..shuffle();
                  return ProductCard(
                    onTap: () {},
                    thumbnail: randomProduct[index].thumbnail,
                    title: randomProduct[index].title,
                    price: randomProduct[index].price,
                    rating: randomProduct[index].rating,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
