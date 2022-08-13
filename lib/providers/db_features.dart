import 'package:expenses_app/models/features_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBFeatures {
    static Database? _database;

    static final DBFeatures db = DBFeatures._();
    DBFeatures._();

    Future<Database> get database async {
        if (_database != null) {
            return _database!; // Con el signo de exclamación indicamos que su valor no será NULL
        }

        _database = await initDB();

        return _database!; // Con el signo de exclamación indicamos que su valor no será NULL
    }

    // Crearemos nuestra base de datos
    initDB() async {
        var databasePath = await getDatabasesPath();

        String path = join(databasePath, 'featureDB.db');

        return await openDatabase(
            path, 
            version: 1, 
            onCreate: (Database db, int version) async {
                // Creando la tabla features en la base de datos
                await db.execute('CREATE TABLE features (id INTEGER PRIMARY KEY, category TEXT, color TEXT, icon TEXT)');
            }
        );
    }

    addNewFeature(FeaturesModel feature) async {
        final db = await database;
        final response = db.insert('features', feature.toJson());
        return response;
    }

    Future<List<FeaturesModel>> getAllFeature() async {
        final db = await database;
        final response = await db.query('features'); // json
        List<FeaturesModel> fList = response.isNotEmpty ? response.map((e) => FeaturesModel.fromJson(e)).toList() : [];
        return fList;
    }
}