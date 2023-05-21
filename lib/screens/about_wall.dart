import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallas/models/wallpapers.dart';

class AboutWall extends StatefulWidget {
  const AboutWall({
    super.key,
    this.hit,
  });

  final Hit? hit;

  @override
  State<AboutWall> createState() => _AboutWallState();
}

class _AboutWallState extends State<AboutWall>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isTextVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isTextVisible = true;
        });
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        child: Stack(
          children: [
            Hero(
              tag: '${widget.hit?.webformatUrl}',
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  '${widget.hit?.webformatUrl}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: _isTextVisible ? 80 : -100,
              right: 25,
              child: AnimatedOpacity(
                opacity: _isTextVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Downloading..."),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.download,
                            color: Colors.white,
                          )),
                      const SizedBox(width: 20),
                      const InkWell(
                        child: Icon(
                          Icons.wallpaper_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: _isTextVisible ? 80 : -100,
              left: 80,
              child: AnimatedOpacity(
                opacity: _isTextVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    '${widget.hit?.user}',
                    style: GoogleFonts.actor(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Positioned(
              top: _isTextVisible ? 80 : -100,
              left: 30,
              child: AnimatedOpacity(
                opacity: _isTextVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: _isTextVisible ? 40 : -100,
              left: 30,
              child: AnimatedOpacity(
                opacity: _isTextVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    (widget.hit?.tags!.length ?? 0) > 15
                        ? "${widget.hit?.tags!.substring(0, 14)}..."
                        : '${widget.hit?.tags}',
                    style: GoogleFonts.actor(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: _isTextVisible ? 40 : -100,
              right: 50,
              child: AnimatedOpacity(
                opacity: _isTextVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.hit?.likes.toString() ?? '',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
