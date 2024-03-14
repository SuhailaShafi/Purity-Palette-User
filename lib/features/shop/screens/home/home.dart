import 'package:flutter/material.dart';
import 'package:purity_pallette/common/widgets/custom_shapes/containers/primary__header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainerWidget(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
