import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../feature/offers_page/data/alltype.dart';
import '../../feature/search/data/package_model.dart';

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
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        category_id INTEGER,
        image_url TEXT,
        description TEXT,
        FOREIGN KEY (category_id) REFERENCES categories (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE packages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        offer TEXT,
        x INTEGER,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE alltypes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE package_products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        package_id INTEGER,
        product_id INTEGER,
        FOREIGN KEY (package_id) REFERENCES packages (id),
        FOREIGN KEY (product_id) REFERENCES products (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        product_id INTEGER,
        package_id INTEGER,
        quantity INTEGER DEFAULT 1,
        order_date TEXT DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (product_id) REFERENCES products (id),
        FOREIGN KEY (package_id) REFERENCES packages (id)
      )
    ''');

    await db.insert('categories', {'name': 'ملابس'});
    await db.insert('categories', {'name': 'أكسسوارات'});
    await db.insert('categories', {'name': 'الكترونيات'});

    int clothesCategoryId = 1;

    await db.insert('products', {
      'name': 'هودي أسود',
      'price': 32000.0,
      'category_id': clothesCategoryId,
      'image_url': 'https://example.com/hoodie.jpg',
      'description': 'هودي مريح بسعر مخفض 60%.'
    });

    await db.insert('products', {
      'name': 'ليبستيك أحمر',
      'price': 25000.0,
      'category_id': 2,
      'image_url': 'https://example.com/lipstick.jpg',
      'description': 'ليبستيك عالي الجودة.'
    });

    await db.insert('products', {
      'name': 'آيفون 14',
      'price': 999000.0,
      'category_id': 3,
      'image_url': 'https://example.com/iphone.jpg',
      'description': 'هاتف ذكي متقدم.'
    });

    await db.insert('packages', {
      'name': 'أساسية',
      'price': 3000.0,
      'offer': null,
      'x': 0,
      'description': '',
    });

    await db.insert('packages', {
      'name': 'أكسترا',
      'price': 3000.0,
      'offer': null,
      'x': 7,
      'description': '',
    });

    await db.insert('packages', {
      'name': 'بلس',
      'price': 3000.0,
      'offer': "أفضل قيمة مقابل سعر",
      'x': 18,
      'description': '',
    });

    await db.insert('packages', {
      'name': 'سوبر',
      'price': 3000.0,
      'offer': "أعلى مشاهدات",
      'x': 24,
      'description': '',
    });

    await db.insert('packages', {
      'name': 'باقة ملابس كاملة',
      'price': 50000.0,
      'offer': null,
      'x': 0,
      'description': 'هودي + إكسسوارات بخصم.',
    });

    List<Map<String, dynamic>> alltypesData = constalltype.map((type) => {
      'name': type.name,
      'image': type.image,
    }).toList();

    for (var data in alltypesData) {
      await db.insert('alltypes', data);
    }
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE packages ADD COLUMN offer TEXT;');
      await db.execute('ALTER TABLE packages ADD COLUMN x INTEGER;');

      await _insertOrUpdatePackage(db, 'أساسية', 3000.0, null, 0);
      await _insertOrUpdatePackage(db, 'أكسترا', 3000.0, null, 7);
      await _insertOrUpdatePackage(db, 'بلس', 3000.0, "أفضل قيمة مقابل سعر", 18);
      await _insertOrUpdatePackage(db, 'سوبر', 3000.0, "أعلى مشاهدات", 24);
    }
  }

  Future<void> _insertOrUpdatePackage(Database db, String name, double price, String? offer, int x) async {
    int count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM packages WHERE name = ?', [name])) ?? 0;
    if (count == 0) {
      await db.insert('packages', {
        'name': name,
        'price': price,
        'offer': offer,
        'x': x,
        'description': '',
      });
    } else {
      await db.update('packages', {
        'price': price,
        'offer': offer,
        'x': x,
        'description': '',
      }, where: 'name = ?', whereArgs: [name]);
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    return await db.rawQuery('''
      SELECT p.name, p.price, p.image_url, c.name as category 
      FROM products p 
      JOIN categories c ON p.category_id = c.id
    ''');
  }

  Future<List<String>> getCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT name FROM categories ORDER BY id');
    List<String> categories = ['كل العروض'];
    for (var map in maps) {
      categories.add(map['name'] as String);
    }
    return categories;
  }

  Future<List<Map<String, dynamic>>> getAlltypes() async {
    final db = await database;
    return await db.rawQuery('SELECT name, image FROM alltypes');
  }

  Future<List<PackageModel>> getPackages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'packages',
      where: "name IN ('أساسية', 'أكسترا', 'بلس', 'سوبر')",
      orderBy: 'x',
    );
    return List.generate(maps.length, (i) {
      double priceNum = maps[i]['price'] as double;
      String priceStr = priceNum.toStringAsFixed(0)
          .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
      priceStr += 'ج.م';
      return PackageModel(
        name: maps[i]['name'] as String,
        price: priceStr,
        offer: maps[i]['offer'] as String?,
        x: maps[i]['x'] as int,
        isChecked: false,
      );
    });
  }

  Future<int> addOrder(int userId, int productId, int quantity) async {
    final db = await database;
    return await db.insert('orders', {
      'user_id': userId,
      'product_id': productId,
      'quantity': quantity,
    });
  }
}