// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataService _$DataServiceFromJson(Map<String, dynamic> json) => DataService(
      json['idlayanan'] as String,
      json['nama_layanan'] as String,
      json['jumlah'] as int,
      json['durasi_penyelesaian'] as int,
      json['idsatuan'] as int,
      (json['harga'] as num).toDouble(),
      json['nama_satuan'] as String,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DataServiceToJson(DataService instance) =>
    <String, dynamic>{
      'idlayanan': instance.idLayanan,
      'nama_layanan': instance.namaLayanan,
      'jumlah': instance.jumlah,
      'durasi_penyelesaian': instance.durasiPenyelesaian,
      'idsatuan': instance.idSatuan,
      'harga': instance.harga,
      'nama_satuan': instance.namaSatuan,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
