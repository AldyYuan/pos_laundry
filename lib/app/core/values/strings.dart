// Informasi Aplikasi
import 'dart:math';

const String appName = 'POS Laundry';

// Informasi API
const String baseUrl = 'https://android-test-fljnd6wana-as.a.run.app/';
const String contentType = 'application/x-www-form-urlencoded';
const String jwtToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJxIjoiIiwibGltaXQiOjEwMCwib2Zmc2V0IjowfQ.fbppcH8U1X8hTbA0Ka1atVokLwTivfIGOToFjMvIIHc';

// Collection Firestore
const String cTransaction = 'Transaksi';
const String cService = 'Layanan';

// Informasi Assets
const String profilePic = 'assets/images/profile_pic.svg';

// Geneerate random id
String getRandomGeneratedId() {
  const int length = 20;
  const String alphabet =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  const int maxRandom = alphabet.length;
  final Random randomGen = Random();

  final StringBuffer buffer = StringBuffer();
  for (int i = 0; i < length; i++) {
    buffer.write(alphabet[randomGen.nextInt(maxRandom)]);
  }

  return buffer.toString();
}

// Menghitung durasi penyelesaian
String countDuration(Duration duration) {
  int totalHours = duration.inHours;
  int day = totalHours >= 24 ? totalHours ~/ 24 : 0;
  int hour = totalHours - (day * 24);

  String text =
      '${day != 0 ? "$day hari" : ""} ${hour != 0 ? "$hour jam" : ""}';

  return text;
}
