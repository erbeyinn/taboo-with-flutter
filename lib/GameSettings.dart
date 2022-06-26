import 'package:flutter/material.dart';
import 'package:tabooo/DataModel.dart';
import 'package:tabooo/GameScreen.dart';

import 'model.dart';

class GameSetting extends StatefulWidget {
  const GameSetting({Key? key}) : super(key: key);

  @override
  _GameSettingState createState() => _GameSettingState();
}

class _GameSettingState extends State<GameSetting> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  BaseModel baseModel = BaseModel();

  void initState() {
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: _controller,
              onChanged: (String text) {
                baseModel.Takim1.TakimAdi = _controller.text;
              },
              onSubmitted: (String text) {
                baseModel.Takim1.TakimAdi = text;
              },
              decoration: InputDecoration(
                  focusColor: Colors.deepPurple,
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                  labelText: 'takım 1'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: _controller2,
              onChanged: (String text) {
                baseModel.Takim2.TakimAdi = _controller2.text;
              },
              onSubmitted: (String text) {
                baseModel.Takim2.TakimAdi = text;
              },
              decoration: InputDecoration(
                  focusColor: Colors.deepPurple,
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                  labelText: 'takım 2'),
            ),
          ),
          SizedBox(
            height: 20,
            child: Text("Ayarlar"),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Slider(
              value: baseModel.Sure,
              min: 0,
              max: 180,
              divisions: 10,
              label: baseModel.Sure.round().toString(),
              onChanged: (double value) {
                setState(() {
                  baseModel.Sure = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Slider(
              value: baseModel.TabuHakki,
              min: 0,
              max: 3,
              divisions: 3,
              label:baseModel.TabuHakki.round().toString(),
              onChanged: (double value) {
                setState(() {
                  baseModel.TabuHakki = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Slider(
              value: baseModel.PasHakki,
              min: 0,
              max: 3,
              divisions: 3,
              label: baseModel.PasHakki.round().toString(),
              onChanged: (double value) {
                setState(() {
                  baseModel.PasHakki = value;
                });
              },
            ),
          ),
          Container(
            child: OutlinedButton(
              child: Text("BASLA"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(
                    data: baseModel,
                )));
              },
            ),
          )
        ],
      ),
    );
  }
}
