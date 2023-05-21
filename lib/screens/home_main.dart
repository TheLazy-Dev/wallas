import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';
import 'package:wallas/models/wallpapers.dart';
import 'package:wallas/providers/get_images_provider.dart';
import 'package:wallas/widgets/custom_card.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  List<PreloadPageController> controllers = [];
  late List<Hit> hits;

  @override
  void initState() {
    _loadImages();
    controllers = [
      PreloadPageController(viewportFraction: 0.6, initialPage: 2),
      PreloadPageController(viewportFraction: 0.6, initialPage: 2),
      PreloadPageController(viewportFraction: 0.6, initialPage: 3),
      PreloadPageController(viewportFraction: 0.6, initialPage: 2),
      PreloadPageController(viewportFraction: 0.6, initialPage: 2),
    ];
    super.initState();
  }

  _animatePage(int page, int index) {
    for (int i = 0; i < 5; i++) {
      if (i != index) {
        controllers[i].animateToPage(page,
            duration: const Duration(milliseconds: 1000), curve: Curves.ease);
      }
    }
  }

  void _loadImages() async {
    var imageProvider = Provider.of<ApiProvider>(context, listen: false);
    await imageProvider.getWallpapers();
    hits = imageProvider.wallpapers?.hits ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(builder: (context, walls, _) {
      hits = walls.wallpapers?.hits ?? [];
      return walls.isLoading
          ? const SizedBox.shrink()
          : Scaffold(
              extendBody: true,
              body: PreloadPageView.builder(
                controller: PreloadPageController(
                    viewportFraction: 0.6, initialPage: 2),
                itemCount: 5,
                preloadPagesCount: 5,
                itemBuilder: (context, index) => PreloadPageView.builder(
                    itemCount: 5,
                    preloadPagesCount: 5,
                    controller: controllers[index],
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (page) {
                      _animatePage(page, index);
                    },
                    itemBuilder: (context, innerIndex) {
                      int hitIndex = index * 5 + innerIndex;
                      Hit hit;
                      hit = hits[hitIndex];

                      return CustomCard(
                        hit: hit,
                      );
                    }),
              ),
            );
    });
  }
}
