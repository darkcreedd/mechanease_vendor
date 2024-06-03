// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mechanease_vendor/features/home/pages/tracking_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<RequestTally> dashboardValues = [
      RequestTally(label: "Total", value: 29),
      RequestTally(label: "Completed", value: 23),
      RequestTally(label: "Pending", value: 4),
      RequestTally(label: "Cancelled", value: 2)
    ];
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(CupertinoIcons.calendar_today),
              const SizedBox(
                width: 10,
              ),
              Text(DateFormat('EEEE, MMM d yyyy').format(DateTime.now()),
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 17)),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DashboardCard(
                  label: dashboardValues[index].label,
                  value: dashboardValues[index].value);
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => const TrackingPage(),
              );
            },
            child: SizedBox(
              height: 200,
              child: Card.filled(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text("Active",
                          style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                      const Text('Services'),
                      const Text("Destination")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card.filled(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '$label Requests',
            ),
            Text(
              '$value',
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
        ),
      ),
    );
  }
}

class RequestTally {
  final String label;
  final int value;
  RequestTally({
    required this.label,
    required this.value,
  });
}
