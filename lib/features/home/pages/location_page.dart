import 'package:flutter/material.dart';
import 'package:mechanease_vendor/shared/widgets/bottom_sheet_appbar.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bottomSheetAppBar(context, "Location"),
    );
  }
}
