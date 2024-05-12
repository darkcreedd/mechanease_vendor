import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mechanease_vendor/features/services/service_details_page.dart';
import 'package:mechanease_vendor/shared/entities/vehicle_service.dart';

class ServiceProviders extends StatelessWidget {
  const ServiceProviders({super.key, required this.service});

  final VehicleService service;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(service.title),
        titleTextStyle:
            theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text("KNUST Mechanic Shop"),
                subtitle: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 2),
                      child: Icon(Icons.star, size: 16, color: Colors.amber),
                    ),
                    Text((Random().nextDouble() * 5).toStringAsFixed(1)),
                    const SizedBox(width: 10),
                    const Icon(Icons.location_on_outlined, size: 16),
                    const SizedBox(width: 2),
                    Text("${index + 4}km away"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetailsPage(
                        heroTag: "hero$index",
                      ),
                    ),
                  );
                },
                trailing: const Icon(IconlyLight.arrowRight3),
                leading: Hero(
                  tag: "hero$index",
                  child: const CircleAvatar(
                    foregroundImage: CachedNetworkImageProvider(
                        "https://images.unsplash.com/photo-1615906655593-ad0386982a0f?q=80&w=3687&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 10),
      ),
    );
  }
}
