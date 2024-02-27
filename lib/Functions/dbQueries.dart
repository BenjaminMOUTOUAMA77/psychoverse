import 'dart:ffi';

import 'package:powersync/powersync.dart';
import 'package:psychoverse/Functions/dbConnexion.dart';
import 'package:psychoverse/Models/abonnement.dart';
import 'package:psychoverse/Models/achat_terv.dart';
import 'package:psychoverse/Models/analyse_fonctionnelle.dart';
import 'package:psychoverse/Models/asm.dart';
import 'package:psychoverse/Models/couple.dart';
import 'package:psychoverse/Models/fait.dart';
import 'package:psychoverse/Models/fait_patient.dart';
import 'package:psychoverse/Models/fonctionnalite.dart';
import 'package:psychoverse/Models/formulaire.dart';
import 'package:psychoverse/Models/formulaire_patient.dart';
import 'package:psychoverse/Models/global_files.dart';
import 'package:psychoverse/Models/loisir_patient.dart';
import 'package:psychoverse/Models/my_files.dart';
import 'package:psychoverse/Models/file_manager.dart';
import 'package:psychoverse/Models/my_users.dart';
import 'package:psychoverse/Models/patient.dart';
import 'package:psychoverse/Models/patient_type_fait_autre.dart';
import 'package:psychoverse/Models/patient_type_fait_commentaire.dart';
import 'package:psychoverse/Models/personne.dart';
import 'package:psychoverse/Models/probleme_files.dart';
import 'package:psychoverse/Models/quote.dart';
import 'package:psychoverse/Models/relation.dart';
import 'package:psychoverse/Models/rorsharch.dart';
import 'package:psychoverse/Models/rorsharch_patient.dart';
import 'package:psychoverse/Models/seance.dart';
import 'package:psychoverse/Models/simple_test.dart';
import 'package:psychoverse/Models/simple_test_patient.dart';
import 'package:psychoverse/Models/strategie_therapeutique.dart';
import 'package:psychoverse/Models/terv.dart';
import 'package:psychoverse/Models/terv_exp.dart';
import 'package:psychoverse/Models/terv_exp_patient.dart';
import 'package:psychoverse/Models/terv_niveau.dart';
import 'package:psychoverse/Models/terv_suivi.dart';
import 'package:psychoverse/Models/terv_suivi_niveau_interdit.dart';
import 'package:psychoverse/Models/trame_anamnese.dart';
import 'package:psychoverse/Models/type_suivi.dart';
import 'package:psychoverse/Models/users.dart';
import 'package:psychoverse/Models/variables.dart';

class dbq {
  //************************************************************************************************************//
//************************************************************************************************************//
//                            My_USERS
//************************************************************************************************************//
  //************************************************************************************************************//
  // my_users
  static Stream<List<My_users>> watchAllMy_users() {
    String sql = "SELECT * FROM my_users ORDER BY created_at DESC";
    return db.watch(sql).map((result) {
      return result.map((row) => My_users.fromRow(row)).toList();
    });
  }

  static Future<List<My_users>> getAllMy_users() async {
    String sql = "SELECT * FROM my_users ORDER BY created_at DESC";
    return await db.getAll(sql).then((result) {
      return result.map((row) => My_users.fromRow(row)).toList();
    });
  }

  static Future<My_users> getMy_users(My_users my_users) async {
    String sql = "SELECT * FROM my_users WHERE id=?";
    return await db
        .get(sql, [my_users.id]).then((row) => My_users.fromRow(row));
  }

  static Future<String> createMy_users(My_users my_users, bool isLocal) async {
    String theId = uuid.v4();
    String sql =
        "INSERT INTO my_users(id,created_at,user_id,is_local) VALUES(?,?,?,?)";
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      my_users.user_id,
      my_users.is_local.toString(),
    ]);
  return theId;
  }

  static Future<void> updateMy_users(
      String ancien_my_usersId, My_users new_my_users, bool isLocal) async {
    String sql = "UPDATE my_users SET id=?,user_id=?,is_local=? WHERE id = ?";
    await db.execute(sql, [
      new_my_users.id,
      new_my_users.user_id,
      new_my_users.is_local.toString(),
      ancien_my_usersId
    ]);
  }

  static Future<void> deleteMy_users(My_users my_users, bool isLocal) async {
    String sql = "DELETE FROM my_users WHERE id=?";
    await db.execute(sql, [my_users.id]);
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static dynamic getNum_dossier(bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT max(num_dossier) FROM local_patient WHERE asm_id=?";
    } else {
      sql = "SELECT max(num_dossier) FROM FROM patient WHERE asm_id=?";
    }
    return await db.get(sql, [asm_id]).then((value) {
      return value.values;
    });
  }
  /////////// file_manager *******************************************************************************************////////////

  static Stream<List<File_manager>> watchAllFile_manager() {
    return db
        .watch("SELECT * FROM file_manager ORDER BY created_at DESC")
        .map((result) {
      return result.map((row) => File_manager.fromRow(row)).toList();
    });
  }

  static Future<List<File_manager>> getAllFile_manager() async {
    return await db
        .getAll("SELECT * FROM file_manager ORDER BY created_at DESC")
        .then((result) {
      return result.map((row) => File_manager.fromRow(row)).toList();
    });
  }

  static Future<File_manager> getFile_manager(File_manager file_manager) async {
    return await db.get("SELECT * FROM file_manager WHERE id=?",
        [file_manager.id]).then((row) => File_manager.fromRow(row));
  }

  static Future<String> createFile_manager(File_manager file_manager) async {
    String theId = uuid.v4();
    await db.execute(
        "INSERT INTO file_manager(id,created_at,online_file,offline_file) VALUES(?,?,?,?)",
        [
          theId,
          DateTime.now().toString(),
          file_manager.online_file,
          file_manager.offline_file,
        ]);
  return theId;
  }

  static Future<void> updateFile_manager(
      String ancien_file_managerId, File_manager new_file_manager) async {
    await db.execute(
        "UPDATE file_manager SET id=?,online_file=?,offline_file=? WHERE id = ?",
        [
          new_file_manager.id,
          new_file_manager.online_file,
          new_file_manager.offline_file,
          ancien_file_managerId
        ]);
  }

  static Future<void> deleteFile_manager(File_manager file_manager) async {
    await db.execute("DELETE FROM file_manager WHERE id=?", [file_manager.id]);
  }

  //************************************************************************************************************//
//************************************************************************************************************//
//                            USERS
//************************************************************************************************************//
  //************************************************************************************************************//
  // users Table  operations
  static Stream<List<App_users>> watchAllUsers(bool isLocal) {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_users ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM users ORDER BY created_at DESC";
    }
    return db.watch(sql).map((result) {
      return result.map((row) => App_users.fromRow(row)).toList();
    });
  }

  static Future<List<App_users>> getAllUsers(bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_users ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM users ORDER BY created_at DESC";
    }
    return await db.getAll(sql).then((result) {
      return result.map((row) => App_users.fromRow(row)).toList();
    });
  }

  static Future<App_users> getUser(App_users user, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_users WHERE id=?";
    } else {
      sql = "SELECT * FROM users WHERE id=?";
    }
    return await db.get(sql, [user.id]).then((row) => App_users.fromRow(row));
  }

  static Future<String> createUser(App_users user, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_users(id,created_at,nom, prenom, email,password, telephone, im_profil, user_type, bucket_id,is_local_user,validate_status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO users(id,created_at,nom, prenom, email,password, telephone, im_profil, user_type, bucket_id,is_local_user,validate_status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      user.nom,
      user.prenom,
      user.email,
      user.password,
      user.telephone,
      user.im_profil,
      user.user_type,
      user.bucket_id,
      user.is_local_user.toString(),
      user.validate_status.toString()
    ]);
  return theId;
  }

  static Future<void> updateUser(
      String ancienUserId, App_users new_user, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_users SET id=?,nom=?, prenom=?, email=?,password=?, telephone=?, im_profil=?, user_type=?, bucket_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE users SET id=?,nom=?, prenom=?, email=?,password=?, telephone=?, im_profil=?, user_type=?, bucket_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_user.id,
      new_user.nom,
      new_user.email,
      new_user.password,
      new_user.telephone,
      new_user.im_profil,
      new_user.user_type,
      new_user.bucket_id,
      ancienUserId
    ]);
  }

  static Future<void> deleteUser(App_users user, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_users WHERE id=?";
    } else {
      sql = "DELETE FROM users WHERE id=?";
    }
    await db.execute(sql, [user.id]);
    deleteAsm(Asm(id: user.id), isLocal);
    await db.execute("DELETE FROM my_users WHERE user_id=?", [user.id]);
    print("User deleted");

  }

//************************************************************************************************************//
//************************************************************************************************************//
//                            ABONNEMENT
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_abonnement and abonnement Tables  operations
  static Stream<List<Abonnement>> watchAllAbonnements(bool isLocal) {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_abonnement ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM abonnement ORDER BY created_at DESC";
    }
    return db.watch(sql).map((result) {
      return result.map((row) => Abonnement.fromRow(row)).toList();
    });
  }

  static Future<List<Abonnement>> getAllAbonnements(bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_abonnement ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM abonnement ORDER BY created_at DESC";
    }
    return await db.getAll(sql).then((result) {
      return result.map((row) => Abonnement.fromRow(row)).toList();
    });
  }

  static Future<Abonnement> getAbonnement(
      Abonnement abonnement, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_abonnement WHERE id=?";
    } else {
      sql = "SELECT * FROM abonnement WHERE id=?";
    }
    return await db
        .get(sql, [abonnement.id]).then((row) => Abonnement.fromRow(row));
  }

  static Future<String> createAbonnement(
      Abonnement abonnement, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_abonnement(id,created_at,nom, image, prix) VALUES(?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO abonnement(id,created_at,nom, image, prix) VALUES(?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      abonnement.nom,
      abonnement.image,
      abonnement.prix
    ]);
  return theId;
  }

  static Future<void> updateAbonnement(
      String ancienAbonnementId, Abonnement newAbonnement, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_abonnement SET id=?,nom=?, image=?, prix=? WHERE id = ?";
    } else {
      sql = "UPDATE abonnement SET id=?,nom=?, image=?, prix=? WHERE id = ?";
    }
    await db.execute(sql, [
      newAbonnement.id,
      newAbonnement.nom,
      newAbonnement.image,
      newAbonnement.prix,
      ancienAbonnementId
    ]);
  }

  static Future<void> deleteAbonnement(
      Abonnement abonnement, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_abonnement WHERE id=?";
    } else {
      sql = "DELETE FROM abonnement WHERE id=?";
    }
    await db.execute(sql, [abonnement.id]);
  }

//************************************************************************************************************//
  //************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            FONCTIONNALITE
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_fonctionnalite and fonctionnalite Tables  operations
  static Stream<List<Fonctionnalite>> watchAllFonctionnalites(bool isLocal) {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_fonctionnalite ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM fonctionnalite ORDER BY created_at DESC";
    }
    return db.watch(sql).map((result) {
      return result.map((row) => Fonctionnalite.fromRow(row)).toList();
    });
  }

  static Future<List<Fonctionnalite>> getAllFonctionnalites(
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_fonctionnalite ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM fonctionnalite ORDER BY created_at DESC";
    }
    return await db.getAll(sql).then((result) {
      return result.map((row) => Fonctionnalite.fromRow(row)).toList();
    });
  }

  static Future<Fonctionnalite> getFonctionnalite(
      Fonctionnalite fonctionnalite, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_fonctionnalite WHERE id=?";
    } else {
      sql = "SELECT * FROM fonctionnalite WHERE id=?";
    }
    return await db.get(
        sql, [fonctionnalite.id]).then((row) => Fonctionnalite.fromRow(row));
  }

  static Future<String> createFonctionnalite(
      Fonctionnalite fonctionnalite, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_fonctionnalite(id,created_at, nom, abonnement_id) VALUES(?,?,?,?)";
    } else {
      sql =
          "INSERT INTO fonctionnalite(id,created_at, nom, abonnement_id) VALUES(?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      fonctionnalite.nom,
      fonctionnalite.abonnement_id
    ]);
  return theId;
  }

  static Future<void> updateFonctionnalite(String ancienFonctionnaliteId,
      Fonctionnalite new_fonctionnalite, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_fonctionnalite SET id=?, nom=?, abonnement_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE fonctionnalite SET id=?,nom=?, abonnement_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_fonctionnalite.id,
      new_fonctionnalite.nom,
      new_fonctionnalite.abonnement_id,
      ancienFonctionnaliteId
    ]);
  }

  static Future<void> deleteFonctionnalite(
      Fonctionnalite fonctionnalite, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_fonctionnalite WHERE id=?";
    } else {
      sql = "DELETE FROM fonctionnalite WHERE id=?";
    }
    await db.execute(sql, [fonctionnalite.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            GLOBAL FILES
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_global_files and global_files Tables  operations
  static Stream<List<Global_files>> watchAllGlobal_files(bool isLocal) {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_global_files ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM global_files ORDER BY created_at DESC";
    }
    return db.watch(sql).map((result) {
      return result.map((row) => Global_files.fromRow(row)).toList();
    });
  }

  static Future<List<Global_files>> getAllGlobal_files(bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_global_files ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM global_files ORDER BY created_at DESC";
    }
    return await db.getAll(sql).then((result) {
      return result.map((row) => Global_files.fromRow(row)).toList();
    });
  }

  static Future<Global_files> getGlobal_file(
      Global_files global_files, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_global_files WHERE id=?";
    } else {
      sql = "SELECT * FROM global_files WHERE id=?";
    }
    return await db
        .get(sql, [global_files.id]).then((row) => Global_files.fromRow(row));
  }

  static Future<String> createGlobal_files(
      Global_files global_files, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_global_files(id,created_at, name,size, extension, path) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO global_files(id,created_at, name,size, extension, path) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      global_files.name,
      global_files.size,
      global_files.extension,
      global_files.path,
    ]);
  return theId;
  }

  static Future<void> updateGlobal_file(String ancienGlobal_fileId,
      Global_files new_global_files, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_global_files SET id=?, name=?,size=?, extension=?, path=? WHERE id = ?";
    } else {
      sql =
          "UPDATE global_files SET id=?, name=?,size=?, extension=?, path=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_global_files.id,
      new_global_files.name,
      new_global_files.size,
      new_global_files.extension,
      new_global_files.path,
      ancienGlobal_fileId
    ]);
  }

  static Future<void> deleteGlobal_file(
      Global_files global_files, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_global_files WHERE id=?";
    } else {
      sql = "DELETE FROM global_files WHERE id=?";
    }
    await db.execute(sql, [global_files.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            TERV
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_terv and global_terv Tables  operations
  static Stream<List<Terv>> watchAllTervs(bool isLocal) {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_terv ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM terv ORDER BY created_at DESC";
    }
    return db.watch(sql).map((result) {
      return result.map((row) => Terv.fromRow(row)).toList();
    });
  }

  static Future<List<Terv>> getAllTervs(bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_terv ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM terv ORDER BY created_at DESC";
    }
    return await db.getAll(sql).then((result) {
      return result.map((row) => Terv.fromRow(row)).toList();
    });
  }

  static Future<Terv> getTerv(Terv terv, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_terv WHERE id=?";
    } else {
      sql = "SELECT * FROM terv WHERE id=?";
    }
    return await db.get(sql, [terv.id]).then((row) => Terv.fromRow(row));
  }

  static Future<String> createTerv(Terv terv, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_terv(id,created_at, nom,image, description, phobies,plan, prix, reserve) VALUES(?,?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO terv(id,created_at, nom,image, description, phobies,plan, prix, reserve) VALUES(?,?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      terv.nom,
      terv.image,
      terv.description,
      terv.phobies,
      terv.plan,
      terv.prix.toString(),
      terv.reserve.toString(),
    ]);
  return theId;
  }

  static Future<void> updateTerv(
      String ancienTervId, Terv new_terv, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_terv SET id=?, nom=?,image=?, description=?, phobies=?,plan=?, prix=?, reserve=? WHERE id = ?";
    } else {
      sql =
          "UPDATE terv SET  id=?, nom=?,image=?, description=?, phobies=?,plan=?, prix=?, reserve=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_terv.id,
      new_terv.nom,
      new_terv.image,
      new_terv.description,
      new_terv.phobies,
      new_terv.plan,
      new_terv.prix.toString(),
      new_terv.reserve.toString(),
      ancienTervId
    ]);
  }

  static Future<void> deleteTerv(Terv terv, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_terv WHERE id=?";
    } else {
      sql = "DELETE FROM terv WHERE id=?";
    }
    await db.execute(sql, [terv.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            TERV NIVEAU
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_terv and global_terv Tables  operations
  static Stream<List<Terv_niveau>> watchAllTerv_niveau(
      bool isLocal, String terv_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_niveau WHERE terv_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_niveau WHERE terv_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [terv_id]).map((result) {
      return result.map((row) => Terv_niveau.fromRow(row)).toList();
    });
  }

  static Future<List<Terv_niveau>> getAllTerv_niveau(
      bool isLocal, String terv_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_niveau WHERE terv_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_niveau WHERE terv_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [terv_id]).then((result) {
      return result.map((row) => Terv_niveau.fromRow(row)).toList();
    });
  }

  static Future<Terv_niveau> getTerv_niveau(
      Terv_niveau terv, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_terv_niveau WHERE id=?";
    } else {
      sql = "SELECT * FROM terv_niveau WHERE id=?";
    }
    return await db.get(sql, [terv.id]).then((row) => Terv_niveau.fromRow(row));
  }

  static Future<String> createTerv_niveau(
      Terv_niveau terv_niveau, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_terv_niveau(id,created_at, nom, rang, description,plan, image,terv_id) VALUES(?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO terv_niveau(id,created_at, nom, rang, description,plan, image,terv_id) VALUES(?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      terv_niveau.nom,
      terv_niveau.rang.toString(),
      terv_niveau.description,
      terv_niveau.plan,
      terv_niveau.image,
      terv_niveau.terv_id,
    ]);
  return theId;
  }

  static Future<void> updateTerv_niveau(
      String ancienTervId, Terv_niveau new_terv_niveau, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_terv_niveau SET id=?, nom=?, rang=?, description=?,plan=?, image=?,terv_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE terv_niveau SET  id=?, nom=?, rang=?, description=?,plan=?, image=?,terv_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_terv_niveau.id,
      new_terv_niveau.nom,
      new_terv_niveau.rang.toString(),
      new_terv_niveau.description,
      new_terv_niveau.plan,
      new_terv_niveau.image,
      new_terv_niveau.terv_id,
      ancienTervId
    ]);
  }

  static Future<void> deleteTerv_niveau(
      Terv_niveau terv_niveau, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_terv_niveau WHERE id=?";
    } else {
      sql = "DELETE FROM terv_niveau WHERE id=?";
    }
    await db.execute(sql, [terv_niveau.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            TERV EXP
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_terv and global_terv Tables  operations
  static Stream<List<Terv_exp>> watchAllTerv_exp(
      bool isLocal, String terv_niv_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_expterv_exp WHERE terv_niv_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_expterv_exp WHERE terv_niv_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [terv_niv_id]).map((result) {
      return result.map((row) => Terv_exp.fromRow(row)).toList();
    });
  }

  static Future<List<Terv_exp>> getAllTerv_exp(
      bool isLocal, String terv_niv_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_exp WHERE terv_niv_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_exp WHERE terv_niv_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [terv_niv_id]).then((result) {
      return result.map((row) => Terv_exp.fromRow(row)).toList();
    });
  }

  static Future<Terv_exp> getTerv_exp(Terv_exp terv_exp, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_terv_exp WHERE id=?";
    } else {
      sql = "SELECT * FROM terv_exp WHERE id=?";
    }
    return await db
        .get(sql, [terv_exp.id]).then((row) => Terv_exp.fromRow(row));
  }

  static Future<String> createTerv_exp(Terv_exp terv_exp, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_terv_exp(id,created_at,nom, description,exp_link, vr_type, image, terv_niv_id) VALUES(?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO terv_exp(id,created_at,nom, description,exp_link, vr_type, image, terv_niv_id) VALUES(?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      terv_exp.nom,
      terv_exp.description,
      terv_exp.exp_link,
      terv_exp.vr_type,
      terv_exp.image,
      terv_exp.terv_niv_id,
    ]);
  return theId;
  }

  static Future<void> updateTerv_exp(
      String ancienTervExpId, Terv_exp new_terv_exp, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_terv_exp SET id=?,nom=?, description=?,exp_link=?, vr_type=?, image=?, terv_niv_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE terv_exp SET  id=?,nom=?, description=?,exp_link=?, vr_type=?, image=?, terv_niv_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_terv_exp.id,
      new_terv_exp.nom,
      new_terv_exp.description,
      new_terv_exp.exp_link,
      new_terv_exp.vr_type,
      new_terv_exp.image,
      new_terv_exp.terv_niv_id,
      ancienTervExpId
    ]);
  }

  static Future<void> deleteTerv_exp(Terv_exp terv_exp, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_terv_exp WHERE id=?";
    } else {
      sql = "DELETE FROM terv_exp WHERE id=?";
    }
    await db.execute(sql, [terv_exp.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            ANALYSE FONCTIONNELLE
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_terv and global_terv Tables  operations
  static Stream<List<Analyse_fonctionnelle>> watchAllAnalyse_fonctionnelle(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_analyse_fonctionnelle WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM analyse_fonctionnelle WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Analyse_fonctionnelle.fromRow(row)).toList();
    });
  }

  static Future<List<Analyse_fonctionnelle>> getAllAnalyse_fonctionnelle(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_analyse_fonctionnelle WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM analyse_fonctionnelle WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Analyse_fonctionnelle.fromRow(row)).toList();
    });
  }

  static Future<Analyse_fonctionnelle> getAnalyse_fonctionnelle(
      Analyse_fonctionnelle analyse_fonctionnelle, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_analyse_fonctionnelle WHERE id=?";
    } else {
      sql = "SELECT * FROM analyse_fonctionnelle WHERE id=?";
    }
    return await db.get(sql, [analyse_fonctionnelle.id]).then(
        (row) => Analyse_fonctionnelle.fromRow(row));
  }

  static Future<String> createAnalyse_fonctionnelle(
      Analyse_fonctionnelle analyse_fonctionnelle, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_analyse_fonctionnelle(id,created_at, nom, description, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO analyse_fonctionnelle(id,created_at, nom, description, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      analyse_fonctionnelle.nom,
      analyse_fonctionnelle.description,
      analyse_fonctionnelle.asm_id,
      analyse_fonctionnelle.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateAnalyse_fonctionnelle(String ancienTervExpId,
      Analyse_fonctionnelle new_analyse_fonctionnelle, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_analyse_fonctionnelle SET id=?, nom=?, description=?, asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE analyse_fonctionnelle SET  id=?, nom=?, description=?, asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_analyse_fonctionnelle.id,
      new_analyse_fonctionnelle.nom,
      new_analyse_fonctionnelle.description,
      new_analyse_fonctionnelle.asm_id,
      new_analyse_fonctionnelle.is_global.toString(),
      ancienTervExpId
    ]);
  }

  static Future<void> deleteAnalyse_fonctionnelle(
      Analyse_fonctionnelle analyse_fonctionnelle, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_analyse_fonctionnelle WHERE id=?";
    } else {
      sql = "DELETE FROM analyse_fonctionnelle WHERE id=?";
    }
    await db.execute(sql, [analyse_fonctionnelle.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            FAIT
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_fait and fait Tables  operations
  static Stream<List<Fait>> watchAllFait(
      bool isLocal, String asm_id, String type) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_fait WHERE (asm_id=? AND type=?) OR (is_global=true AND type=? ORDER BY created_at DESC)";
    } else {
      sql =
          "SELECT * FROM fait WHERE (asm_id=? AND type=?) OR (is_global=true AND type=? ORDER BY created_at DESC)";
    }
    return db.watch(sql, parameters: [asm_id, type, type]).map((result) {
      return result.map((row) => Fait.fromRow(row)).toList();
    });
  }

  static Future<List<Fait>> getAllFait(
      bool isLocal, String asm_id, String type) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_fait WHERE (asm_id=? AND type=?) OR (is_global=true AND type=? ORDER BY created_at DESC)";
    } else {
      sql =
          "SELECT * FROM fait WHERE (asm_id=? AND type=?) OR (is_global=true AND type=? ORDER BY created_at DESC)";
    }
    return await db.getAll(sql, [asm_id, type, type]).then((result) {
      return result.map((row) => Fait.fromRow(row)).toList();
    });
  }

  static Future<Fait> getFait(Fait fait, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_fait WHERE id=?";
    } else {
      sql = "SELECT * FROM fait WHERE id=?";
    }
    return await db.get(sql, [fait.id]).then((row) => Fait.fromRow(row));
  }

  static Future<String> createFait(Fait fait, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_fait(id, created_at,type, nom, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO fait(id, created_at,type, nom, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      fait.type,
      fait.nom,
      fait.asm_id,
      fait.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateFait(
      String ancien_fait_Id, Fait new_fait, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_fait SET id=?,type=?, nom=?, asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE fait SET id=?,type=?, nom=?, asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_fait.id,
      new_fait.type,
      new_fait.nom,
      new_fait.asm_id,
      new_fait.is_global.toString(),
      ancien_fait_Id
    ]);
  }

  static Future<void> deleteFait(Fait fait, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_fait WHERE id=?";
    } else {
      sql = "DELETE FROM fait WHERE id=?";
    }
    await db.execute(sql, [fait.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            FORMULAIRE
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_formulaire and formulaire Tables  operations
  static Stream<List<Formulaire>> watchAllFormulaire(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_formulaire WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM formulaire WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Formulaire.fromRow(row)).toList();
    });
  }

  static Future<List<Formulaire>> getAllFormulaire(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_formulaire WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM formulaire WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Formulaire.fromRow(row)).toList();
    });
  }

  static Future<Formulaire> getFormulaire(
      Formulaire formulaire, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_formulaire WHERE id=?";
    } else {
      sql = "SELECT * FROM formulaire WHERE id=?";
    }
    return await db
        .get(sql, [formulaire.id]).then((row) => Formulaire.fromRow(row));
  }

  static Future<String> createFormulaire(
      Formulaire formulaire, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_formulaire(id,created_at, nom, description,inclusion,modele, asm_id,is_global) VALUES(?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO formulaire(id,created_at, nom, description,inclusion,modele, asm_id,is_global) VALUES(?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      formulaire.nom,
      formulaire.description,
      formulaire.inclusion.toString(),
      formulaire.modele,
      formulaire.asm_id,
      formulaire.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateFormulaire(String ancien_formulaire_Id,
      Formulaire new_formulaire, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_formulaire SET id=?,type=?, nom=?, asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE formulaire SET id=?,type=?, nom=?, asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_formulaire.id,
      new_formulaire.nom,
      new_formulaire.description,
      new_formulaire.inclusion.toString(),
      new_formulaire.modele,
      new_formulaire.asm_id,
      new_formulaire.is_global.toString(),
      ancien_formulaire_Id
    ]);
  }

  static Future<void> deleteFormulaire(
      Formulaire formulaire, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_formulaire WHERE id=?";
    } else {
      sql = "DELETE FROM formulaire WHERE id=?";
    }
    await db.execute(sql, [formulaire.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            VARIABLES
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_variables and variables Tables  operations
  static Stream<List<Variables>> watchAllVariables(
      bool isLocal, String asm_id, String type) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_variables WHERE (asm_id=? AND type=?) OR (is_global=true AND type=?) ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM variables WHERE (asm_id=? AND type=?) OR (is_global=true AND type=?) ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, type, type]).map((result) {
      return result.map((row) => Variables.fromRow(row)).toList();
    });
  }

  static Future<List<Variables>> getAllVariables(
      bool isLocal, String asm_id, String type) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_variables WHERE (asm_id=? AND type=?) OR (is_global=true AND type=?) ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM variables WHERE (asm_id=? AND type=?) OR (is_global=true AND type=?) ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, type, type]).then((result) {
      return result.map((row) => Variables.fromRow(row)).toList();
    });
  }

  static Future<Variables?> getVariable(
      Variables variables, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_variables WHERE id=?";
    } else {
      sql = "SELECT * FROM variables WHERE id=?";
    }
    return await db
        .get(sql, [variables.id]).then((row) => Variables.fromRow(row));
  }

  static Future<String> createVariable(Variables variables, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_variables(id,created_at, nom,type, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO variables(id,created_at, nom,type, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      variables.nom,
      variables.type,
      variables.asm_id,
      variables.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateVariable(
      String ancien_variables_Id, Variables new_variables, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_variables SET id=?, nom=?,type=?, asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE variables SET id=?, nom=?,type=?, asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_variables.id,
      new_variables.nom,
      new_variables.type,
      new_variables.asm_id,
      new_variables.is_global.toString(),
      ancien_variables_Id
    ]);
  }

  static Future<void> deleteVariable(Variables variables, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_variables WHERE id=?";
    } else {
      sql = "DELETE FROM variables WHERE id=?";
    }
    await db.execute(sql, [variables.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            QUOTE
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_quote and quote Tables  operations
  static Stream<List<Quote>> watchAllQuote(bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_quote WHERE asm_id=? ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM quote WHERE asm_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Quote.fromRow(row)).toList();
    });
  }

  static Future<List<Quote>> getAllQuote(bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_quote WHERE asm_id=? ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM quote WHERE asm_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Quote.fromRow(row)).toList();
    });
  }

  static Future<Quote> getQuote(Quote quote, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_quote WHERE id=?";
    } else {
      sql = "SELECT * FROM quote WHERE id=?";
    }
    return await db.get(sql, [quote.id]).then((row) => Quote.fromRow(row));
  }

  static Future<String> createQuote(Quote quote, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_quote(id, created_at,citation , auteur, image, asm_id,is_global) VALUES(?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO quote(id, created_at,citation , auteur, image, asm_id,is_global) VALUES(?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      uuid.v4(),
      DateTime.now().toString(),
      quote.auteur,
      quote.image,
      quote.asm_id,
      quote.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateQuote(
      String ancien_quote_Id, Quote new_quote, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_quote SET id=?,citation =?, auteur=?, image=?, asm_id=?,is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE quote SET id=?,citation =?, auteur=?, image=?, asm_id=?,is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_quote.id,
      new_quote.auteur,
      new_quote.image,
      new_quote.asm_id,
      new_quote.is_global.toString(),
      ancien_quote_Id
    ]);
  }

  static Future<void> deleteQuote(Quote quote, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_quote WHERE id=?";
    } else {
      sql = "DELETE FROM quote WHERE id=?";
    }
    await db.execute(sql, [quote.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            Rorsharch
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_rorsharch and rorsharch Tables  operations
  static Stream<List<Rorsharch>> watchAllRorsharch(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_rorsharch WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM rorsharch WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Rorsharch.fromRow(row)).toList();
    });
  }

  static Future<List<Rorsharch>> getAllRorsharch(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_rorsharch WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM rorsharch WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Rorsharch.fromRow(row)).toList();
    });
  }

  static Future<Rorsharch> getRorsharch(
      Rorsharch rorsharch, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_rorsharch WHERE id=?";
    } else {
      sql = "SELECT * FROM rorsharch WHERE id=?";
    }
    return await db
        .get(sql, [rorsharch.id]).then((row) => Rorsharch.fromRow(row));
  }

  static Future<String> createRorsharch(Rorsharch rorsharch, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO localrorsharch(id,created_at, nom, im,asm_id, is_global) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO rorsharch(id,created_at, nom, im,asm_id, is_global) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      rorsharch.nom,
      rorsharch.im,
      rorsharch.asm_id,
      rorsharch.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateRorsharch(
      String ancien_rorsharch_Id, Rorsharch new_rorsharch, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_rorsharch SET id=?, nom=?, im=?,asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE rorsharch SET id=?, nom=?, im=?,asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_rorsharch.id,
      new_rorsharch.nom,
      new_rorsharch.im,
      new_rorsharch.asm_id,
      new_rorsharch.is_global.toString(),
      ancien_rorsharch_Id
    ]);
  }

  static Future<void> deleteRorsharch(Rorsharch rorsharch, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_rorsharch WHERE id=?";
    } else {
      sql = "DELETE FROM rorsharch WHERE id=?";
    }
    await db.execute(sql, [rorsharch.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            Simple_test
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_simple_test and simple_test Tables  operations
  static Stream<List<Simple_test>> watchAllSimple_test(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_simple_test WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM simple_test WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Simple_test.fromRow(row)).toList();
    });
  }

  static Future<List<Simple_test>> getAllSimple_test(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_simple_test WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM simple_test WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Simple_test.fromRow(row)).toList();
    });
  }

  static Future<Simple_test> getSimple_test(
      Simple_test simple_test, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_simple_test WHERE id=?";
    } else {
      sql = "SELECT * FROM simple_test WHERE id=?";
    }
    return await db
        .get(sql, [simple_test.id]).then((row) => Simple_test.fromRow(row));
  }

  static Future<String> createSimple_test(
      Simple_test simple_test, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_simple_test(id,created_at, nom, modele, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO simple_test(id,created_at, nom, modele, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      simple_test.nom,
      simple_test.modele,
      simple_test.asm_id,
      simple_test.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateSimple_test(String ancien_simple_test_Id,
      Simple_test new_simple_test, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_simple_test SET id=?, nom=?, modele=?, asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE simple_test SET id=?, nom=?, modele=?, asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_simple_test.id,
      new_simple_test.nom,
      new_simple_test.modele,
      new_simple_test.asm_id,
      new_simple_test.is_global.toString(),
      ancien_simple_test_Id
    ]);
  }

  static Future<void> deleteSimple_test(
      Simple_test simple_test, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_simple_test WHERE id=?";
    } else {
      sql = "DELETE FROM simple_test WHERE id=?";
    }
    await db.execute(sql, [simple_test.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            Strategie_therapeutique
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_strategie_therapeutique and simple_test strategie_therapeutique  operations
  static Stream<List<Strategie_therapeutique>> watchAllStrategie_therapeutique(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_strategie_therapeutique WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM strategie_therapeutique WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Strategie_therapeutique.fromRow(row)).toList();
    });
  }

  static Future<List<Strategie_therapeutique>> getAllStrategie_therapeutique(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_strategie_therapeutique WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM strategie_therapeutique WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Strategie_therapeutique.fromRow(row)).toList();
    });
  }

  static Future<Strategie_therapeutique> getStrategie_therapeutique(
      Strategie_therapeutique strategie_therapeutique, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_strategie_therapeutique WHERE id=?";
    } else {
      sql = "SELECT * FROM strategie_therapeutique WHERE id=?";
    }
    return await db.get(sql, [strategie_therapeutique.id]).then(
        (row) => Strategie_therapeutique.fromRow(row));
  }

  static Future<String> createStrategie_therapeutique(
      Strategie_therapeutique strategie_therapeutique, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_strategie_therapeutique(id,created_at, nom, description, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO strategie_therapeutique(id,created_at, nom, description, asm_id, is_global) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      strategie_therapeutique.nom,
      strategie_therapeutique.description,
      strategie_therapeutique.asm_id,
      strategie_therapeutique.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateStrategie_therapeutique(
      String ancien_strategie_therapeutique_Id,
      Strategie_therapeutique new_strategie_therapeutique,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_strategie_therapeutique SET id=?, nom=?, description=?, asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE strategie_therapeutique SET id=?, nom=?, description=?, asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_strategie_therapeutique.id,
      new_strategie_therapeutique.nom,
      new_strategie_therapeutique.description,
      new_strategie_therapeutique.asm_id,
      new_strategie_therapeutique.is_global.toString(),
      ancien_strategie_therapeutique_Id
    ]);
  }

  static Future<void> deleteStrategie_therapeutique(
      Strategie_therapeutique strategie_therapeutique, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_strategie_therapeutique WHERE id=?";
    } else {
      sql = "DELETE FROM strategie_therapeutique WHERE id=?";
    }
    await db.execute(sql, [strategie_therapeutique.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            Trame_anamnese
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_trame_anamnese and simple_test trame_anamnese  operations
  static Stream<List<Trame_anamnese>> watchAllTrame_anamnese(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_trame_anamnese WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM trame_anamnese WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Trame_anamnese.fromRow(row)).toList();
    });
  }

  static Future<List<Trame_anamnese>> getAllTrame_anamnese(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_trame_anamnese WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM trame_anamnese WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Trame_anamnese.fromRow(row)).toList();
    });
  }

  static Future<Trame_anamnese> getTrame_anamnese(
      Trame_anamnese trame_anamnese, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_trame_anamnese WHERE id=?";
    } else {
      sql = "SELECT * FROM trame_anamnese WHERE id=?";
    }
    return await db.get(
        sql, [trame_anamnese.id]).then((row) => Trame_anamnese.fromRow(row));
  }

  static Future<String> createTrame_anamnese(
      Trame_anamnese trame_anamnese, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_trame_anamnese(id,created_at, nom,description, modele, asm_id,is_global) VALUES(?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO trame_anamnese(id,created_at, nom,description, modele, asm_id,is_global) VALUES(?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      trame_anamnese.nom,
      trame_anamnese.description,
      trame_anamnese.modele,
      trame_anamnese.asm_id,
      trame_anamnese.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateTrame_anamnese(String ancien_trame_anamnese_Id,
      Trame_anamnese new_trame_anamnese, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_trame_anamnese SET id=?, nom=?, description=?, asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE trame_anamnese SET id=?, nom=?, description=?, asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_trame_anamnese.id,
      new_trame_anamnese.nom,
      new_trame_anamnese.description,
      new_trame_anamnese.modele,
      new_trame_anamnese.asm_id,
      new_trame_anamnese.is_global.toString(),
      ancien_trame_anamnese_Id
    ]);
  }

  static Future<void> deleteTrame_anamnese(
      Trame_anamnese trame_anamnese, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_trame_anamnese WHERE id=?";
    } else {
      sql = "DELETE FROM trame_anamnese WHERE id=?";
    }
    await db.execute(sql, [trame_anamnese.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            Type_suivi
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_type_suivi and simple_test type_suivi  operations
  static Stream<List<Type_suivi>> watchAllType_suivi(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_type_suivi WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM type_suivi WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Type_suivi.fromRow(row)).toList();
    });
  }

  static Future<List<Type_suivi>> getAllType_suivi(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_type_suivi WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM type_suivi WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Type_suivi.fromRow(row)).toList();
    });
  }

  static Future<Type_suivi> getType_suivi(
      Type_suivi type_suivi, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_type_suivi WHERE id=?";
    } else {
      sql = "SELECT * FROM type_suivi WHERE id=?";
    }
    return await db
        .get(sql, [type_suivi.id]).then((row) => Type_suivi.fromRow(row));
  }

  static Future<String> createType_suivi(
      Type_suivi type_suivi, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_type_suivi(id,created_at, nom,description, asm_id,is_global) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO type_suivi(id,created_at, nom,description, asm_id,is_global) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      type_suivi.nom,
      type_suivi.description,
      type_suivi.asm_id,
      type_suivi.is_global.toString(),
    ]);
  return theId;
  }

  static Future<void> updateType_suivi(String ancien_type_suivi_Id,
      Type_suivi new_type_suivi, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_type_suivi SET id=?, nom=?, description=?, asm_id=?, is_global=? WHERE id = ?";
    } else {
      sql =
          "UPDATE type_suivi SET id=?, nom=?, description=?, asm_id=?, is_global=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_type_suivi.id,
      new_type_suivi.nom,
      new_type_suivi.description,
      new_type_suivi.asm_id,
      new_type_suivi.is_global.toString(),
      ancien_type_suivi_Id
    ]);
  }

  static Future<void> deleteType_suivi(
      Type_suivi type_suivi, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_type_suivi WHERE id=?";
    } else {
      sql = "DELETE FROM type_suivi WHERE id=?";
    }
    await db.execute(sql, [type_suivi.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            Achat_terv
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_achat_terv and simple_test achat_terv  operations
  static Stream<List<Achat_terv>> watchAllAchat_terv(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_achat_terv WHERE acheteur_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM achat_terv WHERE acheteur_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Achat_terv.fromRow(row)).toList();
    });
  }

  static Future<List<Achat_terv>> getAllAchat_terv(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_achat_terv WHERE acheteur_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM achat_terv WHERE acheteur_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Achat_terv.fromRow(row)).toList();
    });
  }

  static Future<Achat_terv> getAchat_terv(
      Achat_terv achat_terv, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_achat_terv WHERE id=?";
    } else {
      sql = "SELECT * FROM achat_terv WHERE id=?";
    }
    return await db
        .get(sql, [achat_terv.id]).then((row) => Achat_terv.fromRow(row));
  }

  static Future<String> createAchat_terv(
      Achat_terv achat_terv, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_achat_terv(id,created_at,terv_id,acheteur_id) VALUES(?,?,?,?)";
    } else {
      sql =
          "INSERT INTO achat_terv(id,created_at,terv_id,acheteur_id) VALUES(?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      achat_terv.terv_id,
      achat_terv.acheteur_id,
    ]);
  return theId;
  }

  static Future<void> updateAchat_terv(String ancien_achat_terv_Id,
      Achat_terv new_achat_terv, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_achat_terv SET id=?,terv_id=?,acheteur_id=? WHERE id = ?";
    } else {
      sql = "UPDATE achat_terv SET id=?,terv_id=?,acheteur_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_achat_terv.id,
      new_achat_terv.terv_id,
      new_achat_terv.acheteur_id,
      ancien_achat_terv_Id
    ]);
  }

  static Future<void> deleteAchat_terv(
      Achat_terv achat_terv, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_achat_terv WHERE id=?";
    } else {
      sql = "DELETE FROM achat_terv WHERE id=?";
    }
    await db.execute(sql, [achat_terv.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            terv_exp_patient
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_terv_exp_patient and simple_test terv_exp_patient  operations
  static Stream<List<Terv_exp_patient>> watchAllTerv_exp_patient(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_exp_patient WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_exp_patient WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Terv_exp_patient.fromRow(row)).toList();
    });
  }

  static Future<List<Terv_exp_patient>> getAllTerv_exp_patient(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_exp_patient WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_exp_patient WHERE asm_id=? OR is_global=true ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Terv_exp_patient.fromRow(row)).toList();
    });
  }

  static Future<Terv_exp_patient> getTerv_exp_patient(
      Terv_exp_patient type_suivi, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_terv_exp_patient WHERE id=?";
    } else {
      sql = "SELECT * FROM terv_exp_patient WHERE id=?";
    }
    return await db
        .get(sql, [type_suivi.id]).then((row) => Terv_exp_patient.fromRow(row));
  }

  static Future<String> createTerv_exp_patient(
      Terv_exp_patient terv_exp_patient, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_terv_exp_patient(id,created_at, terv_exp_id, terv_suivi_id, commentaire,score, asm_id, User_id) VALUES(?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO terv_exp_patient(id,created_at, terv_exp_id, terv_suivi_id, commentaire,score, asm_id, User_id) VALUES(?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      terv_exp_patient.terv_exp_id,
      terv_exp_patient.terv_suivi_id,
      terv_exp_patient.commentaire,
      terv_exp_patient.score.toString(),
      terv_exp_patient.asm_id,
      terv_exp_patient.user_id,
    ]);
  return theId;
  }

  static Future<void> updateTerv_exp_patient(String ancien_terv_exp_patient_Id,
      Terv_exp_patient new_terv_exp_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_terv_exp_patient SET id=?, terv_exp_id=?, terv_suivi_id=?, commentaire=?,score=?, asm_id=?, User_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE terv_exp_patient SET id=?, terv_exp_id=?, terv_suivi_id=?, commentaire=?,score=?, asm_id=?, User_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_terv_exp_patient.id,
      new_terv_exp_patient.terv_exp_id,
      new_terv_exp_patient.terv_suivi_id,
      new_terv_exp_patient.commentaire,
      new_terv_exp_patient.score.toString(),
      new_terv_exp_patient.asm_id,
      ancien_terv_exp_patient_Id
    ]);
  }

  static Future<void> deleteTerv_exp_patient(
      Terv_exp_patient terv_exp_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_terv_exp_patient WHERE id=?";
    } else {
      sql = "DELETE FROM terv_exp_patient WHERE id=?";
    }
    await db.execute(sql, [terv_exp_patient.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            asm
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_asm and simple_test asm  operations
  static Stream<List<Asm>> watchAllAsm(bool isLocal) {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_asm ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM asm ORDER BY created_at DESC";
    }
    return db.watch(sql).map((result) {
      return result.map((row) => Asm.fromRow(row)).toList();
    });
  }

  static Future<List<Asm>> getAllAsm(bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_asm ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM asm ORDER BY created_at DESC";
    }
    return await db.getAll(sql).then((result) {
      return result.map((row) => Asm.fromRow(row)).toList();
    });
  }

  static Future<Asm> getAsm(Asm asm, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_asm WHERE id=?";
    } else {
      sql = "SELECT * FROM asm WHERE id=?";
    }
    return await db.get(sql, [asm.id]).then((row) => Asm.fromRow(row));
  }

  static Future<String> createAsm(Asm asm, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_asm(id,created_at, email_objet, email_message, sauv_donnees, sauv_patient_donnees, abonnement, fin_abonnement) VALUES(?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO asm(id,created_at, email_objet, email_message, sauv_donnees, sauv_patient_donnees, abonnement, fin_abonnement) VALUES(?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      asm.id,
      DateTime.now().toString(),
      asm.email_objet,
      asm.email_message,
      asm.sauv_donnees.toString(),
      asm.sauv_patient_donnees.toString(),
      asm.abonnement,
      asm.fin_abonnement.toString(),
    ]);
  return asm.id!;
  }

  static Future<void> updateAsm(
      String ancien_asm_Id, Asm new_asm, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_asm SET id=?, email_objet=?, email_message=?, sauv_donnees=?, sauv_patient_donnees=?, abonnement=?, fin_abonnement=? WHERE id = ?";
    } else {
      sql =
          "UPDATE asm SET id=?, email_objet=?, email_message=?, sauv_donnees=?, sauv_patient_donnees=?, abonnement=?, fin_abonnement=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_asm.id,
      new_asm.email_objet,
      new_asm.email_message,
      new_asm.sauv_donnees.toString(),
      new_asm.sauv_patient_donnees.toString(),
      new_asm.abonnement,
      new_asm.fin_abonnement.toString(),
      ancien_asm_Id
    ]);
  }

  static Future<void> deleteAsm(Asm asm, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_asm WHERE id=?";
    } else {
      sql = "DELETE FROM asm WHERE id=?";
    }
    await db.execute(sql, [asm.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            probleme_files
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_probleme_files and simple_test probleme_files  operations
  static Stream<List<Probleme_files>> watchAllProbleme_files(
      bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_probleme_files WHERE asm_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM probleme_files WHERE asm_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Probleme_files.fromRow(row)).toList();
    });
  }

  static Future<List<Probleme_files>> getAllProbleme_files(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_probleme_files WHERE asm_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM probleme_files WHERE asm_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Probleme_files.fromRow(row)).toList();
    });
  }

  static Future<Probleme_files> getProbleme_files(
      Probleme_files type_suivi, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_probleme_files WHERE id=?";
    } else {
      sql = "SELECT * FROM probleme_files WHERE id=?";
    }
    return await db
        .get(sql, [type_suivi.id]).then((row) => Probleme_files.fromRow(row));
  }

  static Future<String> createProbleme_files(
      Probleme_files probleme_files, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_probleme_files(id, created_at,commentaire, probleme_id, patient_id, asm_id, file_id) VALUES(?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO probleme_files(id, created_at,commentaire, probleme_id, patient_id, asm_id, file_id) VALUES(?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      probleme_files.commentaire,
      probleme_files.probleme_id,
      probleme_files.patient_id,
      probleme_files.asm_id,
      probleme_files.file_id,
    ]);
  return theId;
  }

  static Future<void> updateProbleme_files(String ancien_probleme_files_Id,
      Probleme_files new_probleme_files, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_probleme_files SET id=?,commentaire=?, probleme_id=?, patient_id=?, asm_id=?, file_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE probleme_files SET  id=?,commentaire=?, probleme_id=?, patient_id=?, asm_id=?, file_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_probleme_files.id,
      new_probleme_files.commentaire,
      new_probleme_files.probleme_id,
      new_probleme_files.patient_id,
      new_probleme_files.asm_id,
      new_probleme_files.file_id,
      ancien_probleme_files_Id
    ]);
  }

  static Future<void> deleteProbleme_files(
      Probleme_files probleme_files, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_probleme_files WHERE id=?";
    } else {
      sql = "DELETE FROM probleme_files WHERE id=?";
    }
    await db.execute(sql, [probleme_files.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            my_files
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_my_files and simple_test my_files  operations
  static Stream<List<My_files>> watchAllMy_files(bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_my_files WHERE user_id=? ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM my_files WHERE user_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => My_files.fromRow(row)).toList();
    });
  }

  static Future<List<My_files>> getAllMy_files(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_my_files WHERE user_id=? ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM my_files WHERE user_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => My_files.fromRow(row)).toList();
    });
  }

  static Future<My_files> getMy_files(My_files my_file, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_my_files WHERE id=?";
    } else {
      sql = "SELECT * FROM my_files WHERE id=?";
    }
    return await db
        .get(sql, [my_file.id]).then((row) => My_files.fromRow(row));
  }

  static Future<String> createMy_files(My_files my_files, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_my_files(id, created_at,name, size, extension, path,user_id) VALUES(?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO my_files(id, created_at,name, size, extension, path,user_id) VALUES(?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      my_files.name,
      my_files.size.toString(),
      my_files.extension,
      my_files.path,
      my_files.user_id,
    ]);
  return theId;
  }

  static Future<void> updateMy_files(
      String ancien_my_files_Id, My_files new_my_files, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_my_files SET id=?,name=?, size=?, extension=?, path=?,user_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE my_files SET  id=?,name=?, size=?, extension=?, path=?,user_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_my_files.name,
      new_my_files.size.toString(),
      new_my_files.extension,
      new_my_files.path,
      new_my_files.user_id,
      ancien_my_files_Id
    ]);
  }

  static Future<void> deleteMy_files(My_files my_files, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_my_files WHERE id=?";
    } else {
      sql = "DELETE FROM my_files WHERE id=?";
    }
    await db.execute(sql, [my_files.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            patient
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_patient and simple_test patient  operations
  static Stream<List<Patient>> watchAllPatient(bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_patient WHERE asm_id=? ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM patient WHERE asm_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Patient.fromRow(row)).toList();
    });
  }

  static Future<List<Patient>> getAllPatient(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_patient WHERE asm_id=? ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM patient WHERE asm_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Patient.fromRow(row)).toList();
    });
  }

  static Future<Patient> getPatient(Patient patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_patient WHERE id=?";
    } else {
      sql = "SELECT * FROM patient WHERE id=?";
    }
    return await db.get(sql, [patient.id]).then((row) => Patient.fromRow(row));
  }

  static Future<String> createPatient(Patient patient, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_patient(id,created_at, num_dossier, ordre_naissance_pere,ordre_naissance_mere, brouillon,antecedent_juridique, antecedent_naissance,antecedent_enfance, antecedent_adolescence, antecedent_adulte, asm_id, user_id,statut) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,)";
    } else {
      sql =
          "INSERT INTO patient(id,created_at, num_dossier, ordre_naissance_pere,ordre_naissance_mere, brouillon,antecedent_juridique, antecedent_naissance,antecedent_enfance, antecedent_adolescence, antecedent_adulte, asm_id, user_id,statut) VALUES(?,?,?,?,?,?,??,?,?,?,?,?,?,)";
    }
    await db.execute(sql, [
      patient.id,
      DateTime.now().toString(),
      patient.num_dossier.toString(),
      patient.ordre_naissance_pere.toString(),
      patient.ordre_naissance_mere.toString(),
      patient.brouillon,
      patient.antecedent_juridique,
      patient.antecedent_naissance,
      patient.antecedent_enfance,
      patient.antecedent_adolescence,
      patient.antecedent_adulte,
      patient.asm_id,
      patient.statut,
    ]);
  return patient.id!;
  }

  static Future<void> updatePatient(
      String ancien_patient_Id, Patient new_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_patient SET id=?, num_dossier=?, ordre_naissance_pere=?,ordre_naissance_mere=?, brouillon=?,antecedent_juridique=?, antecedent_naissance=?,antecedent_enfance=?, antecedent_adolescence=?, antecedent_adulte=?, asm_id=?, user_id,statut=? WHERE id = ?";
    } else {
      sql =
          "UPDATE patient SET  id=?, num_dossier=?, ordre_naissance_pere=?,ordre_naissance_mere=?, brouillon=?,antecedent_juridique=?, antecedent_naissance=?,antecedent_enfance=?, antecedent_adolescence=?, antecedent_adulte=?, asm_id=?, user_id,statut=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_patient.num_dossier.toString(),
      new_patient.ordre_naissance_pere.toString(),
      new_patient.ordre_naissance_mere.toString(),
      new_patient.brouillon,
      new_patient.antecedent_juridique,
      new_patient.antecedent_naissance,
      new_patient.antecedent_enfance,
      new_patient.antecedent_adolescence,
      new_patient.antecedent_adulte,
      new_patient.asm_id,
      new_patient.statut,
      ancien_patient_Id
    ]);
  }

  static Future<void> deletePatient(Patient patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_patient WHERE id=?";
    } else {
      sql = "DELETE FROM patient WHERE id=?";
    }
    await db.execute(sql, [patient.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            terv_suivi
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_terv_suivi and simple_test terv_suivi  operations
  static Stream<List<Terv_suivi>> watchAllTerv_suivi(
      bool isLocal, String asm_id, String probleme_id, String patient_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_suivi WHERE asm_id=? AND probleme_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_suivi WHERE asm_id=? AND probleme_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, probleme_id, patient_id]).map(
        (result) {
      return result.map((row) => Terv_suivi.fromRow(row)).toList();
    });
  }

  static Future<List<Terv_suivi>> getAllTerv_suivi(bool isLocal, String asm_id,
      String probleme_id, String patient_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_suivi WHERE asm_id=? AND probleme_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_suivi WHERE asm_id=? AND probleme_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Terv_suivi.fromRow(row)).toList();
    });
  }

  static Future<Terv_suivi> getTerv_suivi(
      Terv_suivi terv_suivi, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_terv_suivi WHERE id=?";
    } else {
      sql = "SELECT * FROM terv_suivi WHERE id=?";
    }
    return await db
        .get(sql, [terv_suivi.id]).then((row) => Terv_suivi.fromRow(row));
  }

  static Future<String> createTerv_suivi(
      Terv_suivi terv_suivi, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_terv_suivi(id,created_at, terv_id,asm_id,probleme_id, user_id, patient_id) VALUES(?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO terv_suivi(id,created_at, terv_id,asm_id,probleme_id, user_id, patient_id) VALUES(?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      terv_suivi.asm_id,
      terv_suivi.probleme_id,
      terv_suivi.user_id,
      terv_suivi.patient_id,
    ]);
  return theId;
  }

  static Future<void> updateTerv_suivi(String ancien_terv_suivi_Id,
      Terv_suivi new_terv_suivi, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_terv_suivi SET id=?, terv_id=?,asm_id=?,probleme_id=?, user_id=?, patient_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE terv_suivi SET  id=?, terv_id=?,asm_id=?,probleme_id=?, user_id=?, patient_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_terv_suivi.id,
      new_terv_suivi.asm_id,
      new_terv_suivi.probleme_id,
      new_terv_suivi.user_id,
      new_terv_suivi.patient_id,
      ancien_terv_suivi_Id
    ]);
  }

  static Future<void> deleteTerv_suivi(
      Terv_suivi terv_suivi, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_probleme_files WHERE id=?";
    } else {
      sql = "DELETE FROM probleme_files WHERE id=?";
    }
    await db.execute(sql, [terv_suivi.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            terv_suivi_niveau_interdit
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_terv_suivi_niveau_interdit and simple_test terv_suivi_niveau_interdit  operations
  static Stream<List<Terv_suivi_niveau_interdit>>
      watchAllTerv_suivi_niveau_interdit(
          bool isLocal, String asm_id, terv_suivi_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_suivi_niveau_interdit WHERE asm_id=? AND terv_suivi_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_suivi_niveau_interdit WHERE asm_id=? AND terv_suivi_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, terv_suivi_id]).map((result) {
      return result
          .map((row) => Terv_suivi_niveau_interdit.fromRow(row))
          .toList();
    });
  }

  static Future<List<Terv_suivi_niveau_interdit>>
      getAllTerv_suivi_niveau_interdit(
          bool isLocal, String asm_id, terv_suivi_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_terv_suivi_niveau_interdit WHERE asm_id=? AND terv_suivi_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM terv_suivi_niveau_interdit WHERE asm_id=? AND terv_suivi_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result
          .map((row) => Terv_suivi_niveau_interdit.fromRow(row))
          .toList();
    });
  }

  static Future<Terv_suivi_niveau_interdit> getTerv_suivi_niveau_interdit(
      Terv_suivi_niveau_interdit terv_suivi_niveau_interdit,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_terv_suivi_niveau_interdit WHERE id=?";
    } else {
      sql = "SELECT * FROM terv_suivi_niveau_interdit WHERE id=?";
    }
    return await db.get(sql, [terv_suivi_niveau_interdit.id]).then(
        (row) => Terv_suivi_niveau_interdit.fromRow(row));
  }

  static Future<String> createTerv_suivi_niveau_interdit(
      Terv_suivi_niveau_interdit terv_suivi_niveau_interdit,
      bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_terv_suivi_niveau_interdit(id,created_at,terv_niv_id, terv_suivi_id,asm_id, user_id) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO terv_suivi_niveau_interdit(id,created_at,terv_niv_id, terv_suivi_id,asm_id, user_id) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      terv_suivi_niveau_interdit.terv_niv_id,
      terv_suivi_niveau_interdit.terv_suivi_id,
      terv_suivi_niveau_interdit.asm_id,
      terv_suivi_niveau_interdit.user_id,
    ]);
  return theId;
  }

  static Future<void> updateTerv_suivi_niveau_interdit(
      String ancien_terv_suivi_niveau_interdit_Id,
      Terv_suivi_niveau_interdit new_terv_suivi_niveau_interdit,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_terv_suivi_niveau_interdit SET id=?,terv_niv_id=?, terv_suivi_id=?,asm_id=?, user_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE terv_suivi_niveau_interdit SET  id=?,terv_niv_id=?, terv_suivi_id=?,asm_id=?, user_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_terv_suivi_niveau_interdit.id,
      new_terv_suivi_niveau_interdit.terv_niv_id,
      new_terv_suivi_niveau_interdit.terv_suivi_id,
      new_terv_suivi_niveau_interdit.asm_id,
      new_terv_suivi_niveau_interdit.user_id,
      ancien_terv_suivi_niveau_interdit_Id
    ]);
  }

  static Future<void> deleteTerv_suivi_niveau_interdit(
      Terv_suivi_niveau_interdit terv_suivi_niveau_interdit,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_terv_suivi_niveau_interdit WHERE id=?";
    } else {
      sql = "DELETE FROM terv_suivi_niveau_interdit WHERE id=?";
    }
    await db.execute(sql, [terv_suivi_niveau_interdit.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            couple
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Couple>> watchAllCouple(
      bool isLocal, String asm_id, String patient_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_couple WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM couple WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id]).map((result) {
      return result.map((row) => Couple.fromRow(row)).toList();
    });
  }

  static Future<List<Couple>> getAllCouple(
      bool isLocal, String asm_id, String patient_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_couple WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM couple WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id]).then((result) {
      return result.map((row) => Couple.fromRow(row)).toList();
    });
  }

  static Future<Couple> getCouple(Couple couple, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_couple WHERE id=?";
    } else {
      sql = "SELECT * FROM couple WHERE id=?";
    }
    return await db.get(sql, [couple.id]).then((row) => Couple.fromRow(row));
  }

  static Future<String> createCouple(Couple couple, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_couple(id,created_at,nbre_enfant,situation_matrimoniale,model_matrimonial,commentaire,patient_id,asm_id,conjoint_id) VALUES(?,?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO couple(id,created_at,nbre_enfant,situation_matrimoniale,model_matrimonial,commentaire,patient_id,asm_id,conjoint_id) VALUES(?,?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      couple.nbre_enfant.toString(),
      couple.model_matrimonial,
      couple.commentaire,
      couple.patient_id,
      couple.asm_id,
      couple.conjoint_id,
    ]);
  return theId;
  }

  static Future<void> updateCouple(
      String ancien_couple_Id, Couple new_couple, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_couple SET id=?,nbre_enfant=?,situation_matrimoniale=?,model_matrimonial=?,commentaire=?,patient_id=?,asm_id=?,conjoint_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE couple SET  id=?,nbre_enfant=?,situation_matrimoniale=?,model_matrimonial=?,commentaire=?,patient_id=?,asm_id=?,conjoint_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_couple.id,
      new_couple.nbre_enfant.toString(),
      new_couple.model_matrimonial,
      new_couple.commentaire,
      new_couple.patient_id,
      new_couple.asm_id,
      new_couple.conjoint_id,
      ancien_couple_Id
    ]);
  }

  static Future<void> deleteCouple(Couple couple, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_couple WHERE id=?";
    } else {
      sql = "DELETE FROM couple WHERE id=?";
    }
    await db.execute(sql, [couple.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            fait_patient
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Fait_patient>> watchAllFait_patient(
      bool isLocal, String asm_id, patient_id, type_fait) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_fait_patient,fait WHERE asm_id=? AND patient_id=? AND fait.type=? AND local_fait_patient.fait_id=fait.id ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM local_fait_patient,fait WHERE asm_id=? AND patient_id=? AND fait.type=? AND local_fait_patient.fait_id=fait.id ORDER BY created_at DESC";
    }
    return db
        .watch(sql, parameters: [asm_id, patient_id, type_fait]).map((result) {
      return result.map((row) => Fait_patient.fromRow(row)).toList();
    });
  }

  static Future<List<Fait_patient>> getAllFait_patient(
      bool isLocal, String asm_id, patient_id, type_fait) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_fait_patient,fait WHERE asm_id=? AND patient_id=? AND fait.type=? AND local_fait_patient.fait_id=fait.id ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM local_fait_patient,fait WHERE asm_id=? AND patient_id=? AND fait.type=? AND local_fait_patient.fait_id=fait.id ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id, type_fait]).then((result) {
      return result.map((row) => Fait_patient.fromRow(row)).toList();
    });
  }

  static Future<Fait_patient> getFait_patient(
      Fait_patient couple, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_fait_patient WHERE id=?";
    } else {
      sql = "SELECT * FROM fait_patient WHERE id=?";
    }
    return await db
        .get(sql, [couple.id]).then((row) => Fait_patient.fromRow(row));
  }

  static Future<String> createFait_patient(
      Fait_patient fait_patient, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_fait_patient(id,created_at, fait_id, patient_id, asm_id) VALUES(?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO fait_patient(id,created_at, fait_id, patient_id, asm_id) VALUES(?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      fait_patient.fait_id,
      fait_patient.patient_id,
      fait_patient.asm_id,
    ]);
  return theId;
  }

  static Future<void> updateFait_patient(String ancien_fait_patient_Id,
      Fait_patient new_fait_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_fait_patient SET id=?, fait_id=?, patient_id=?, asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE fait_patient SET  id=?, fait_id=?, patient_id=?, asm_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_fait_patient.id,
      new_fait_patient.fait_id,
      new_fait_patient.patient_id,
      new_fait_patient.asm_id,
      ancien_fait_patient_Id
    ]);
  }

  static Future<void> deleteFait_patient(
      Fait_patient fait_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_fait_patient WHERE id=?";
    } else {
      sql = "DELETE FROM fait_patient WHERE id=?";
    }
    await db.execute(sql, [fait_patient.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            formulaire_patient
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Formulaire_patient>> watchAllFormulaire_patient(
      bool isLocal, String asm_id, patient_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_formulaire_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM formulaire_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id]).map((result) {
      return result.map((row) => Formulaire_patient.fromRow(row)).toList();
    });
  }

  static Future<List<Formulaire_patient>> getAllFormulaire_patient(
      bool isLocal, String asm_id, String patient_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_formulaire_patient WHERE asm_id=?  AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM formulaire_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id]).then((result) {
      return result.map((row) => Formulaire_patient.fromRow(row)).toList();
    });
  }

  static Future<Formulaire_patient> getFormulaire_patient(
      Formulaire_patient formulaire_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_formulaire_patient WHERE id=?";
    } else {
      sql = "SELECT * FROM formulaire_patient WHERE id=?";
    }
    return await db.get(sql, [formulaire_patient.id]).then(
        (row) => Formulaire_patient.fromRow(row));
  }

  static Future<String> createFormulaire_patient(
      Formulaire_patient formulaire_patient, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_formulaire_patient(id,created_at, contenu, formulaire_id, patient_id,asm_id) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO formulaire_patient(id,created_at, contenu, formulaire_id, patient_id,asm_id) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      formulaire_patient.contenu,
      formulaire_patient.formulaire_id,
      formulaire_patient.patient_id,
      formulaire_patient.asm_id,
    ]);
  return theId;
  }

  static Future<void> updateFormulaire_patient(
      String ancien_formulaire_patient_Id,
      Formulaire_patient new_formulaire_patient,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_formulaire_patient SET id=?, contenu=?, formulaire_id=?, patient_id=?,asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE formulaire_patient SET  id=?, contenu=?, formulaire_id=?, patient_id=?,asm_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_formulaire_patient.id,
      new_formulaire_patient.contenu,
      new_formulaire_patient.formulaire_id,
      new_formulaire_patient.patient_id,
      new_formulaire_patient.asm_id,
      ancien_formulaire_patient_Id
    ]);
  }

  static Future<void> deleteFormulaire_patient(
      Formulaire_patient formulaire_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_formulaire_patient WHERE id=?";
    } else {
      sql = "DELETE FROM formulaire_patient WHERE id=?";
    }
    await db.execute(sql, [formulaire_patient.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            loisir_patient
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Loisir_patient>> watchAllLoisir_patient(
      bool isLocal, String asm_id, String patient_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_loisir_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM loisir_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id]).map((result) {
      return result.map((row) => Loisir_patient.fromRow(row)).toList();
    });
  }

  static Future<List<Loisir_patient>> getAllLoisir_patient(
      bool isLocal, String asm_id, String patient_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_loisir_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM loisir_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id]).then((result) {
      return result.map((row) => Loisir_patient.fromRow(row)).toList();
    });
  }

  static Future<Loisir_patient> getLoisir_patient(
      Loisir_patient loisir_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_loisir_patient WHERE id=?";
    } else {
      sql = "SELECT * FROM loisir_patient WHERE id=?";
    }
    return await db.get(
        sql, [loisir_patient.id]).then((row) => Loisir_patient.fromRow(row));
  }

  static Future<String> createLoisir_patient(
      Loisir_patient loisir_patient, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_loisir_patient(id,created_at, loisir_id, asm_id,patient_id) VALUES(?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO loisir_patient(id,created_at, loisir_id, asm_id,patient_id) VALUES(?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      loisir_patient.loisir_id,
      loisir_patient.asm_id,
      loisir_patient.patient_id,
    ]);
  return theId;
  }

  static Future<void> updateLoisir_patient(String ancien_loisir_patient_Id,
      Loisir_patient new_loisir_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_loisir_patient SET id=?, contenu=?, formulaire_id=?, patient_id=?,asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE loisir_patient SET  id=?, contenu=?, formulaire_id=?, patient_id=?,asm_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_loisir_patient.id,
      new_loisir_patient.loisir_id,
      new_loisir_patient.asm_id,
      new_loisir_patient.patient_id,
      ancien_loisir_patient_Id
    ]);
  }

  static Future<void> deleteLoisir_patient(
      Loisir_patient loisir_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_loisir_patient WHERE id=?";
    } else {
      sql = "DELETE FROM loisir_patient WHERE id=?";
    }
    await db.execute(sql, [loisir_patient.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            personne
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Personne>> watchAllPersonne(bool isLocal, String asm_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_personne WHERE asm_id=? ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM personne WHERE asm_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id]).map((result) {
      return result.map((row) => Personne.fromRow(row)).toList();
    });
  }

  static Future<List<Personne>> getAllPersonne(
      bool isLocal, String asm_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_personne WHERE asm_id=? ORDER BY created_at DESC";
    } else {
      sql = "SELECT * FROM personne WHERE asm_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id]).then((result) {
      return result.map((row) => Personne.fromRow(row)).toList();
    });
  }

  static Future<Personne> getPersonne(Personne personne, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_personne WHERE id=?";
    } else {
      sql = "SELECT * FROM personne WHERE id=?";
    }
    return await db
        .get(sql, [personne.id]).then((row) => Personne.fromRow(row));
  }

  static Future<String> createPersonne(Personne personne, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_personne(id, created_at,nom, im_profil,genre, email,tel, addresse, ethnie, date_naissance, lieu_naissance, religion, condition_residence, niv_etude, profession, situation_matrimoniale, qualites,defauts,commentaire, asm_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO personne(id, created_at,nom, im_profil,genre, email,tel, addresse, ethnie, date_naissance, lieu_naissance, religion, condition_residence, niv_etude, profession, situation_matrimoniale, qualites,defauts,commentaire, asm_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      personne.nom,
      personne.im_profil,
      personne.genre,
      personne.email,
      personne.tel,
      personne.addresse,
      personne.ethnie,
      personne.date_naissance.toString(),
      personne.lieu_naissance,
      personne.religion,
      personne.condition_residence,
      personne.niv_etude,
      personne.profession,
      personne.situation_matrimoniale,
      personne.qualites,
      personne.defauts,
      personne.commentaire,
      personne.asm_id,
    ]);
  return theId;
  }

  static Future<void> updatePersonne(
      String ancien_personne_Id, Personne new_personne, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_personne SET id=?,nom=?, im_profil=?,genre=?, email=?,tel=?, addresse=?, ethnie=?, date_naissance=?, lieu_naissance=?, religion=?, condition_residence=?, niv_etude=?, profession=?, situation_matrimoniale=?, qualites=?,defauts=?,commentaire=? asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE personne SET  id=?,nom=?, im_profil=?,genre=?, email=?,tel=?, addresse=?, ethnie=?, date_naissance=?, lieu_naissance=?, religion=?, condition_residence=?, niv_etude=?, profession=?, situation_matrimoniale=?, qualites=?,defauts=?,commentaire=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_personne.id,
      new_personne.nom,
      new_personne.im_profil,
      new_personne.genre,
      new_personne.email,
      new_personne.tel,
      new_personne.addresse,
      new_personne.ethnie,
      new_personne.date_naissance.toString(),
      new_personne.lieu_naissance,
      new_personne.religion,
      new_personne.condition_residence,
      new_personne.niv_etude,
      new_personne.profession,
      new_personne.situation_matrimoniale,
      new_personne.qualites,
      new_personne.defauts,
      new_personne.commentaire,
      new_personne.asm_id,
      ancien_personne_Id
    ]);
  }

  static Future<void> deletePersonne(Personne personne, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_personne WHERE id=?";
    } else {
      sql = "DELETE FROM personne WHERE id=?";
    }
    await db.execute(sql, [personne.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//

//************************************************************************************************************//
//************************************************************************************************************//
//                            relation
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Relation>> watchAllRelation(
      bool isLocal, String asm_id, String patient_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_relation WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM relation WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id]).map((result) {
      return result.map((row) => Relation.fromRow(row)).toList();
    });
  }

  static Future<List<Relation>> getAllRelation(
      bool isLocal, String asm_id, String patient_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_relation WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM relation WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id]).then((result) {
      return result.map((row) => Relation.fromRow(row)).toList();
    });
  }

  static Future<Relation> getRelation(Relation relation, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_relation WHERE id=?";
    } else {
      sql = "SELECT * FROM relation WHERE id=?";
    }
    return await db
        .get(sql, [relation.id]).then((row) => Relation.fromRow(row));
  }

  static Future<String> createRelation(Relation relation, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_relation(id,created_at, lien,patient_id, personne_relation_id,asm_id) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO relation(id,created_at, lien,patient_id, personne_relation_id,asm_id) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      relation.lien,
      relation.patient_id,
      relation.personne_relation_id,
      relation.asm_id,
    ]);
  return theId;
  }

  static Future<void> updateRelation(
      String ancien_relation_Id, Relation new_relation, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_relationt SET id=?, lien,patient_id=?, personne_relation_id=?,asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE relation SET  id=?, lien,patient_id=?, personne_relation_id=?,asm_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_relation.id,
      new_relation.lien,
      new_relation.patient_id,
      new_relation.personne_relation_id,
      new_relation.asm_id,
      ancien_relation_Id
    ]);
  }

  static Future<void> deleteRelation(Relation relation, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_relation WHERE id=?";
    } else {
      sql = "DELETE FROM relation WHERE id=?";
    }
    await db.execute(sql, [relation.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            rorsharch_patient
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Rorsharch_patient>> watchAllRorsharch_patient(
      bool isLocal, String asm_id, String patient_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_rorsharch_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM rorsharch_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id]).map((result) {
      return result.map((row) => Rorsharch_patient.fromRow(row)).toList();
    });
  }

  static Future<List<Rorsharch_patient>> getAllRorsharch_patient(
      bool isLocal, String asm_id, String patient_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_rorsharch_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM rorsharch_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id]).then((result) {
      return result.map((row) => Rorsharch_patient.fromRow(row)).toList();
    });
  }

  static Future<Rorsharch_patient> getRorsharch_patient(
      Rorsharch_patient rorsharch_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_rorsharch_patient WHERE id=?";
    } else {
      sql = "SELECT * FROM rorsharch_patient WHERE id=?";
    }
    return await db.get(sql, [rorsharch_patient.id]).then(
        (row) => Rorsharch_patient.fromRow(row));
  }

  static Future<String> createRorsharch_patient(
      Rorsharch_patient rorsharch_patient, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_rorsharch_patient(id,created_at,resultat,rorsharch_id, patient_id, asm_id) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO rorsharch_patient(id,created_at,resultat,rorsharch_id, patient_id, asm_id) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      rorsharch_patient.resultat,
      rorsharch_patient.rorsharch_id,
      rorsharch_patient.patient_id,
      rorsharch_patient.asm_id,
    ]);
  return theId;
  }

  static Future<void> updateRorsharch_patient(
      String ancien_rorsharch_patient_Id,
      Rorsharch_patient new_rorsharch_patient,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_rorsharch_patient SET id=?, resultat=?,rorsharch_id=?, patient_id=?, asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE rorsharch_patient SET  id=?, resultat=?,rorsharch_id=?, patient_id=?, asm_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_rorsharch_patient.id,
      new_rorsharch_patient.resultat,
      new_rorsharch_patient.rorsharch_id,
      new_rorsharch_patient.patient_id,
      new_rorsharch_patient.asm_id,
      ancien_rorsharch_patient_Id
    ]);
  }

  static Future<void> deleteRorsharch_patient(
      Rorsharch_patient rorsharch_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_rorsharch_patient WHERE id=?";
    } else {
      sql = "DELETE FROM rorsharch_patient WHERE id=?";
    }
    await db.execute(sql, [rorsharch_patient.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            seance
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Seance>> watchAllSeance(
      bool isLocal, String asm_id, String patient_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_seance WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM seance WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id]).map((result) {
      return result.map((row) => Seance.fromRow(row)).toList();
    });
  }

  static Future<List<Seance>> getAllSeance(
      bool isLocal, String asm_id, String patient_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_seance WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM seance WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id]).then((result) {
      return result.map((row) => Seance.fromRow(row)).toList();
    });
  }

  static Future<Seance> getSeance(Seance seance, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_seance WHERE id=?";
    } else {
      sql = "SELECT * FROM seance WHERE id=?";
    }
    return await db.get(sql, [seance.id]).then((row) => Seance.fromRow(row));
  }

  static Future<String> createSeance(Seance seance, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_seance(id,created_at, h_debut,h_fin, date_seance, activites_eff, h_debut_f,h_fin_f, date_seance_f,activites_f,probleme_id, patient_id, asm_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO seance(id,created_at, h_debut,h_fin, date_seance, activites_eff, h_debut_f,h_fin_f, date_seance_f,activites_f,probleme_id, patient_id, asm_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      seance.h_debut.toString(),
      seance.h_fin.toString(),
      seance.date_seance.toString(),
      seance.activites_eff,
      seance.h_debut_f.toString(),
      seance.h_fin_f.toString(),
      seance.date_seance_f.toString(),
      seance.activites_f,
      seance.probleme_id,
      seance.patient_id,
      seance.asm_id,
    ]);
  return theId;
  }

  static Future<void> updateSeance(
      String ancien_seance_Id, Seance new_seance, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_seance SET id=?, h_debut=?,h_fin=?, date_seance=?, activites_eff=?, h_debut_f=?,h_fin_f=?, date_seance_f=?,activites_f=?,probleme_id=?, patient_id=?, asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE seance SET  id=?, h_debut=?,h_fin=?, date_seance=?, activites_eff=?, h_debut_f=?,h_fin_f=?, date_seance_f=?,activites_f=?,probleme_id=?, patient_id=?, asm_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_seance.id,
      new_seance.h_debut.toString(),
      new_seance.h_fin.toString(),
      new_seance.date_seance.toString(),
      new_seance.activites_eff,
      new_seance.h_debut_f.toString(),
      new_seance.h_fin_f.toString(),
      new_seance.date_seance_f.toString(),
      new_seance.activites_f,
      new_seance.probleme_id,
      new_seance.patient_id,
      new_seance.asm_id,
      ancien_seance_Id
    ]);
  }

  static Future<void> deleteSeance(Seance seance, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_seance WHERE id=?";
    } else {
      sql = "DELETE FROM seance WHERE id=?";
    }
    await db.execute(sql, [seance.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            simple_test_patient
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Simple_test_patient>> watchAllSimple_test_patient(
      bool isLocal, String asm_id, String patient_id) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_simple_test_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM simple_test_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id]).map((result) {
      return result.map((row) => Simple_test_patient.fromRow(row)).toList();
    });
  }

  static Future<List<Simple_test_patient>> getAllSimple_test_patient(
      bool isLocal, String asm_id, String patient_id) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_simple_test_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM simple_test_patient WHERE asm_id=? AND patient_id=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id]).then((result) {
      return result.map((row) => Simple_test_patient.fromRow(row)).toList();
    });
  }

  static Future<Simple_test_patient> getSimple_test_patient(
      Simple_test_patient simple_test_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_simple_test_patient WHERE id=?";
    } else {
      sql = "SELECT * FROM simple_test_patient WHERE id=?";
    }
    return await db.get(sql, [simple_test_patient.id]).then(
        (row) => Simple_test_patient.fromRow(row));
  }

  static Future<String> createSimple_test_patient(
      Simple_test_patient simple_test_patient, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_simple_test_patient(id,created_at,resultat, test_id, pastient_id, asm_id) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO simple_test_patient(id,created_at,resultat, test_id, pastient_id, asm_id) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      simple_test_patient.resultat,
      simple_test_patient.test_id,
      simple_test_patient.pastient_id,
      simple_test_patient.asm_id,
    ]);
  return theId;
  }

  static Future<void> updateSimple_test_patient(
      String ancien_simple_test_patient_Id,
      Simple_test_patient new_simple_test_patient,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_simple_test_patient SET id=?,resultat=?, test_id=?, pastient_id=? asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE simple_test_patient SET  id=?,resultat=?, test_id=?, pastient_id=? asm_id=? WHERE id = ?";
    }
    return await db.execute(sql, [
      new_simple_test_patient.id,
      new_simple_test_patient.resultat,
      new_simple_test_patient.test_id,
      new_simple_test_patient.pastient_id,
      new_simple_test_patient.asm_id,
      ancien_simple_test_patient_Id
    ]).then((result) {
      return result
          .map((row) => Simple_test_patient.fromRow(row))
          .toList()
          .firstOrNull;
    });
  }

  static Future<void> deleteSimple_test_patient(
      Simple_test_patient simple_test_patient, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_simple_test_patient WHERE id=?";
    } else {
      sql = "DELETE FROM simple_test_patient WHERE id=?";
    }
    await db.execute(sql, [simple_test_patient.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            patient_type_fait_autre
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Patient_type_fait_autre>> watchAllPatient_type_fait_autre(
      bool isLocal, String asm_id, String patient_id, String type) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_patient_type_fait_autre WHERE asm_id=? AND patient_id=? AND type=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM patient_type_fait_autre WHERE asm_id=? AND patient_id=? AND type=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id, type]).map((result) {
      return result.map((row) => Patient_type_fait_autre.fromRow(row)).toList();
    });
  }

  static Future<List<Patient_type_fait_autre>> getAllPatient_type_fait_autre(
      bool isLocal, String asm_id, String patient_id, String type) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_patient_type_fait_autre WHERE asm_id=? AND patient_id=? AND type=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM patient_type_fait_autre WHERE asm_id=? AND patient_id=? AND type=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id, type]).then((result) {
      return result.map((row) => Patient_type_fait_autre.fromRow(row)).toList();
    });
  }

  static Future<Patient_type_fait_autre> getPatient_type_fait_autre(
      Patient_type_fait_autre patient_type_fait_autre, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_patient_type_fait_autre WHERE id=?";
    } else {
      sql = "SELECT * FROM patient_type_fait_autre WHERE id=?";
    }
    return await db.get(sql, [patient_type_fait_autre.id]).then(
        (row) => Patient_type_fait_autre.fromRow(row));
  }

  static Future<String> createPatient_type_fait_autre(
      Patient_type_fait_autre patient_type_fait_autre, bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_patient_type_fait_autre(id,created_at,nom, type_fait, patient_id,asm_id) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO patient_type_fait_autre(id,created_at,nom, type_fait, patient_id,asm_id) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      patient_type_fait_autre.nom,
      patient_type_fait_autre.type_fait,
      patient_type_fait_autre.patient_id,
      patient_type_fait_autre.asm_id,
    ]);
  return theId;
  }

  static Future<void> updatePatient_type_fait_autre(
      String ancien_patient_type_fait_autre_Id,
      Patient_type_fait_autre new_patient_type_fait_autre,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_patient_type_fait_autre SET id=?,resultat=?, test_id=?, pastient_id=? asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE patient_type_fait_autre SET  id=?,resultat=?, test_id=?, pastient_id=? asm_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_patient_type_fait_autre.id,
      new_patient_type_fait_autre.nom,
      new_patient_type_fait_autre.type_fait,
      new_patient_type_fait_autre.patient_id,
      new_patient_type_fait_autre.asm_id,
      ancien_patient_type_fait_autre_Id
    ]);
  }

  static Future<void> deletePatient_type_fait_autre(
      Patient_type_fait_autre patient_type_fait_autre, bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_patient_type_fait_autre WHERE id=?";
    } else {
      sql = "DELETE FROM patient_type_fait_autre WHERE id=?";
    }
    await db.execute(sql, [patient_type_fait_autre.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
//                            patient_type_fait_commentaire
//************************************************************************************************************//
//************************************************************************************************************//
//************************************************************************************************************//
  // Off_couple and simple_test couple  operations
  static Stream<List<Patient_type_fait_commentaire>>
      watchAllPatient_type_fait_commentaire(
          bool isLocal, String asm_id, String patient_id, String type) {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_patient_type_fait_commentaire WHERE asm_id=? AND patient_id=? AND type=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM patient_type_fait_commentaire WHERE asm_id=? AND patient_id=? AND type=? ORDER BY created_at DESC";
    }
    return db.watch(sql, parameters: [asm_id, patient_id, type]).map((result) {
      return result
          .map((row) => Patient_type_fait_commentaire.fromRow(row))
          .toList();
    });
  }

  static Future<List<Patient_type_fait_commentaire>>
      getAllPatient_type_fait_commentaire(
          bool isLocal, String asm_id, String patient_id, String type) async {
    String sql = "";
    if (isLocal) {
      sql =
          "SELECT * FROM local_patient_type_fait_commentaire WHERE asm_id=? AND patient_id=? AND type=? ORDER BY created_at DESC";
    } else {
      sql =
          "SELECT * FROM patient_type_fait_commentaire WHERE asm_id=? AND patient_id=? AND type=? ORDER BY created_at DESC";
    }
    return await db.getAll(sql, [asm_id, patient_id, type]).then((result) {
      return result
          .map((row) => Patient_type_fait_commentaire.fromRow(row))
          .toList();
    });
  }

  static Future<Patient_type_fait_commentaire> getPatient_type_fait_commentaire(
      Patient_type_fait_commentaire patient_type_fait_commentaire,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "SELECT * FROM local_patient_type_fait_commentaire WHERE id=?";
    } else {
      sql = "SELECT * FROM patient_type_fait_commentaire WHERE id=?";
    }
    return await db.get(sql, [patient_type_fait_commentaire.id]).then(
        (row) => Patient_type_fait_commentaire.fromRow(row));
  }

  static Future<String> createPatient_type_fait_commentaire(
      Patient_type_fait_commentaire patient_type_fait_commentaire,
      bool isLocal) async {
    String theId = uuid.v4();
    String sql = "";
    if (isLocal) {
      sql =
          "INSERT INTO local_patient_type_fait_commentaire(id, created_at,commentaire, type_fait_id, patient_id, asm_id) VALUES(?,?,?,?,?,?)";
    } else {
      sql =
          "INSERT INTO patient_patient_type_fait_commentaire(id, created_at,commentaire, type_fait_id, patient_id, asm_id) VALUES(?,?,?,?,?,?)";
    }
    await db.execute(sql, [
      theId,
      DateTime.now().toString(),
      patient_type_fait_commentaire.commentaire,
      patient_type_fait_commentaire.type_fait_id,
      patient_type_fait_commentaire.patient_id,
      patient_type_fait_commentaire.asm_id,
    ]);
    return theId;
  }

  static Future<void> updatePatient_type_fait_commentaire(
      String ancien_patient_type_fait_commentaire_Id,
      Patient_type_fait_commentaire new_patient_type_fait_commentaire,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql =
          "UPDATE local_patient_type_fait_commentaire SET id=?,commentaire=?, type_fait_id=?, patient_id=?, asm_id=? WHERE id = ?";
    } else {
      sql =
          "UPDATE patient_type_fait_commentaire SET  id=?,commentaire=?, type_fait_id=?, patient_id=?, asm_id=? WHERE id = ?";
    }
    await db.execute(sql, [
      new_patient_type_fait_commentaire.id,
      new_patient_type_fait_commentaire.commentaire,
      new_patient_type_fait_commentaire.type_fait_id,
      new_patient_type_fait_commentaire.patient_id,
      new_patient_type_fait_commentaire.asm_id,
      ancien_patient_type_fait_commentaire_Id
    ]);
  }

  static Future<void> deletePatient_type_fait_commentaire(
      Patient_type_fait_commentaire patient_type_fait_commentaire,
      bool isLocal) async {
    String sql = "";
    if (isLocal) {
      sql = "DELETE FROM local_patient_type_fait_commentaire WHERE id=?";
    } else {
      sql = "DELETE FROM patient_type_fait_commentaire WHERE id=?";
    }
    await db.execute(sql, [patient_type_fait_commentaire.id]);
  }

//************************************************************************************************************//
//************************************************************************************************************//
}
