import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos_laundry/app/core/values/strings.dart';
import 'package:pos_laundry/app/data/models/service/service_model.dart';
import 'package:pos_laundry/app/data/models/transaction/transaction_model.dart';

class FirestoreProvider {
  final _firestore = FirebaseFirestore.instance;

  // Ambil data koleksi transaksi
  Future<QuerySnapshot<Map<String, dynamic>>>
      getTransactionCollection() async =>
          await _firestore.collection(cTransaction).get();

  // Stream data transaksi terbaru
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotsRecentTransaction() =>
      _firestore
          .collection(cTransaction)
          .orderBy('tgl_buat', descending: true)
          .limit(7)
          .snapshots();

  // Stream data transaksi
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshotsTransaction() =>
      _firestore.collection(cTransaction).snapshots();

  // Ambil data koleksi layanan berdasarkan id_transaksi
  Future<QuerySnapshot<Map<String, dynamic>>> getServiceCollection(
          String id) async =>
      await _firestore
          .collection(cService)
          .where('id_transaksi', isEqualTo: id)
          .get();

  // Menyimpan data transaksi
  Future<void> saveTransaction(TransactionModel data) async {
    await _firestore.doc("$cTransaction/${data.id}").set(
          data.toJson(),
          SetOptions(merge: true),
        );
  }

  // Menyimpan data layanan
  Future<void> saveService(ServiceModel data) async {
    await _firestore.doc("$cService/${data.id}").set(
          data.toJson(),
          SetOptions(merge: true),
        );
  }
}
