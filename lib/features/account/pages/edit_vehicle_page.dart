import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mechanease_vendor/features/account/widgets/vehicle_detail_card.dart';

class EditVehiclePage extends StatelessWidget {
  const EditVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CloseButton(),
        titleTextStyle:
            theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        title: const Text("My Vehicle"),
      ),
      body: ListView(
        controller: ModalScrollController.of(context),
        padding: const EdgeInsets.only(top: 16),
        children: [
          CachedNetworkImage(
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator.adaptive()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: 270,
            imageUrl:
                "https://images.unsplash.com/photo-1580273916550-e323be2ae537?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Honda Civic Hybrid",
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                SizedBox(
                  height: 105,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      VehicleDetailCard(
                          title: "Year",
                          value: "2024",
                          icon: Icons.access_time),
                      SizedBox(width: 10),
                      VehicleDetailCard(
                          title: "Color",
                          value: "Black",
                          icon: Icons.color_lens),
                      SizedBox(width: 10),
                      VehicleDetailCard(
                          title: "Fuel",
                          value: "Petrol",
                          icon: Icons.local_gas_station),
                      SizedBox(width: 10),
                      VehicleDetailCard(
                          title: "Model",
                          value: "Civic",
                          icon: Icons.car_repair),
                      SizedBox(width: 10),
                      VehicleDetailCard(
                          title: "Plate",
                          value: "ABC 123",
                          icon: Icons.local_parking),
                      SizedBox(width: 10),
                      VehicleDetailCard(
                          title: "Gear",
                          value: "Auto",
                          icon: Icons.transit_enterexit),
                      SizedBox(width: 10),
                      VehicleDetailCard(
                          title: "Wheels",
                          value: "4",
                          icon: Icons.local_gas_station),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
