// import 'dart:convert';
//
// TradeModel tradeModelFromJson(String str) =>
//     TradeModel.fromJson(json.decode(str));
//
// String tradeModelToJson(TradeModel data) => json.encode(data.toJson());
//
// class TradeModel {
//   final String dateTime;
//   final String tradeAmount;
//   final String id;
//
//   TradeModel({
//     required this.dateTime,
//     required this.tradeAmount,
//     required this.id,
//   });
//
//   factory TradeModel.fromJson(Map<String, dynamic> json) => TradeModel(
//         dateTime: json["dateTime"],
//         tradeAmount: json["tradeAmount"],
//         id: json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "dateTime": dateTime,
//         "tradeAmount": tradeAmount,
//         "id": id,
//       };
// }
//
// List<TradeModel> tList = [
//   TradeModel(dateTime: 'bugun', id: '1', tradeAmount: '23000'),
//   TradeModel(dateTime: 'bugun', id: '1', tradeAmount: '23000'),
//   // TradeModel(dateTime: 'bugun', id: '1', tradeAmount: '23000'),
//   // TradeModel(dateTime: 'bugun', id: '1', tradeAmount: '23000'),
// ];
