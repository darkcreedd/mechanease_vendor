import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vehicle_assistance/features/services/book_appointment_page.dart';
import 'package:vehicle_assistance/features/services/service_provider_location.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({super.key, required this.heroTag});

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("KNUST Mechanic Shop"),
        titleTextStyle: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      body: ListView(
        children: [
          Hero(
            tag: heroTag,
            child: CachedNetworkImage(
              placeholder: (context, url) => const Center(child: CircularProgressIndicator.adaptive()),
              imageUrl:
                  "https://images.unsplash.com/photo-1615906655593-ad0386982a0f?q=80&w=3687&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 14, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrlString("tel:+233 55 555 5555");
                          },
                          icon: const Icon(IconlyLight.call),
                        ),
                        Text(
                          "Call",
                          style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(width: 25),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showCupertinoModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const ServiceProviderLocation();
                              },
                            );
                          },
                          icon: const Icon(IconlyLight.location),
                        ),
                        Text("Directions", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(width: 25),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Share.share("https://knuustmechanicshop.com");
                          },
                          icon: const Icon(CupertinoIcons.share),
                        ),
                        Text("Share", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        ActionChip(
                          onPressed: () {},
                          avatar: const Icon(CupertinoIcons.star_fill, size: 16),
                          label: const Text("4.1"),
                          labelStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text("2k+ ratings", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.maxFinite,
                  child: Card.outlined(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(IconlyLight.location, color: theme.colorScheme.primary),
                            title: Text(
                              "Spintex, Accra",
                              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("0.8km away from you"),
                          ),
                          ListTile(
                            leading: Icon(IconlyLight.calendar, color: theme.colorScheme.primary),
                            title: Text(
                              "Monday - Friday",
                              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text("8:00am - 5:00pm"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Services",
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return const Card.outlined();
                  },
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.maxFinite,
                  child: FilledButton(
                    onPressed: () {
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const BookAppointmentPage();
                        },
                      );
                    },
                    child: const Text("Book appointment"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
