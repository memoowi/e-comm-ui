import 'package:flutter/material.dart';
import 'package:flutter_pertama/utils/helper.dart';

class ProductCard extends StatelessWidget {
  final void Function()? onTap;
  final String? thumbnail;
  final String? title;
  final double? rating;
  final double? price;

  const ProductCard({
    super.key,
    required this.onTap,
    required this.thumbnail,
    required this.title,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AspectRatio(
              aspectRatio: 5 / 6,
              child: Image.network(thumbnail!, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
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
                            title!,
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(color: Colors.black54),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '$rating⭐',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      formatPrice(price!),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
