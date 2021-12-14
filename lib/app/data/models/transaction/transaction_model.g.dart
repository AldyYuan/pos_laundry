// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as String,
    )
      ..namaCustomer = json['nama_customer'] as String?
      ..totalTagihan = (json['total_tagihan'] as num?)?.toDouble()
      ..keterangan = json['keterangan'] as String?
      ..tglBuat = json['tgl_buat'] == null
          ? null
          : DateTime.parse(json['tgl_buat'] as String)
      ..tglSelesai = json['tgl_selesai'] == null
          ? null
          : DateTime.parse(json['tgl_selesai'] as String);

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_customer': instance.namaCustomer,
      'total_tagihan': instance.totalTagihan,
      'keterangan': instance.keterangan,
      'tgl_buat': instance.tglBuat?.toIso8601String(),
      'tgl_selesai': instance.tglSelesai?.toIso8601String(),
    };
