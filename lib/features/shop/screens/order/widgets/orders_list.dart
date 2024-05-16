import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/utils/constants/colors.dart';
import 'package:purity_pallette/utils/constants/sizes.dart';
import 'package:purity_pallette/utils/helpers/helper_function.dart';

class SOrdersList extends StatelessWidget {
  const SOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) =>
          const SizedBox(height: SSizes.spaceBtwnItems),
      itemBuilder: (_, index) => CircularContainerWidget(
        showBorder: true,
        padding: EdgeInsets.all(SSizes.md),
        backgroundColor:
            dark ? SColors.backgroundDark : Color.fromARGB(255, 247, 239, 239),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Iconsax.ship),
                SizedBox(
                  width: SSizes.spaceBtwnItems / 2,
                ),
                //status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: SColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '01 Nov 2023',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.arrow_right_34,
                      size: SSizes.icsm,
                    ))
              ],
            ),
            SizedBox(height: SSizes.spaceBtwnItems),

            //Row2
            Row(children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(
                      width: SSizes.spaceBtwnItems / 2,
                    ),
                    //status and date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: SColors.backgroundDark,
                                fontWeightDelta: 1),
                          ),
                          Text(
                            '[#245526]',
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Iconsax.calendar),
                    SizedBox(
                      width: SSizes.spaceBtwnItems / 2,
                    ),
                    //status and date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: SColors.backgroundDark,
                                fontWeightDelta: 1),
                          ),
                          Text(
                            '01 Nov 2023',
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
