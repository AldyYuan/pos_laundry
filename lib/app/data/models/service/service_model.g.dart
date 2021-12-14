// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      json['id'] as String,
      json['id_layanan'] as String,
      json['id_transaksi'] as String,
      json['nama_layanan'] as String,
      json['jumlah_pembelian'] as int,
      (json['harga_layanan'] as num).toDouble(),
      (json['harga_total'] as num).toDouble(),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_layanan': instance.idLayanan,
      'id_transaksi': instance.idTransaksi,
      'nama_layanan': instance.namaLayanan,
      'jumlah_pembelian': instance.jumlahPembelian,
      'harga_layanan': instance.hargaLayanan,
      'harga_total': instance.hargaTotal,
    };
