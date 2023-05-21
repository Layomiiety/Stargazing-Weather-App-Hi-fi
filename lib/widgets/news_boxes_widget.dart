import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shadow/shadow.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsBoxes extends StatelessWidget{
    const NewsBoxes({super.key});
    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                const SizedBox(
                    height: 25,
                ),
                News( // News 1
                    title: "How to See Starlink Satellite Train 2023",
                    content: "Learn how to see Starlink satellites in the sky from your location and get info on the upcoming Starlink launches.",
                    image: "https://starwalk.space/gallery/images/starlink-launch/720x405.jpg",
                    title_rows: 1,
                    content_rows: 2,
                    link: "https://starwalk.space/en/news/spacex-starlink-satellites-night-sky-visibility-guide",
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 2
                    title: "Facts About Mercury: All You Need to Know",
                    content: "Explore the closest planet to the Sun! Find out how long a day on Mercury is and how many moons the planet has. Also, keep up with the upcoming Mercury events!",
                    image: "https://starwalk.space/gallery/images/facts-about-mercury/1140x641.jpg",
                    title_rows: 1,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/facts-about-mercury-all-you-need-to-know"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 3
                    title: "Deep Penumbral Lunar Eclipse on May 5, 2023: Visibility and Timeline",
                    content: "On May 5, 2023, there will be a deep penumbral lunar eclipse. The Moon will sink so deep into the Earth’s shadow, that the eclipse will even be visible to the naked eye. Check out our article for all the details!",
                    image: "https://starwalk.space/gallery/images/lunar-eclipse-may-2023/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 4,
                    link: "https://starwalk.space/en/news/penubral-lunar-eclipse-may-5-2023",
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 4
                    title: "Full Moon in May 2023: Flower Moon",
                    content: "The Full Flower Moon will take place on May 5. Learn the meaning behind its name, and get ready to see a lunar eclipse!",
                    image: "https://starwalk.space/gallery/images/full-moon-may-2023/1140x641.jpg",
                    title_rows: 1,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/full-moon-may"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 5
                    title: "Celestial Events in May 2023: Comets, Meteor Showers, Planets",
                    content: "Take advantage of exciting astronomical events in May 2023! Read this article and start planning your stargazing sessions.",
                    image: "https://starwalk.space/gallery/images/may-sky-2023/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 2,
                    link: "https://starwalk.space/en/news/night-sky-tonight-may",
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 6
                    title: "Mars: Facts About the Red Planet",
                    content: "Why is Mars red? What’s the gravity on Mars? Read this article to get answers to these and many other questions and learn more about the Red Planet.",
                    image: "https://starwalk.space/gallery/images/mars-the-ultimate-guide/1140x641.jpg",
                    title_rows: 1,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/mars-the-ultimate-guide"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 7
                    title: "The Pleiades: One of the Best Naked-Eye Deep-Sky Objects",
                    content: "How many stars can be observed in the Pleiades star cluster? 💫 Most stargazers only see six – learn how to spot more!",
                    image: "https://starwalk.space/gallery/images/pleiades-star-cluster/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 2,
                    link: "https://starwalk.space/en/news/m45-pleiades-star-cluster"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 8
                    title: "What Do We Know About Space?",
                    content: "What is space made of, and what extraordinary things can be found out there? Read this article to unravel the mysteries of space!",
                    image: "https://starwalk.space/gallery/images/what-is-space/1140x641.jpg",
                    title_rows: 1,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/what-is-space"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 9
                    title: "Planet Saturn: Explore Saturn's Rings, Moons, and More",
                    content: "How many rings does Saturn have? Where is Saturn tonight in the sky? Find answers to these and other most common questions about Saturn in our article.",
                    image: "https://starwalk.space/gallery/images/saturn-planet-guide/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/facts-about-saturn-explore-the-amazing-ringed-planet"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 10
                    title: "Alignment Of Planets 2023: What Is It? When Will the Planets Align?",
                    content: "What is a planet alignment, and when to see the next one in May 2023? Check out this article to ensure you do not miss the moment when the planets line up in the sky.",
                    image: "https://starwalk.space/gallery/images/june-2020-planet-parade-what-is-it-and-how-can-you-see-it/1024x576.jpg",
                    title_rows: 2,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/what-is-planet-parade"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 11
                    title: "New Comet With Great Potential — C/2023 A3 (Tsuchinshan-ATLAS)",
                    content: "A new noteworthy comet has been discovered! It could reach naked-eye visibility by mid-October 2024. Here is what we know about it so far.",
                    image: "https://starwalk.space/gallery/images/comet-tsuchinshan-atlas-march-2023/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/visible-comet-2024"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 12
                    title: "Hybrid Solar Eclipse of April 20, 2023 – Australia, Indonesia, Timor Leste",
                    content: "Get ready for a rare hybrid solar eclipse! Learn where and when to observe it on April 20, 2023.",
                    image: "https://starwalk.space/gallery/images/hybrid-solar-eclipse-2023/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 2,
                    link: "https://starwalk.space/en/news/hybrid-solar-eclipse-april-2023"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 13
                    title: "Past Moon-Planet Conjunctions 2023",
                    content: "Learn about conjunctions of the Moon and planets that occurred in 2023. A link for the upcoming conjunctions list is included.",
                    image: "https://starwalk.space/gallery/images/moon-venus-apr-2023/1140x641.jpg",
                    title_rows: 1,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/moon-in-conjunction-with-planets-2023"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 14
                    title: "Great Comets: What Are They and When Is the Next One?",
                    content: "A great comet is an extraordinary event. Once you've seen it, you'll never forget it. Is there a great comet coming up? Learn from this article!",
                    image: "https://starwalk.space/gallery/images/great-comets/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/great-comets"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 15
                    title: "Vega Star Facts – The Brightest Star in Lyra Constellation",
                    content: "Discover the star Vega – the Harp Star, the Zero Star, and the future North Star. Learn about its location in the night sky, its significance for science and culture, and more in this article.",
                    image: "https://starwalk.space/gallery/images/vega-lyra/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/vega-star"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 16
                    title: "Jupiter Facts: The Biggest Planet in the Solar System",
                    content: "The bright Jupiter is known for its many moons, unstable surface, and mysterious Great Red Spot. Is there something else? Find out!",
                    image: "https://starwalk.space/gallery/images/jupiter-guide/1140x641.jpg",
                    title_rows: 1,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/jupiter-explained-the-mind-blowing-facts"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 17
                    title: "Planet Uranus: The Coldest Planet",
                    content: "Uranus has a peculiar chemical composition, extreme temperatures, and the most unusual axial tilt. Here we’ll take a closer look at this planet.",
                    image: "https://starwalk.space/gallery/images/uranus-facts/1140x641.jpg",
                    title_rows: 1,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/facts-about-uranus"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 18
                    title: "April 12: Anniversary of the First Manned Space Flight",
                    content: "On April 12, we celebrate the anniversary of the first human spaceflight. Learn more about modern astronauts and space missions!",
                    image: "https://starwalk.space/gallery/images/international-day-of-human-space-flight/1140x641.jpg",
                    title_rows: 2,
                    content_rows: 3,
                    link: "https://starwalk.space/en/news/international-day-of-human-space-flight"
                ),
                const SizedBox(
                  height: 15,
                ),
                News( // News 19
                  title: "What Is a Blue Moon, And When Is The Next One?",
                  content: "How rare is “once in a Blue Moon”? Discover the true meaning of a Blue Moon and see what to expect when it occurs.",
                  image: "https://starwalk.space/gallery/images/blue-moon/1140x641.jpg",
                  title_rows: 1,
                  content_rows: 3,
                  link: "https://starwalk.space/en/news/full-blue-moon"
                )
            ]
        );
    }
}

class News extends StatelessWidget{
    late final String title;
    late final String content;
    late final String image;
    late final double title_rows;
    late final double content_rows;
    late final String link;
    News({super.key, required this.title, required this.content, required this.image, required this.title_rows, required this.content_rows, required this.link});
    @override
    Widget build(BuildContext context){
        double s = MediaQuery.of(context).size.width / 10 - 2;
        return
          // Link(
          //   target: LinkTarget.blank,
          //   uri: Uri.parse(link),
          //   builder: (BuildContext context, FollowLink? followLink) => ElevatedButton(
          //       onPressed: followLink,
          //       child:
        InkWell(
            onTap: () { launchUrl(Uri.parse(link));},
            child:
                Container(
                    height: max(s * (0.125 * (title_rows * 3 + 1) + 0.1 * (content_rows * 3 + 1) + 1 / 3), s * 2),
                    width: s * 10,
                    margin: const EdgeInsets.all(0),
                    padding: EdgeInsets.only(left: s / 4, right: s / 4, top: s / 6, bottom: s / 6),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 25, 1),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                            BoxShadow(
                                color: const Color.fromRGBO(136, 153, 166, 1),
                                offset: const Offset(0, 0),
                                blurRadius: 0,
                                spreadRadius: s / 72
                            )
                        ],
                    ),
                    child: Row(
                        children:[
                            Column(
                                children:[
                                    SizedBox(
                                        height: s * 0.125 * (title_rows * 3 + 1),
                                        width: s * 6.5,
                                        child: Text(
                                            title,
                                            textScaleFactor: s / 36,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontFamily: 'Lato/Lato-Regular.otf',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 9.5,
                                                color: Color.fromRGBO(238, 238, 238, 1)
                                            )
                                        )
                                    ),
                                    SizedBox(
                                        height: s * 0.10 * (content_rows * 3 + 1),
                                        width: s * 6.5,
                                        child:
                                        Center(
                                            child: Text(
                                                content,
                                                textScaleFactor: s / 36,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    fontFamily: 'Lato/Lato-Regular.otf',
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 8.2,
                                                    color: Color.fromRGBO(204, 204, 204, 1),
                                                )
                                            )
                                        )
                                    )
                                ]
                            ),
                            SizedBox(
                                width : s / 4,
                            ),
                            Shadow(
                                options: const ShadowOptions(
                                    overlayColor: Color.fromRGBO(0, 0, 0, 150 / 256),
                                    offset: Offset(0, 0),
                                    blur: 100,
                                    scale: 1.0001
                                ),
                                child:
                                        Image.network(
                                            image,
                                            alignment: Alignment.centerRight,
                                            // height: s * 2.5,
                                            width: s * 2.75,
                                        ),
                            )
                        ]
                    )
                )

        );
    }
  // height: 60,
  // width: 60,
  // padding: const EdgeInsets.all(16),
  // decoration: BoxDecoration(
  //   color: CustomColors.cardcolor,
  //   borderRadius: BorderRadius.circular(35),
}
