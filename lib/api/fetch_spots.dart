import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import '../models/spot.dart';



class FetchSpotsAPI{


  Future<List<Spot>> getSpots() async {

    var response = await http.get(Uri.parse("https://corsproxy.io/?https://gostargazing.co.uk/wp-admin/admin-ajax.php?action=gost_leaflet_map_locations&location_categories=observatory,dark-sky-site,recommended-stargazing-site,go-stargazing-site,aurora-viewpoint"));
    developer.log("Got stargazing spots from gostargazing.co.uk");
    var jsonString = jsonDecode(response.body);
    return jsonString.map((x) => Spot.fromJson(x)).toList().cast<Spot>();
  }

}





