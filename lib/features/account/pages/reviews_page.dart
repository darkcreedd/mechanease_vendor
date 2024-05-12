import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_sheet_appbar.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bottomSheetAppBar(context, "Reviews"),
    );
  }
}
