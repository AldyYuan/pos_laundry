import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'id_layanan')
  final String idLayanan;

  @JsonKey(name: 'id_transaksi')
  final String idTransaksi;

  @JsonKey(name: 'nama_layanan')
  final String namaLayanan;

  @JsonKey(name: 'jumlah_pembelian')
  final String jumlahPembelian;

  @JsonKey(name: 'harga_layanan')
  final int hargaLayanan;

  @JsonKey(name: 'harga_total')
  final int hargaTotal;

  ServiceModel(
    this.id,
    this.idLayanan,
    this.idTransaksi,
    this.namaLayanan,
    this.jumlahPembelian,
    this.hargaLayanan,
    this.hargaTotal,
  );

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
