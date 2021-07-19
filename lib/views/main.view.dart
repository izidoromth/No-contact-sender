import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nocontact_wppsender/views/viewmodels/main.viewmodel.dart';

class MainView extends StatelessWidget {
  MainViewModel viewModel = new MainViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff25d366),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "WhatsApp Sender",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 35),
              Image(
                image: AssetImage("assets/whatsapp.png"),
              ),
              SizedBox(height: 35),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  new LengthLimitingTextInputFormatter(13),
                  new WppNumberInputFormatter(),
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Número inválido';
                  }
                  return null;
                },
                onSaved: (String value) {
                  viewModel.PhoneNumber =
                      value.replaceAll(new RegExp(r'[^0-9]+'), '');
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Phone number",
                ),
              ),
              SizedBox(height: 35),
              TextFormField(
                keyboardType: TextInputType.text,
                minLines: 4,
                maxLines: 4,
                onSaved: (String value) {
                  viewModel.Message = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Message",
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 36,
                  child: FlatButton(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(0),
                    child: Image(
                      image: AssetImage("assets/send.png"),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }

                      viewModel.SendMessage();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WppNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 0) buffer.write("+");
      if (i == 2) buffer.write(" ");
      if (i == 4) buffer.write(" ");
      if (i == 5) buffer.write(" ");
      if (i == 9) buffer.write(" ");
      buffer.write(text[i]);
    }

    var string = buffer.toString();

    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
