import 'package:cinema_tikets/pages/app_pages/details.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../utils/app_layout.dart';
import '../../utils/styles.dart';
import 'models/title_image_provider.dart';

class MovieView extends StatefulWidget {
  final Map<String, dynamic> acacia;
  final String location;
  const MovieView({Key? key, required this.acacia, required this.location})
      : super(key: key);

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    String choice1 = '';
    String choice2 = '';
    void titleChoice({required title}) {
      setState(() {
        choice1 = title;
        Provider.of<MovieTitle>(context, listen: false).theChoice(choice1);
      });
    }

    void imageChoice({required image}) {
      setState(() {
        choice2 = image;
        Provider.of<MovieImage>(context, listen: false).theChoice(choice2);
      });
    }

    final size = AppLayout.getSize(context);
    return SizedBox(
      child: InkWell(
        onTap: () {
          choice1 = widget.acacia['title'];
          titleChoice(title: choice1);
          choice2 = widget.acacia['poster'];
          imageChoice(image: choice2);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailsPage(
                      location: widget.location,
                      title: '${widget.acacia['title']}',
                      poster: '${widget.acacia['poster']}',
                      description: '${widget.acacia['description']}',
                      clip: '${widget.acacia['clip']}',
                      genre: '${widget.acacia['genre']}',
                      duration: '${widget.acacia['duration']}')));
        },
        child: Container(
            width: size.width * 0.6,
            height: 450,
            margin: const EdgeInsets.only(right: 30, top: 15, bottom: 30),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            decoration: BoxDecoration(
              color: Styles.primaryColor,
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              border: Border.all(
                color: Colors.blue,
              ),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                ),
              ],
              borderRadius: BorderRadius.circular(24),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Styles.primaryColor,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/${widget.acacia['poster']}")))),
              const SizedBox(height: 20),
              Text(
                "${widget.acacia['title']}",
                style: const TextStyle(color: Colors.white,fontSize: 15),
                textScaleFactor: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.acacia['rating'].toString()}/10",
                    style: const TextStyle(color: Colors.white,fontSize: 13),
                    textScaleFactor: 1.5,
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 10),
                  const Text(
                    "Rating",
                    style: TextStyle(color: Colors.white,fontSize: 13),
                    textScaleFactor: 1.5,
                  ),
                ],
              ),
              Text(
                "Showing Time: ${widget.acacia['time']}",
                style: const TextStyle(color: Colors.white,fontSize: 19),
                textScaleFactor: 1,
              )
            ])),
      ),
    );
  }
}
