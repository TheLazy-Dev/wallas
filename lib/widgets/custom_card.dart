import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallas/models/wallpapers.dart';
import 'package:wallas/screens/about_wall.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.hit});

  final Hit? hit;

  @override
  Widget build(BuildContext context) {
    String? what = hit?.tags?.split(",").first;
    String? whatNot = hit?.tags
        ?.substring(hit?.tags?.split(",").first.length ?? 2)
        .replaceFirst(",", "");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AboutWall(
                hit: hit,
              ),
            )),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Stack(
            children: [
              Hero(
                tag: "${hit?.webformatUrl}",
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    "${hit?.webformatUrl}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 10,
                child: Text(
                  hit?.user ?? "",
                  style: GoogleFonts.actor(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 10,
                child: Text(
                  "$what",
                  style: GoogleFonts.actor(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 5,
                child: Text(
                  "$whatNot",
                  style: GoogleFonts.actor(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
