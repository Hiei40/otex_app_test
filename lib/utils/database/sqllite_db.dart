import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../feature/offers_page/data/alltype.dart';
import '../photos/photos.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../photos/photos.dart';

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
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    // إنشاء جدول المنتجات
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

    // إنشاء جدول packages (كان مفقوداً)
    await db.execute('''
      CREATE TABLE packages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
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

    // إدراج الفئات بدون تحديد ID للسماح بالـ AUTOINCREMENT
    await db.insert('categories', {'name': 'ملابس'});
    await db.insert('categories', {'name': 'أكسسوارات'});
    await db.insert('categories', {'name': 'الكترونيات'});

    // الحصول على ID الفئة "ملابس" (التي أصبحت id=1)
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
      'name': 'باقة ملابس كاملة',
      'price': 50000.0,
      'description': 'هودي + إكسسوارات بخصم.'
    });

    List<Map<String, dynamic>> alltypesData = constalltype.map((type) => {
      'name': type.name,
      'image': type.image,
    }).toList();

    for (var data in alltypesData) {
      await db.insert('alltypes', data);
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

  // Add this new method to fetch alltypes from DB
  Future<List<Map<String, dynamic>>> getAlltypes() async {
    final db = await database;
    return await db.rawQuery('SELECT name, image FROM alltypes');
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