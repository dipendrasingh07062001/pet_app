import 'package:flutter/material.dart';
import 'package:pet_app/Screens/BlogDetails.dart';
import '../../Api/Models/blogModel.dart';
import '../../Api/Services.dart';
import '../../Colors/COLORS.dart';
import '../../UTILS/Utils.dart';

class BlogDetailsList extends StatefulWidget {
  List<BlogModelList> blogListdata;
  BlogDetailsList({super.key, required this.blogListdata});

  @override
  State<BlogDetailsList> createState() => _BlogDetailsListState();
}

class _BlogDetailsListState extends State<BlogDetailsList> {
  BlogModel result = BlogModel();
  List<BlogModelList> blogListdata = [];

  @override
  void initState() {
    super.initState();
    // getblogApi().then((value) {
    //   setState(() {
    //     result = value;
    //     // print(result.blogListdata.toString());
    //   });
    // });
    if (widget.blogListdata.isNotEmpty) {
      blogListdata.addAll(widget.blogListdata);
    }
  }

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h * 0.25,
      child: blogListdata.isEmpty
          ? loader
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: blogListdata.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigate_to(context, const Blog_Details()),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    height: h * 0.24,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(
                              blogListdata[index].image.toString(),
                              scale: 1.0),
                          fit: BoxFit.cover),
                    ),
                    child: SizedBox(
                      height: h * 0.095,
                      width: w * 0.42,
                      child: Padding(
                        padding: EdgeInsets.only(top: h * 0.01),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: h * 0.005,
                                  ),
                                  RichText(
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      children: <InlineSpan>[
                                        TextSpan(
                                            text: blogListdata[index]
                                                .name
                                                .toString(),
                                            style: const TextStyle(
                                              color: GRAY_CLR,
                                              fontSize: 10,
                                            )),
                                        WidgetSpan(
                                            alignment: PlaceholderAlignment.top,
                                            baseline: TextBaseline.alphabetic,
                                            child: SizedBox(
                                              width: w * 0.1,
                                            )),
                                        TextSpan(
                                            text: blogListdata[index]
                                                .id
                                                .toString(),
                                            style: const TextStyle(
                                                color: GRAY_CLR, fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.015,
                                  ),
                                  styleText(
                                    blogListdata[index].description.toString(),
                                    DARK_CLR,
                                    FontWeight.bold,
                                    12,
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
