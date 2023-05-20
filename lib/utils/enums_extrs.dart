enum Orientation {
  horizontal,
  vertical,
  all,
}

enum Colorss {
  grayscale,
  transparent,
  red,
  orange,
  yellow,
  green,
  turquoise,
  blue,
  lilac,
  pink,
  white,
  gray,
  black,
  brown,
  all,
}

enum Category {
  backgrounds,
  fashion,
  nature,
  science,
  education,
  feelings,
  health,
  people,
  religion,
  places,
  animals,
  industry,
  computer,
  food,
  sports,
  transportation,
  travel,
  buildings,
  business,
  music,
  all
}

enum Order {
  popular,
  latest,
}

enum ImageType {
  photo,
  illustration,
  vector,
  all,
}

class EnumToString {
  String getOrientation(Orientation? orientation) =>
      orientation.toString().isEmpty
          ? "all"
          : orientation.toString().split(".").last;
  String getCategory(Category? ctaegory) =>
      ctaegory.toString().isEmpty ? "all" : ctaegory.toString().split(".").last;
  String getColorss(Colorss? colorss) =>
      colorss.toString().isEmpty ? "all" : colorss.toString().split(".").last;
  String getOrder(Order? order) =>
      order.toString().isEmpty ? "all" : order.toString().split(".").last;
  String getImageType(ImageType? imageType) => imageType.toString().isEmpty
      ? "all"
      : imageType.toString().split(".").last;
}
