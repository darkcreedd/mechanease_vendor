import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vehicle_assistance/features/account/pages/activity_page.dart';
import 'package:vehicle_assistance/features/account/pages/edit_profile_page.dart';
import 'package:vehicle_assistance/features/account/pages/edit_vehicle_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 16),
        children: [
          ListTile(
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) {
                  return const EditProfilePage();
                },
              );
            },
            titleTextStyle: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            title: const Text("Jeron"),
            trailing: const Icon(IconlyLight.edit),
            leading: const CircleAvatar(
              radius: 25,
              foregroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1580273916550-e323be2ae537?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ),
            subtitle: const Text("+233 55 555 5555"),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(Icons.car_repair),
            title: const Text("My Vehicle"),
            titleTextStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            trailing: const Icon(IconlyLight.arrowRight3),
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) {
                  return const EditVehiclePage();
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(IconlyLight.activity),
            title: const Text("Activity"),
            titleTextStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            trailing: const Icon(IconlyLight.arrowRight3),
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ActivityPage();
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(CupertinoIcons.info),
            title: const Text("About Us"),
            titleTextStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            trailing: const Icon(IconlyLight.arrowRight3),
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ActivityPage();
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(CupertinoIcons.heart),
            title: const Text("Tell a Friend"),
            titleTextStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            trailing: const Icon(IconlyLight.arrowRight3),
            onTap: () {
              Share.share("Check out our project work!");
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(IconlyLight.logout),
            title: const Text("Logout"),
            titleTextStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            trailing: const Icon(IconlyLight.arrowRight3),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
