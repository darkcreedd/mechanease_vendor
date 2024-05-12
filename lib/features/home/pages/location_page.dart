import 'package:flutter/material.dart';
import 'package:vehicle_assistance/shared/widgets/bottom_sheet_appbar.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bottomSheetAppBar(context, "Location"),
    );
  }
}
