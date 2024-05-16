import 'package:flutter/material.dart';
import 'package:purity_pallette/utils/constants/colors.dart';

class SRatingProgressIndicator extends StatelessWidget {
  SRatingProgressIndicator({super.key, this.number, this.value});
  final number;
  final value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(number, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(SColors.primary),
            ),
          ),
        )
      ],
    );
  }
}
