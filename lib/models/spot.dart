class Spot{
  final double lat;
  final double lng;
  final String type;
  final String name;
  final String loc;
  final Uri url;

  const Spot({
    required this.lat,
    required this.lng,
    required this.name,
    required this.loc,
    required this.type,
    required this.url,
  });

  factory Spot.fromJson(Map<String, dynamic> json) {
    String full = json['properties']['desc'];
    final type = full.substring(full.indexOf('<i>')+3, full.indexOf('</i>'));
    final url = Uri.parse(full.substring(full.indexOf('href="')+6, full.indexOf('"', full.indexOf('"')+6)));
    final name = full.substring(full.indexOf('">')+2, full.indexOf('</a>'));
    final loc = full.substring(full.indexOf('<br/>')+5, full.indexOf('<br/><i>'));
    return Spot(
      lat:  double.parse(json['geometry']['coordinates'][1]),
      lng: double.parse(json['geometry']['coordinates'][0]),
      type: type,
      name: name,
      url: url,
      loc: loc,
    );
  }

}