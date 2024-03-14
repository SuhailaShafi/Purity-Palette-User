import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:purity_pallette/utils/constants/colors.dart';

class PrimaryHeaderContainerWidget extends StatelessWidget {
  const PrimaryHeaderContainerWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: SColors.primary,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                left: 250,
                child: CircularContainerWidget(
                  backgroundColor: SColors.backgroundWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainerWidget(
                  backgroundColor: SColors.backgroundWhite.withOpacity(0.1),
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
