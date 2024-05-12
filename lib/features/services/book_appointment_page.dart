import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../shared/widgets/bottom_sheet_appbar.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({super.key});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  String service = "Tyre";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: bottomSheetAppBar(context, "Book Appointment"),
      body: ListView(
        controller: ModalScrollController.of(context),
        padding: const EdgeInsets.all(16),
        children: [
          Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.car_crash),
                      ),
                      Text(
                        "Service for the visit",
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    value: service,
                    items: const [
                      DropdownMenuItem(value: "Tyre", child: Text("Tyre")),
                      DropdownMenuItem(value: "General Repair", child: Text("General Repair")),
                      DropdownMenuItem(value: "Engine Repair", child: Text("Engine Repair")),
                      DropdownMenuItem(value: "Brake Repair", child: Text("Brake Repair")),
                      DropdownMenuItem(value: "Battery", child: Text("Battery")),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Card.outlined(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(IconlyLight.calendar),
                      ),
                      Text(
                        "Select Date",
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(),
                  value: [DateTime.now()],
                  onValueChanged: (dates) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Confirm Appointment"),
          )
        ],
      ),
    );
  }
}
