import 'package:mobile_technology/data/entity/customer_reg_entity.dart';
import 'package:mobile_technology/data/entity/failure.dart';
import 'package:mobile_technology/data/repository/database.dart';

import '../utils/exports.dart';
import 'package:dartz/dartz.dart';

class CustomerRegDatabaseRepository
    implements BaseCustomerRegDatabaseRepository {
  static const _databaseName = 'customerRegDatabase';
  static const _tableName = 'customerRegTable';
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
  Future<Either<Failure, CustomerRegEntity>> createCustomer(
      final String? imei,
      final String firstName,
      final String lastName,
      final String dob,
      final String? passport,
      final String? email,
      final String picture) async {
    final db = await database;
    late final CustomerRegEntity customerRegEntity;
    debugPrint(FlavorConfig.instance!.values.path);
    debugPrint(imei);
    debugPrint(firstName);
    debugPrint(lastName);
    debugPrint(dob);
    debugPrint(passport);
    debugPrint(email);
    debugPrint(picture);

    CustomerRegEntity value = {
      'imei': imei,
      'firstname': firstName,
      'lastName': lastName,
      'dob': dob,
      'passport': passport,
      'email': email,
      'picture': picture
    };
    debugPrint(value.toString());

    try {
      await db.transaction((txn) async {
        final id = await txn.insert(
          _tableName,
          value,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        final results = await txn
            .query(_tableName, where: '$_columnId = ?', whereArgs: [id]);
            debugPrint("This are the results $results");
        customerRegEntity = results.last;
      });
      return Right(customerRegEntity);
    } catch (e) {
      debugPrint("Catched error os $e");
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Database> _initDatabase() async {
    debugPrint(FlavorConfig.instance!.values.path);
    return await openDatabase(
      join(FlavorConfig.instance!.values.path, _databaseName),
      onCreate: (db, _) async {
        await db.execute('''
CREATE TABLE IF NOT EXISTS $_tableName (
        $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $_columnImei TEXT,
        $_columnFirstName TEXT,
        $_columnLastName TEXT,
        $_columnDob TEXT,
        $_columnPassport TEXT,
        $_columnEmail TEXT,
        $_columnPicture TEXT
        
        )
        ''');
      },
      version: _databaseVersion,
    );
  }
}
