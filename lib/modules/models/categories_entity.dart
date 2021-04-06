class CategoriesEntity {
  List<Categories> categories;

  CategoriesEntity({this.categories});

  CategoriesEntity.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  Category category;

  Categories({this.category});

  Categories.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}

class Category {
  List<Subcategories> subcategories;
  String quote;
  String protip;
  String imagePath;
  String localImagePath;
  String categoryName;
  String colorCode;
  String servingSize;

  // static use
  bool isDropped = false;

  Category(
      {this.subcategories,
      this.quote,
      this.protip,
      this.imagePath,
      this.localImagePath,
      this.categoryName,
      this.colorCode,
      this.servingSize});

  Category.fromJson(Map<String, dynamic> json) {
    if (json['subcategories'] != null) {
      subcategories = new List<Subcategories>();
      json['subcategories'].forEach((v) {
        subcategories.add(new Subcategories.fromJson(v));
      });
    }
    quote = json['quote'];
    protip = json['protip'];
    imagePath = json['imagePath'];
    localImagePath = json['localImagePath'];
    categoryName = json['categoryName'];
    colorCode = json['colorCode'];
    servingSize = json['servingSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories.map((v) => v.toJson()).toList();
    }
    data['quote'] = this.quote;
    data['protip'] = this.protip;
    data['imagePath'] = this.imagePath;
    data['localImagePath'] = this.localImagePath;
    data['categoryName'] = this.categoryName;
    data['colorCode'] = this.colorCode;
    data['servingSize'] = this.servingSize;
    return data;
  }
}

class Subcategories {
  List<String> items;
  String subCategoryname;
  String servingSize;

  Subcategories({this.items, this.subCategoryname, this.servingSize});

  Subcategories.fromJson(Map<String, dynamic> json) {
    items = json['items'].cast<String>();
    subCategoryname = json['subCategoryname'];
    servingSize = json['servingSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = this.items;
    data['subCategoryname'] = this.subCategoryname;
    data['servingSize'] = this.servingSize;
    return data;
  }
}
