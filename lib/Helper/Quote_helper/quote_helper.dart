// // // // // //
// // // // // // import 'package:sqflite/sqflite.dart';
// // // // // // import 'package:path/path.dart';
// // // // // //
// // // // // // class DatabaseHelper {
// // // // // //   static final DatabaseHelper _instance = DatabaseHelper._internal();
// // // // // //   static Database? _database;
// // // // // //
// // // // // //   factory DatabaseHelper() {
// // // // // //     return _instance;
// // // // // //   }
// // // // // //
// // // // // //   DatabaseHelper._internal();
// // // // // //
// // // // // //   Future<Database> get database async {
// // // // // //     if (_database != null) return _database!;
// // // // // //     _database = await _initDatabase();
// // // // // //     return _database!;
// // // // // //   }
// // // // // //
// // // // // //   Future<Database> _initDatabase() async {
// // // // // //     String path = join(await getDatabasesPath(), 'quotes.db');
// // // // // //     return await openDatabase(
// // // // // //       path,
// // // // // //       version: 1,
// // // // // //       onCreate: (db, version) {
// // // // // //         return db.execute(
// // // // // //           'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, quote TEXT, author TEXT, category TEXT)',
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // //
// // // // // //   Future<void> insertFavorite(Map<String, Object?> quote) async {
// // // // // //     final db = await database;
// // // // // //     await db.insert(
// // // // // //       'favorites',
// // // // // //       quote,
// // // // // //       conflictAlgorithm: ConflictAlgorithm.replace,
// // // // // //     );
// // // // // //   }
// // // // // //
// // // // // //   Future<void> removeFavorite(int id) async {
// // // // // //     final db = await database;
// // // // // //     await db.delete(
// // // // // //       'favorites',
// // // // // //       where: 'id = ?',
// // // // // //       whereArgs: [id],
// // // // // //     );
// // // // // //   }
// // // // // //
// // // // // //   Future getFavorites() async {
// // // // // //     final db = await database;
// // // // // //     return await db.query('favorites');
// // // // // //   }
// // // // // // }
// // // // //
// // // // // import 'package:quotes_app_data_base/modal/quote_modal.dart';
// // // // // import 'package:sqflite/sqflite.dart';
// // // // // import 'package:path/path.dart';
// // // // //
// // // // // class DatabaseHelper {
// // // // //   static final DatabaseHelper _instance = DatabaseHelper._internal();
// // // // //   static Database? _database;
// // // // //
// // // // //   factory DatabaseHelper() {
// // // // //     return _instance;
// // // // //   }
// // // // //
// // // // //   DatabaseHelper._internal();
// // // // //
// // // // //   Future<Database> get database async {
// // // // //     if (_database != null) return _database!;
// // // // //     _database = await _initDatabase();
// // // // //     return _database!;
// // // // //   }
// // // // //
// // // // //   Future<Database> _initDatabase() async {
// // // // //     String path = join(await getDatabasesPath(), 'quotes.db');
// // // // //     return await openDatabase(
// // // // //       path,
// // // // //       version: 1,
// // // // //       onCreate: (db, version) {
// // // // //         return db.execute(
// // // // //           'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, quote TEXT, author TEXT, category TEXT)',
// // // // //         );
// // // // //       },
// // // // //     );
// // // // //   }
// // // // //
// // // // //   Future<void> insertFavorite(QuotesModal quote) async {
// // // // //     final db = await database;
// // // // //     try {
// // // // //       await db.insert(
// // // // //         'favorites',
// // // // //         quote.toMap(),
// // // // //         conflictAlgorithm: ConflictAlgorithm.replace,
// // // // //       );
// // // // //     } catch (e) {
// // // // //       print("Error inserting favorite: $e");
// // // // //     }
// // // // //   }
// // // // //
// // // // //   Future<void> removeFavorite(int id) async {
// // // // //     final db = await database;
// // // // //     try {
// // // // //       await db.delete(
// // // // //         'favorites',
// // // // //         where: 'id = ?',
// // // // //         whereArgs: [id],
// // // // //       );
// // // // //     } catch (e) {
// // // // //       print("Error removing favorite: $e");
// // // // //     }
// // // // //   }
// // // // //
// // // // //   Future<List<Map<String, dynamic>>> getFavorites() async {
// // // // //     final db = await database;
// // // // //     try {
// // // // //       return await db.query('favorites');
// // // // //     } catch (e) {
// // // // //       print("Error fetching favorites: $e");
// // // // //       return [];
// // // // //     }
// // // // //   }
// // // // // }
// // // //
// // // // import 'package:quotes_app_data_base/modal/quote_modal.dart';
// // // // import 'package:sqflite/sqflite.dart';
// // // // import 'package:path/path.dart';
// // // //
// // // // class DatabaseHelper {
// // // //   static final DatabaseHelper _instance = DatabaseHelper._internal();
// // // //   static Database? _database;
// // // //
// // // //   factory DatabaseHelper() {
// // // //     return _instance;
// // // //   }
// // // //
// // // //   DatabaseHelper._internal();
// // // //
// // // //   Future<Database> get database async {
// // // //     if (_database != null) return _database!;
// // // //     _database = await _initDatabase();
// // // //     return _database!;
// // // //   }
// // // //
// // // //   Future<Database> _initDatabase() async {
// // // //     String path = join(await getDatabasesPath(), 'quotes.db');
// // // //     return await openDatabase(
// // // //       path,
// // // //       version: 1,
// // // //       onCreate: (db, version) {
// // // //         return db.execute(
// // // //           'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, quote TEXT, author TEXT, category TEXT)',
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // //
// // // //   Future<void> insertFavorite(Quote quote) async {
// // // //     final db = await database;
// // // //     try {
// // // //       await db.insert(
// // // //         'favorites',
// // // //         quote as Map<String, Object?>,
// // // //         conflictAlgorithm: ConflictAlgorithm.replace,
// // // //       );
// // // //     } catch (e) {
// // // //       print("Error inserting favorite: $e");
// // // //     }
// // // //   }
// // // //
// // // //   Future<void> removeFavorite(int id) async {
// // // //     final db = await database;
// // // //     try {
// // // //       await db.delete(
// // // //         'favorites',
// // // //         where: 'id = ?',
// // // //         whereArgs: [id],
// // // //       );
// // // //     } catch (e) {
// // // //       print("Error removing favorite: $e");
// // // //     }
// // // //   }
// // // //
// // // //   Future<List<Quote>> getFavorites() async {
// // // //     final db = await database;
// // // //     try {
// // // //       final List<Map<String, dynamic>> maps = await db.query('favorites');
// // // //       return List.generate(maps.length, (i) {
// // // //         return Quote.fromJson(maps[i]);
// // // //       });
// // // //     } catch (e) {
// // // //       print("Error fetching favorites: $e");
// // // //       return [];
// // // //     }
// // // //   }
// // // // }
// // //
// // // import 'dart:convert';
// // //
// // // import 'package:sqflite/sqflite.dart';
// // // import 'package:path/path.dart';
// // // import 'package:http/http.dart' as http;
// // //
// // //
// // // class DatabaseHelper {
// // //   static final DatabaseHelper _instance = DatabaseHelper._internal();
// // //   static Database? _database;
// // //
// // //   factory DatabaseHelper() {
// // //     return _instance;
// // //   }
// // //
// // //   DatabaseHelper._internal();
// // //
// // //   fetchQuotes() async
// // //   {
// // //     final response = await http.get(Uri.parse('https://api-get-quotes.vercel.app/api/v1/quotes'));
// // //     if (response.statusCode == 200)
// // //     {
// // //       print(response.body.length);
// // //       return jsonDecode(response.body);
// // //
// // //     } else {
// // //       {}
// // //     }
// // //   }
// // //
// // //   // Future<Database> get database async {
// // //   //   if (_database != null) return _database!;
// // //   //   _database = await _initDatabase();
// // //   //   return _database!;
// // //   // }
// // //   //
// // //   // Future<Database> _initDatabase() async {
// // //   //   String path = join(await getDatabasesPath(), 'quotes.db');
// // //   //   return await openDatabase(
// // //   //     path,
// // //   //     version: 1,
// // //   //     onCreate: (db, version) {
// // //   //       return db.execute(
// // //   //         'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, quote TEXT, author TEXT, category TEXT)',
// // //   //       );
// // //   //     },
// // //   //   );
// // //   // }
// // //   //
// // //   // Future<void> insertFavorite(Map<String, dynamic> quote) async {
// // //   //   final db = await database;
// // //   //   await db.insert(
// // //   //     'favorites',
// // //   //     quote,
// // //   //     conflictAlgorithm: ConflictAlgorithm.replace,
// // //   //   );
// // //   // }
// // //   //
// // //   // Future<void> removeFavorite(int id) async {
// // //   //   final db = await database;
// // //   //   await db.delete(
// // //   //     'favorites',
// // //   //     where: 'id = ?',
// // //   //     whereArgs: [id],
// // //   //   );
// // //   // }
// // //   //
// // //   // Future<List<Map<String, dynamic>>> getFavorites() async {
// // //   //   final db = await database;
// // //   //   return await db.query('favorites');
// // //   // }
// // // }
// //
// // import 'dart:convert';
// //
// // import 'package:sqflite/sqflite.dart';
// // import 'package:path/path.dart';
// // import 'package:http/http.dart' as http;
// //
// // class DatabaseHelper {
// //
// //   static DatabaseHelper quotesHelper = DatabaseHelper._();
// //   DatabaseHelper._();
// //
// //   Database? _db;
// //
// //   Future<Database?> get database async => _db ?? await initDatabase();
// //
// //   factory DatabaseHelper() {
// //     return _instance;
// //   }
// //
// //   DatabaseHelper._internal();
// //
// //    fetchQuotes() async {
// //     {
// //       final response =
// //           await http.get(Uri.parse('https://api-get-quotes.vercel.app/api/v1/quotes'));
// //       if (response.statusCode == 200) {
// //         return jsonDecode(response.body);
// //       } else {
// //         {
// //
// //         }
// //       }
// //     }
// //   }
// //   //
// //   Future<Database?> initDatabase() async {
// //     final path = await getDatabasesPath();
// //     final dbPath = join(path, 'quoteData.db');
// //
// //     _db = await openDatabase(
// //       dbPath,
// //       version: 1,
// //       onCreate: (db, version) async {
// //         String sql = '''CREATE TABLE quoteData(
// //           id INTEGER PRIMARY KEY AUTOINCREMENT,
// //           category TEXT,
// //           quote TEXT,
// //           author TEXT,
// //           description TEXT
// //         );''';
// //         await db.execute(sql);
// //       },
// //     );
// //     return _db!;
// //   }
// //
// //   Future<void> insertData(String category,String quote,String author,String description)
// //   async {
// //     Database? db = await database;
// //     String sql='''
// //     INSERT INTO quoteData(category,quote,author,description) VALUES(?,?,?,?);
// //     ''';
// //     List args=[category,quote,author,description];
// //     await db!.rawInsert(sql,args);
// //   }
// //
// //   Future<List<Map<String, Object?>>> readData() async {
// //     Database? db = await database;
// //     String sql = '''
// //     SELECT * FROM quoteData;
// //     ''';
// //     return await db!.rawQuery(sql);
// //   }
// // }
//
// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class QuotesHelper {
//   Future<Map<String, dynamic>?> fetchData() async {
//     Uri url = Uri.parse('https://api-get-quotes.vercel.app/api/v1/quotes');
//     Response response = await http.get(url);
//     if (response.statusCode == 200) {
//       final json = response.body;
//       Map<String, dynamic> data = jsonDecode(json);
//       return data;
//     } else {
//       return {};
//     }
//   }
//
//   static QuotesHelper quotesHelper = QuotesHelper._();
//   QuotesHelper._();
//
//   Database? _db;
//
//   Future<Database?> get database async => _db ?? await initDatabase();
//
//   Future<Database?> initDatabase() async {
//     final path = await getDatabasesPath();
//     final dbPath = join(path, 'quoteData.db');
//
//     _db = await openDatabase(
//       dbPath,
//       version: 1,
//       onCreate: (db, version) async {
//         String sql = '''CREATE TABLE quoteData(
//           id INTEGER PRIMARY KEY AUTOINCREMENT,
//           category TEXT,
//           quote TEXT,
//           author TEXT,
//           description TEXT,
//           like INTEGER,
//         );''';
//         await db.execute(sql);
//       },
//     );
//     return _db!;
//   }
//
//   Future<void> insertData(String category,String quote,String author,String description,int like)
//   async {
//     Database? db = await database;
//     String sql='''
//     INSERT INTO quoteData(category,quote,author,description,like) VALUES(?,?,?,?,?);
//     ''';
//     List args=[category,quote,author,description,like];
//     await db!.rawInsert(sql,args);
//   }
//
//
//   // Future<void> insertQuotes(String Quotes)
//   // async {
//   //   Database? db = await database;
//   //   String sql='''
//   //   INSERT INTO quoteData(category,quote,author,description,like,Quotes) VALUES(?);
//   //   ''';
//   //
//   // }
//
//
//   Future<List<Map<String, Object?>>> readData() async {
//     Database? db = await database;
//     String sql = '''
//     SELECT * FROM quoteData;
//     ''';
//     return await db!.rawQuery(sql);
//   }
//
//   Future<void> updateData(int like,int id)
//   async {
//     Database? db=await database;
//     String sql='''
//   UPDATE quoteData
//   SET like = ?
//   WHERE id = ?;
//   ''';
//     List args=[like,id];
//     await db!.rawUpdate(sql,args);
//   }
//
//   // Future<void> insertData2(int like,String Quotes)
//   // async {
//   //   Database? db=await database;
//   //   String sql='''
//   // UPDATE quoteData
//   // SET like = ?
//   // WHERE Quotes = ?;
//   // ''';
//   //   List args=[like,Quotes];
//   //   await db!.rawUpdate(sql,args);
//   // }
// //w
// }

import 'package:path/path.dart';
import 'package:quotes_app_sql/Modal/quote_modal.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'quotes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE likedQuotes (
            category TEXT,
            quote TEXT,
            author TEXT,
            isLiked TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertLikedQuote(Quote quote) async {
    final db = await database;
    await db.insert(
      'likedQuotes',
      quote.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteLikedQuote(String quote) async {
    final db = await database;
    await db.delete(
      'likedQuotes',
      where: 'quote = ?',
      whereArgs: [quote],
    );
  }

  Future<List<Quote>> getLikedQuotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('likedQuotes');

    return List.generate(maps.length, (i) {
      return Quote.fromJson(maps[i]);
    });
  }
}