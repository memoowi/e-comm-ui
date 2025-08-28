import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/core/config.dart';
import 'package:flutter_pertama/data/categories.dart';
import 'package:flutter_pertama/data/recommended_products.dart';
import 'package:flutter_pertama/models/login_model.dart';
import 'package:flutter_pertama/screens/category_screen.dart';
import 'package:flutter_pertama/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  final LoginModel? loginModel;
  HomePage({super.key, this.loginModel});

  final List<String> carouselItems = [
    'assets/carousels/3.png',
    'assets/carousels/2.png',
    'assets/carousels/4.png',
    'assets/carousels/1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Config.appName,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Welcome, ${loginModel?.email ?? 'Guest'}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.cart),
            onPressed: () {
              // toast
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Cart')));

              // showDatePicker(
              //   context: context,
              //   firstDate: DateTime.now(),
              //   lastDate: DateTime.now(),
              //   initialDate: DateTime.now(),
              // );
              // bottom sheets
              // showModalBottomSheet(
              //   context: context,
              //   isScrollControlled: true,
              //   isDismissible: true,
              //   enableDrag: true,
              //   builder: (context) {
              //     return Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         ListTile(
              //           title: Text('Item 1'),
              //           leading: Icon(CupertinoIcons.cart),
              //         ),
              //         ListTile(
              //           title: Text('Item 2'),
              //           leading: Icon(CupertinoIcons.cart),
              //         ),
              //         ListTile(
              //           title: Text('Item 3'),
              //           leading: Icon(CupertinoIcons.cart),
              //         ),
              //       ],
              //     );
              //   },
              // );
            },
          ),
          IconButton(icon: Icon(CupertinoIcons.chat_bubble), onPressed: () {}),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 300,
            child: CarouselView(
              onTap: (value) {},
              itemExtent: 400,
              itemSnapping: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              children: carouselItems
                  .map(
                    (e) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Categories',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CategoryScreen.routeName,
                    arguments: categories[index],
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset(categories[index].icon!, height: 36),
                      Text(
                        categories[index].title!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Recommended for You',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: RecommendedProducts.dummy.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 5,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                onTap: () {},
                thumbnail: RecommendedProducts.dummy[index].thumbnail,
                title: RecommendedProducts.dummy[index].title,
                rating: RecommendedProducts.dummy[index].rating,
                price: RecommendedProducts.dummy[index].price,
              );
            },
          ),
        ],
      ),
    );
  }
}
