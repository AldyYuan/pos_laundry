import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'nama_customer')
  String? namaCustomer;

  @JsonKey(name: 'total_tagihan')
  int? totalTagihan;

  @JsonKey(name: 'keterangan')
  String? keterangan;

  @JsonKey(name: 'tgl_buat')
  DateTime? tglBuat;

  @JsonKey(name: 'tgl_selesai')
  DateTime? tglSelesai;

  TransactionModel({
    required this.id,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
