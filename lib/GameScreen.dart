import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabooo/DataModel.dart';
import 'Result.dart';

class GameScreen extends StatefulWidget {
  final BaseModel data;

  GameScreen({required this.data});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  BaseModel baseModel = BaseModel();

  void initState() {
    widget.data.GeciciSure = widget.data.Sure;
    readJson();
    sayac();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/kelimeler.json');
    final veri = await json.decode(response);
    setState(() {
      widget.data.items = veri["items"];
    });
  }

  void sayac() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (widget.data.Sure > 0) {
        setState(() {
          widget.data.Sure -= 1;
        });
      } else {
        widget.data.Sure = widget.data.GeciciSure;
        if (widget.data.OynayanTakim == 1) {
          widget.data.OynayanTakim = 2;
        } else {
          widget.data.OynayanTakim = 1;
        }
        widget.data.MoladaMiyiz = true;
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.data.MoladaMiyiz
            ? Text("")
            : widget.data.OynayanTakim == 1
                ? Text(widget.data.Takim1.TakimAdi)
                : Text(widget.data.Takim2.TakimAdi),
      ),
      body: widget.data.MoladaMiyiz
          ? Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: GestureDetector(child: Text(widget.data.Takim1.TakimAdi)),
                              ),
                              SizedBox(
                                child: Text(widget.data.Takim1.Puan.round().toString()),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: Text(widget.data.Takim2.TakimAdi),
                              ),
                              SizedBox(
                                child: Text(widget.data.Takim2.Puan.round().toString()),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            onPressed: () => {
                                  widget.data.MoladaMiyiz = false,
                                  if (widget.data.OyunTekrari > 0)
                                    {
                                      widget.data.OyunTekrari--,
                                    }
                                  else
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ResultScreen(
                                                    data: widget.data,
                                                  ))),
                                    },
                                  sayac(),
                                },
                            child: Text("Devam")),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : getBody(),
      bottomNavigationBar: widget.data.MoladaMiyiz
          ? Text("")
          : BottomNavigationBar(
              fixedColor: Colors.black,
              onTap: (int index) {
                TakimModel model;
                setState(() {
                  if (widget.data.OynayanTakim == 1) {
                    model = widget.data.Takim1;
                  } else {
                    model = widget.data.Takim2;
                  }
                  if (index == 0 && model.KullanilanPas < widget.data.PasHakki) {
                    model.KullanilanPas++;
                    widget.data.items[widget.data.index++];
                    if (model.KullanilanPas == widget.data.PasHakki) {
                      widget.data.items[widget.data.index];
                    }
                  }
                  if (index == 1) {
                    model.KullanilanTabu++;
                    widget.data.OynayanTakim == 1
                        ? widget.data.Takim1.Puan -= widget.data.TabuHakki
                        : widget.data.Takim2.Puan -= widget.data.TabuHakki;
                    widget.data.items[widget.data.index++];
                  }
                  if (index == 2) {
                    model.Puan++;
                    widget.data.items[widget.data.index++];
                  }
                });
              },
              backgroundColor: Colors.blueAccent,
              items: [
                BottomNavigationBarItem(label: "Pas", icon: Icon(Icons.dangerous), backgroundColor: Colors.white),
                BottomNavigationBarItem(label: "Tabu", icon: Icon(Icons.warning_rounded), backgroundColor: Colors.white),
                BottomNavigationBarItem(label: "Doğru", icon: Icon(Icons.arrow_right), backgroundColor: Colors.white),
              ],
            ),
    );
  }

  Widget getBody() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("Süre"),
                Text(widget.data.Sure.round().toString()),
              ],
            ),
            Column(
              children: [
                Text("Puan"),
                widget.data.OynayanTakim == 1
                    ? Text(widget.data.Takim1.Puan.round().toString())
                    : Text(widget.data.Takim2.Puan.round().toString()),
              ],
            ),
          ],
        ),
        widget.data.items.isNotEmpty
            ? Center(
                child: GestureDetector(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {},
                      child: SizedBox(
                        width: 200,
                        height: 300,
                        child: Column(children: [
                          Text(widget.data.items[widget.data.index]["soru"]["latince"]),
                          SizedBox(
                            height: 60,
                          ),
                          Text(widget.data.items[widget.data.index]["yasaklilar"][0]["latince"]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(widget.data.items[widget.data.index]["yasaklilar"][1]["latince"]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(widget.data.items[widget.data.index]["yasaklilar"][2]["latince"]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(widget.data.items[widget.data.index]["yasaklilar"][3]["latince"]),
                        ]),
                      ),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
