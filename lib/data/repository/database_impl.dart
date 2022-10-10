import 'package:mobile_technology/data/entity/customer_reg_entity.dart';
import 'package:mobile_technology/data/repository/database.dart';

import '../utils/exports.dart';



class CustomerRegDatabaseRepository implements BaseCustomerRegDatabaseRepository {
  static const _databaseName = 'customer_reg_database';
  static const _tableName = 'customer_reg_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnImei = "imei";
  static const _columnFirstName = 'firstName';
  static const _columnLastName = 'lastName';
  static const _columnDob = 'dob';
  static const _columnPassport = 'passport';
  static const _columnEmail = "email";
  static const _columnPicture = "picture";
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  

  @override
  Future<CustomerRegEntity> createCustomer(
      final String imei,
      final String firstName,
      final String lastName,
      final String dob,
      final String? passport,
      final String? email,
      final String picture) async {
    final db = await database;
    late final CustomerRegEntity customerRegEntity;

    CustomerRegEntity value = {
      'imei': imei,
      'firstname': firstName,
      'lastName': lastName,
      'dob': dob,
      'passport': passport,
      'email': email,
      'picture': picture
    };

    await db.transaction((txn) async {
      final id = await txn.insert(
        _tableName,
        value,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final results =
          await txn.query(_tableName, where: '$_columnId = ?', whereArgs: [id]);
      customerRegEntity = results.first;
    });
    return customerRegEntity;
  }



  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnImei TEXT NOT NULL,
            $_columnFirstName TEXT NOT NULL,
            $_columnLastName INTEGER NOT NULL,
            $_columnDob TEXT NOT NULL
            $_columnPassport TEXT
            $_columnEmail TEXT
            $_columnPicture TEXT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }
  
}
