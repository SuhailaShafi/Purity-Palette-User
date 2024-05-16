import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:purity_pallette/common/widgets/layout/grid_layout.dart';
import 'package:purity_pallette/common/widgets/loaders/shimmers/shimmer.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';

class SVerticalProductShimmer extends StatelessWidget {
  const SVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SShimmerEffect(
              width: 180,
              height: 180,
            ),
            SizedBox(
              height: SSizes.spaceBtwnItems,
            ),
            SShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: SSizes.spaceBtwnItems / 2,
            ),
            SShimmerEffect(width: 110, height: 15)
          ],
        ),
      ),
    );
  }
}
