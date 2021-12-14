import 'package:json_annotation/json_annotation.dart';

part 'data_service_model.g.dart';

@JsonSerializable()
class DataService {
  @JsonKey(name: 'idlayanan')
  final String idLayanan;

  @JsonKey(name: 'nama_layanan')
  final String namaLayanan;

  @JsonKey(name: 'jumlah')
  final int jumlah;

  @JsonKey(name: 'durasi_penyelesaian')
  final int durasiPenyelesaian;

  @JsonKey(name: 'idsatuan')
  final int idSatuan;

  @JsonKey(name: 'harga')
  final double harga;

  @JsonKey(name: 'nama_satuan')
  final String namaSatuan;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  DataService(
    this.idLayanan,
    this.namaLayanan,
    this.jumlah,
    this.durasiPenyelesaian,
    this.idSatuan,
    this.harga,
    this.namaSatuan,
    this.createdAt,
    this.updatedAt,
  );

  factory DataService.fromJson(Map<String, dynamic> json) =>
      _$DataServiceFromJson(json);
  Map<String, dynamic> toJson() => _$DataServiceToJson(this);
}
