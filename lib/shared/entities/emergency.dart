class Emergency {
  final String name;

  final String image;

  Emergency({required this.name, required this.image});
}

extension EmergencyExtension on Emergency {
  String get title {
    switch (name) {
      case "Tyre":
        return "Tyre Repairs";
      case "Engine":
        return "Engine Workshops";
      case "Fuel":
        return "Fuel Stations";
      case "Towing":
        return "Towing Vehicles";
      case "Battery":
        return "Battery Repairs";
      case "Fire":
        return "Fire Services";
      default:
        return "Other";
    }
  }
}
