import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_sheet_appbar.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bottomSheetAppBar(context, "Your Activity"),
    );
  }
}
