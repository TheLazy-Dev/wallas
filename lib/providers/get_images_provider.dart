import 'package:flutter/material.dart';
import 'package:wallas/models/wallpapers.dart';
import 'package:wallas/utils/api_call.dart';
import 'package:wallas/utils/enums_extrs.dart';
import 'package:wallas/utils/enums_extrs.dart' as orientationx;

class ApiProvider extends ChangeNotifier {
  bool isLoading = true;
  late Wallpapers wallpapers;

  void getWallpapers({
    Category? category,
    Colorss? colorss,
    bool? editorsChoice,
    ImageType? imageType,
    Order? order,
    orientationx.Orientation? orientation,
    bool? safeSearch,
  }) async {
    HttpsCalls httpCalls = HttpsCalls();
    wallpapers = await httpCalls.httpsGetAll(
      category: category,
      color: colorss,
      editorsChoice: editorsChoice,
      imageType: imageType,
      order: order,
      orientation: orientation,
      safeSearch: safeSearch,
    );
    isLoading = false;

    notifyListeners();
  }
}
