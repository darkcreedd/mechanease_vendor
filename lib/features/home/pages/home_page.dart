import 'package:flutter/material.dart';
import 'package:vehicle_assistance/features/services/service_details_page.dart';
import 'package:vehicle_assistance/shared/data/vehicle_service.dart';

import '../../services/service_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("What do you need help with?",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 20)),
          const SizedBox(height: 16),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: vehicleServices.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final service = vehicleServices[index];
              return Card.outlined(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceProviders(
                          service: service,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          service.image,
                          width: 60,
                          fit: BoxFit.fitWidth,
                        ),
                        const Spacer(),
                        Text(
                          service.name,
                          style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            "Nearby Services",
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 140,
                  child: Card.outlined(
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => const ServiceDetailsPage(heroTag: "")));
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: 5,
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(
            height: 200,
            child: Card.outlined(),
          ),
        ],
      ),
    );
  }
}
