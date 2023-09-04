class SaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final ListPrice? listPrice;
  final RetailPrice? retailPrice;
  final String? buyLink;
  final List<Offers>? offers;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  SaleInfo.fromJson(Map<String, dynamic> json)
      : country = json['country'] as String?,
        saleability = json['saleability'] as String?,
        isEbook = json['isEbook'] as bool?,
        listPrice = (json['listPrice'] as Map<String, dynamic>?) != null
            ? ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>)
            : null,
        retailPrice = (json['retailPrice'] as Map<String, dynamic>?) != null
            ? RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>)
            : null,
        buyLink = json['buyLink'] as String?,
        offers = (json['offers'] as List?)
            ?.map((dynamic e) => Offers.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
        'listPrice': listPrice?.toJson(),
        'retailPrice': retailPrice?.toJson(),
        'buyLink': buyLink,
        'offers': offers?.map((e) => e.toJson()).toList()
      };
}

class ListPrice {
  final double? amount;
  final String? currencyCode;

  ListPrice({
    this.amount,
    this.currencyCode,
  });

  ListPrice.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as double?,
        currencyCode = json['currencyCode'] as String?;

  Map<String, dynamic> toJson() => {'amount': amount, 'currencyCode': currencyCode};
}

class RetailPrice {
  final double? amount;
  final String? currencyCode;

  RetailPrice({
    this.amount,
    this.currencyCode,
  });

  RetailPrice.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as double?,
        currencyCode = json['currencyCode'] as String?;

  Map<String, dynamic> toJson() => {'amount': amount, 'currencyCode': currencyCode};
}

class Offers {
  final int? finskyOfferType;
  final ListPrice? listPrice;
  final RetailPrice? retailPrice;

  Offers({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  Offers.fromJson(Map<String, dynamic> json)
      : finskyOfferType = json['finskyOfferType'] as int?,
        listPrice = (json['listPrice'] as Map<String, dynamic>?) != null
            ? ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>)
            : null,
        retailPrice = (json['retailPrice'] as Map<String, dynamic>?) != null
            ? RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'finskyOfferType': finskyOfferType,
        'listPrice': listPrice?.toJson(),
        'retailPrice': retailPrice?.toJson()
      };
}