import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mechanease_vendor/features/account/pages/edit_profile_page.dart';
import 'package:mechanease_vendor/features/account/pages/workshop_details.dart';
import 'package:mechanease_vendor/features/services/add_services_page.dart';
import 'package:mechanease_vendor/shared/data/vehicle_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Services Offered"),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  vehicleServices.length,
                  (index) => Card.outlined(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                              child: Image.asset(vehicleServices[index].image)),
                          Text(vehicleServices[index].name)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddServicesPage();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
