class LocationClass {
  final String latitude, longitude, city, department, country;

  LocationClass({
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.department,
    required this.country,
  });

  static LocationClass fromJson(Map<String, dynamic> json) => LocationClass(
      latitude: json['latitude'],
      longitude: json['longitude'],
      city: json['city'],
      department: json['department'],
      country: json['country']);

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'city': city,
        'department': department,
        'country': country,
      };
}
