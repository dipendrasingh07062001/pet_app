import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_app/Colors/COLORS.dart';

class Images extends StatelessWidget {
  List<String> images;
  Images({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundColor: BLACK_CLR,
                  foregroundColor: WHITE70_CLR,
                  radius: 15,
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
        body: PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Image.network(
              images[index],
              errorBuilder: (context, error, stackTrace) {
                return Container();
              },
            );
          },
        ));
  }
}
