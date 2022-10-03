// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String? status;
  DataInfoModel? dataList;
  ProductModel({
    this.status,
    this.dataList,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    DataInfoModel dataInfoObj = json["data"] == null
        ? DataInfoModel.empty()
        : DataInfoModel.fromJson(json["data"]);
    return ProductModel(
      status: json["status"] ?? "",
      dataList: dataInfoObj,
    );
  }
//

}

class DataInfoModel {
  Products? products;
  DataInfoModel.empty();
  DataInfoModel({
    this.products,
  });

  factory DataInfoModel.fromJson(Map<String, dynamic> json) {
    Products productsInfoObj = json["products"] == null
        ? Products.empty()
        : Products.fromJson(json["products"]);
    return DataInfoModel(
      products: productsInfoObj,
    );
  }
//

}

class Products {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;
  Products({
    this.count,
    this.next,
    this.previous,
    this.results,
  });
  Products.empty();
  factory Products.fromJson(Map<String, dynamic> json) {
    var tempResultInfo = json["results"] == null ? [] : json["results"] as List;
    List<Results> resultInfoJsonToList =
        tempResultInfo.map((e) => Results.fromJson(e)).toList();
    return Products(
      count: json["count"] ?? 0,
      next: json["next"] ?? "",
      previous: json["previous"] ?? "",
      results: resultInfoJsonToList,
    );
  }
//

}

class Results {
  int? id;
  // Brand? brand;
  String? image;
  // Charge? charge;
  // List<Images>? images;
  String? slug;
  String? productName;
  String? model;
  String? commissionType;
  String? amount;
  String? tag;
  String? description;
  String? note;
  String? embaddedVideoLink;
  int? maximumOrder;
  int? stock;
  bool? isBackOrder;
  String? specification;
  String? warranty;
  bool? preOrder;
  int? productReview;
  bool? isSeller;
  bool? isPhone;
  bool? willShowEmi;

  bool? isActive;
  String? createdAt;
  String? updatedAt;
//Null? language;
  String? seller;
  // Null? combo;
  String? createdBy;
  // Null? updatedBy;
  //List<int>? category;
  Results({
    this.id,
    this.image,
    this.slug,
    this.productName,
    this.model,
    this.commissionType,
    this.amount,
    this.tag,
    this.description,
    this.note,
    this.embaddedVideoLink,
    this.maximumOrder,
    this.stock,
    this.isBackOrder,
    this.specification,
    this.warranty,
    this.preOrder,
    this.productReview,
    this.isSeller,
    this.isPhone,
    this.willShowEmi,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.seller,
    this.createdBy,
    //this.category,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json["id"] ?? 0,
      image: json["image"] ?? "",
      slug: json["slug"] ?? "",
      productName: json["productName"] ?? "",
      model: json["model"] ?? "",
      commissionType: json["commissionType"] ?? "",
      amount: json["amount"] ?? "",
      tag: json["tag"] ?? "",
      description: json["description"] ?? "",
      note: json["note"] ?? "",
      embaddedVideoLink: json["embaddedVideoLink"] ?? "",
      maximumOrder: json["maximumOrder"] ?? 0,
      stock: json["stock"] ?? 0,
      isBackOrder: json["isBackOrder"] ?? false,
      specification: json["specification"] ?? "",
      warranty: json["warranty"] ?? "",
      preOrder: json["preOrder"] ?? false,
      productReview: json["productReview"] ?? "",
      isSeller: json["isSeller"] ?? false,
      isPhone: json["isPhone"] ?? false,
      willShowEmi: json["willShowEmi"] ?? false,
      isActive: json["isActive"] ?? false,
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      seller: json["seller"] ?? "",
      createdBy: json["createdBy"] ?? "",
      // category: List.of(json["category"]).map((i) => int.parse(i)).toList(),
    );
  }
//
  // List<Null>? relatedProduct;
  // List<Null>? filterValue;

}
