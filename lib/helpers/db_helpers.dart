import 'package:sqflite/sqflite.dart' as sql;

/// Helper class to manage SQLite database with sqflite
class SqfHelper {
  /// Create the table if it does not exist
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''
      CREATE TABLE data(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  /// Get database instance, creates database file if not exists
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'data.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  /// Insert new data into the database
  static Future<int> createData(String title, String? description) async {
    final db = await SqfHelper.db();
    final data = {
      'title': title,
      'description': description
    };
    return db.insert(
      'data',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  /// Get all data ordered by id
  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await SqfHelper.db();
    return db.query('data', orderBy: 'id');
  }

  /// Get a single data row by id
  static Future<Map<String, dynamic>?> getSingleData(int id) async {
    final db = await SqfHelper.db();
    final result = await db.query(
      'data',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  /// Update a row by id
  static Future<int> updateData(int id, String title, String? description) async {
    final db = await SqfHelper.db();
    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toIso8601String(),
    };
    return db.update(
      'data',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Delete a row by id
  static Future<void> deleteData(int id) async {
    final db = await SqfHelper.db();
    try {
      await db.delete(
        'data',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error deleting data: $e');
    }
  }
}
