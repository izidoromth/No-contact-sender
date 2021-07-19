import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class MainViewModel {
  String PhoneNumber = "";
  String Message = "";

  void SendMessage() {
    FlutterOpenWhatsapp.sendSingleMessage(PhoneNumber, Message);
  }
}
