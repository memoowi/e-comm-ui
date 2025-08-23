import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/core/config.dart';
import 'package:flutter_pertama/data/recommended_products.dart';
import 'package:flutter_pertama/models/login_model.dart';

class HomePage extends StatelessWidget {
  final LoginModel loginModel;
  HomePage({super.key, required this.loginModel});

  final List<String> carouselItems = [
    'assets/carousels/3.png',
    'assets/carousels/2.png',
    'assets/carousels/4.png',
    'assets/carousels/1.png',
  ];

  final List<Map<String, dynamic>> categories = [
    {'title': 'Fashion', 'icon': 'assets/icons/tshirt.png'},
    {'title': 'Groceries', 'icon': 'assets/icons/grocery.png'},
    {'title': 'Electronics', 'icon': 'assets/icons/responsive.png'},
    {'title': 'Home Appliances', 'icon': 'assets/icons/electronics.png'},
    {'title': 'Beauty', 'icon': 'assets/icons/skincare.png'},
    {'title': 'Sports & Outdoor', 'icon': 'assets/icons/sports.png'},
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
              'Welcome, ${loginModel.email}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        actions: [
          IconButton(icon: Icon(CupertinoIcons.cart), onPressed: () {}),
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
                onTap: () {},
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
                      Image.asset(categories[index]['icon'], height: 36),
                      Text(
                        categories[index]['title'],
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
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AspectRatio(
                        aspectRatio: 4 / 5,
                        child: Image.network(
                          RecommendedProducts.dummy[index].thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 8.0,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    RecommendedProducts.dummy[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: Colors.black54),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  '${RecommendedProducts.dummy[index].rating}⭐',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'IDR ${RecommendedProducts.dummy[index].price}',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
