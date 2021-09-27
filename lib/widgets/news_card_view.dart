import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCardView extends StatelessWidget {
  const NewsCardView({
    Key? key,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.press,
  }) : super(key: key);

  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((5)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            shadowColor: Colors.blue[200],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(18.0),
                          topRight: const Radius.circular(18.0),
                        )),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "$author",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              "$title ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "$content ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            // Container(
                            //     height: 100,
                            //     width: MediaQuery.of(context).size.height,
                            //     child: CachedNetworkImage(
                            //       imageUrl: "$urlToImage",
                            //       progressIndicatorBuilder:
                            //           (context, url, downloadProgress) =>
                            //               CircularProgressIndicator(
                            //                   value: downloadProgress.progress),
                            //       errorWidget: (context, url, error) =>
                            //           Icon(Icons.error),
                            //     ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
