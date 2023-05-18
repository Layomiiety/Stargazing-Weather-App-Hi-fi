import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class LightTileProvider implements TileProvider {
  String apiParams = "";
  LightTileProvider(String layer) {
    boxPaint.isAntiAlias = true;
    boxPaint.color = Colors.transparent;
    boxPaint.style = PaintingStyle.stroke;
    apiParams = "LAYERS=$layer";
  }

  static const int width = 256;
  static final Paint boxPaint = Paint();

  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5);
    var diam = 40075016.68557849;

    final Point bot = Point(
        (x / (1 << zoom!) - 0.5) * diam, (1 - (y+1) / (1 << zoom) - 0.5) * diam);
    final Point top = Point(
        ((x + 1) / (1 << zoom) - 0.5) * diam, (1 - (y) / (1 << zoom) - 0.5) * diam);

    String boundingBoxURL = "BBOX=${bot.x}%2C${bot.y}%2C${top.x}%2C${top.y}";
    var url = 'https://www.lightpollutionmap.info/geoserver/PostGIS/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&FORMAT=image%2Fpng&TRANSPARENT=true&SRS=EPSG%3A3857&rnd=0.3081611007733014&TILED=true&WIDTH=256&HEIGHT=256&CRS=EPSG%3A3857&$apiParams&$boundingBoxURL';
    ui.Image tileData = await getUrlImage(url);
    canvas.drawImage(tileData, const Offset(0, 0), paint);
    canvas.drawRect(
        Rect.fromLTRB(0, 0, width.toDouble(), width.toDouble()), boxPaint);

    final ui.Picture picture = recorder.endRecording();
    final Uint8List byteData = await picture
        .toImage(width, width)
        .then((ui.Image image) =>
        image.toByteData(format: ui.ImageByteFormat.png))
        .then((ByteData? byteData) => byteData!.buffer.asUint8List());
    return Tile(width, width, byteData);
  }

  Future<ui.Image> getUrlImage(String url, {width, height}) async {
    var response = await http.get(
        Uri.parse(url)
    );
    ui.Codec codec = await ui.instantiateImageCodec(response.bodyBytes,
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}