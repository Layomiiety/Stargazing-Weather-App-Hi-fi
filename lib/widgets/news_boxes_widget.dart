import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shadow/shadow.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsBoxes extends StatelessWidget {
  const NewsBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString("assets/news/news.json"),
        builder: (context, news) => Column(
            children: jsonDecode(news.requireData)
                .map<Widget>((x) => News(
                    title: x['title'],
                    content: x['content'],
                    image: x['image'],
                    titleRows: x['title_rows'],
                    contentRows: x['content_rows'],
                    link: x['link']))
                .toList()));
  }
}

class News extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final int titleRows;
  final int contentRows;
  final String link;

  // late final String link;
  const News(
      {super.key,
      required this.title,
      required this.content,
      required this.image,
      required this.titleRows,
      required this.contentRows,
      required this.link});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.all(10),
        child: InkWell(
            onTap: () {
              launchUrl(Uri.parse(link));
            },
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          child: Column(children: [
                        Text(title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontFamily: 'Lato/Lato-Regular.otf',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color.fromRGBO(238, 238, 238, 1))),
                        Text(content,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'Lato/Lato-Regular.otf',
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                              color: Color.fromRGBO(204, 204, 204, 1),
                            ))
                      ])),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Shadow(
                            options: const ShadowOptions(
                                overlayColor:
                                    Color.fromRGBO(0, 0, 0, 150 / 256),
                                offset: Offset(0, 0),
                                blur: 100,
                                scale: 1.0001),
                            child: Image.network(
                              image,
                              alignment: Alignment.centerRight,
                              width: 125,
                            )),
                      )
                    ]))));
  }
}
