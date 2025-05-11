import 'dart:async';
import 'package:floor/floor.dart';
import 'package:primer_parcial/data/users_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:primer_parcial/domain/models/user.dart';

part 'users_database.g.dart';

@Database(version: 1, entities: [User])
abstract class UsersDatabase extends FloorDatabase {
  UsersDao get usersDao;
}