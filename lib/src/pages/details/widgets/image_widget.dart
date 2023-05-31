import 'package:flutter/material.dart';
import 'package:lol_app/src/core/contansts/base_urls.dart';

class ImageWidget extends StatelessWidget {
  final String id;
  const ImageWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('${BaseUrl.splash}${id}_0.jpg'),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(20, 0, 0, 0),
                Color.fromARGB(20, 0, 0, 0),
                Color.fromARGB(220, 16, 17, 20),
                Color.fromARGB(255, 16, 17, 20),
                Color.fromARGB(255, 16, 17, 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
