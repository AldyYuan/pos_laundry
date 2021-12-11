import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'nama_customer')
  final String? namaCustomer;

  @JsonKey(name: 'total_tagihan')
  final int? totalTagihan;

  @JsonKey(name: 'keterangan')
  final String? keterangan;

  @JsonKey(name: 'tgl_buat')
  final DateTime? tglBuat;

  @JsonKey(name: 'tgl_selesai')
  final DateTime? tglSelesai;

  TransactionModel(
    this.id,
    this.namaCustomer,
    this.totalTagihan,
    this.keterangan,
    this.tglBuat,
    this.tglSelesai,
  );

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
