import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class CurvedEdgeWidget extends StatelessWidget {
  CurvedEdgeWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SCustomCurvedEdges(),
      child: child,
    );
  }
}
