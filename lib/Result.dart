import 'package:flutter/material.dart';
import 'package:tabooo/DataModel.dart';
import 'package:tabooo/main.dart';

import 'model.dart';

class ResultScreen extends StatefulWidget {
  final BaseModel data;
  ResultScreen({required this.data});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.data.Takim1.Puan > widget.data.Takim2.Puan
                        ? Text('Kazanan takım: ' + widget.data.Takim1.TakimAdi)
                        :  widget.data.Takim1.Puan < widget.data.Takim2.Puan
                        ? Text('Kazanan takım: ' + widget.data.Takim2.TakimAdi)
                        : widget.data.Takim1.Puan == widget.data.Takim2.Puan
                        ? Text("Berabere")
                        : Text(''),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                        },
                        child: Text('Başa Dön')
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
