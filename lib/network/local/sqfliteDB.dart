import 'package:sqflite/sqflite.dart';

import '../../shared/constants/constants.dart';

class DB_WORK {
  static Database database= "" as Database;


  //creating my db
   void createDB() async {
    //look !! the 2 database vars will having the same content
    // but first one will have it's content when openDatabase() fun totally finished
    // but 2nd one will have it's content when onCreate() fun done ,, so the second catch it's content before 1st
    database = await openDatabase("moha.db", version: 1,
        onCreate: (database, version) {
          print("DB created");
          database.execute(
            "create table tasks (id INTEGER PRIMARY KEY, title TEXT , date TEXT  , time TEXT, status TEXT )"
          ).then((value) =>
          {
            print("Table created"),
          }).catchError((onError){
            print("Error when creating table ${onError}");
          });
        },
        onOpen: (database) {
            print("DB OPENED");
            getFromDB(database).then((value){
              tasks = value;
              print(value);
            });
        });
  }

  //inserting to my db
  void insertToDB()  {
    database.transaction((txn){
      return txn.rawInsert("insert into tasks (title , date , time , status) values "
          "('title','date','time','active')").then((value){
        print("Data inserted Successfully");
        getFromDB(database).then((value){
          print(value);
        });
      }).catchError((error){
        print("error in insert data ${error}");
      });

    });


  }


  //get data from my db

  Future<List<Map>> getFromDB(database) async{
    return await database.rawQuery("select * from tasks");

  }



}
