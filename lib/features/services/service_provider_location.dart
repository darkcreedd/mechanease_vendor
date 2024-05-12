import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_sheet_appbar.dart';

class ServiceProviderLocation extends StatelessWidget {
  const ServiceProviderLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bottomSheetAppBar(context, "Find Location On Map"),
    );
  }
}
