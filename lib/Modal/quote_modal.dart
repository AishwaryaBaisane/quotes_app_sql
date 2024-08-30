// // import 'dart:convert';
// //
// // class QuotesModal {
// //   List<Quotes> quotes;
// //
// //   QuotesModal({required this.quotes});
// //
// //   factory QuotesModal.fromJson(Map m1) {
// //     return QuotesModal(
// //         quotes: (m1['Quotes']  as List).map((e)=> Quotes.fromJson(e)).toList() ) ;
// //     //
// //   }
// // }
// //
// // class Quotes {
// //   // late int id;
// //   late String quote, author,category;
// //
// //   Quotes({required this.quote, required this.author,required this.category});
// //
// //   factory Quotes.fromJson(Map m1) {
// //     return Quotes( quote: m1['quote'], author: m1['author'], category: m1['category']);
// //   }
// // }
// //
// // // import 'dart:convert';
// // //
// // // QuotesModal quotesModalFromJson(String str) => QuotesModal.fromJson(json.decode(str));
// // //
// // // String quotesModalToJson(QuotesModal data) => json.encode(data.toJson());
// // //
// // // class QuotesModal {
// // //   String message;
// // //   List<Quote> quotes;
// // //
// // //   QuotesModal({
// // //     required this.message,
// // //     required this.quotes,
// // //   });
// // //
// // //   factory QuotesModal.fromJson(Map json) => QuotesModal(
// // //     message: json["message"],
// // //     quotes: List<Quote>.from(json["Quotes"].map((x) => Quote.fromJson(x))),
// // //   );
// // //
// // //   Map toJson() => {
// // //     "message": message,
// // //     "Quotes": List.from(quotes.map((x) => x.toJson())),
// // //   };
// // // }
// // //
// // // class Quote {
// // //   int id;
// // //   String category;
// // //   String quote;
// // //   String author;
// // //   String description;
// // //
// // //   Quote({
// // //     required this.id,
// // //     required this.category,
// // //     required this.quote,
// // //     required this.author,
// // //     required this.description,
// // //   });
// // //
// // //   factory Quote.fromJson(Map json) => Quote(
// // //     id: json["id"],
// // //     category: json["category"],
// // //     quote: json["quote"],
// // //     author: json["author"],
// // //     description: json["description"],
// // //   );
// // //
// // //   Map toJson() => {
// // //     "id": id,
// // //     "category": category,
// // //     "quote": quote,
// // //     "author": author,
// // //     "description": description,
// // //   };
// // // }
//
//
// // {
// // "message": "All Quotes Fetched Successfully",
// // "Quotes": [
// // {
// // "id": 1,
// // "category": "Inspiration",
// // "quote": "The only way to do great work is to love what you do.",
// // "author": "Steve Jobs",
// // "description": "Encouraging quote about the importance of passion in work."
// // },]
//
// class QuotesModal {
//   List<QuotesList> quotes = [];
//
//   QuotesModal({required this.quotes});
//
//   factory QuotesModal.fromMap(Map m1) {
//     return QuotesModal(
//         quotes:
//         (m1['Quotes'] as List).map((e) => QuotesList.fromMap(e)).toList());
//   }
// }
//
// class QuotesList {
//   late String category, quote, author, description;
//
//   QuotesList(
//       {required this.category,
//         required this.author,
//         required this.quote,
//         required this.description});
//
//   factory QuotesList.fromMap(Map m1) {
//     return QuotesList(
//         category: m1['category'],
//         author: m1['author'],
//         quote: m1['quote'],
//         description: m1['description']);
//   }
// }

class Quote {
  final String category;
  final String quote;
  final String author;
  String isLiked;

  Quote({
    required this.category,
    required this.quote,
    required this.author,
    required this.isLiked,
  });

  factory Quote.fromJson(Map json) {
    return Quote(
      category: json['cate'],
      quote: json['quote'],
      author: json['author'],
      isLiked: json['like'],
    );
  }

  Map toJson() {
    return {
      'cate': category,
      'quote': quote,
      'author': author,
      'like': isLiked,
    };
  }
}
