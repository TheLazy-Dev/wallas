import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallas/models/wallpapers.dart';
import 'package:wallas/utils/enums_extrs.dart';

class HttpsCalls {
  Future<Wallpapers> httpsGetAll({
    Orientation? orientation = Orientation.all,
    Category? category = Category.all,
    bool? editorsChoice = false,
    Colorss? color = Colorss.all,
    bool? safeSearch = true,
    Order? order = Order.popular,
    ImageType? imageType = ImageType.all,
  }) async {
    var response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=16066658-4666bdced62bdbe48665bb8df&image_type=photo&'
      'editors_choice=$editorsChoice&orientation=${(EnumToString().getOrientation(orientation))}'
      '&category=${(EnumToString().getCategory(category))}&&safesearch=$safeSearch&'
      'order=${(EnumToString().getOrder(order))}&&color=${(EnumToString().getColorss(color))}'
      '&imageType=${(EnumToString().getImageType(imageType))}&per_page=25',
    ));

    log("${response.request?.url.toString()}");

    if (response.statusCode == 200) {
      log("${Wallpapers.fromJson(jsonDecode(response.body)).total}");
      return Wallpapers.fromJson(jsonDecode(response.body));
    } else {
      return Wallpapers.fromJson({});
    }
  }
}
