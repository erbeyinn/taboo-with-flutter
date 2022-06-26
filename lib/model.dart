class Model{
  double _Sure = 0;
  double _PasHakki = 0;
  double _TabuHakki = 0;
  int _OynayanTakim = 1;
  bool _MoladaMiyiz = false;
  int _OyunTekrari = 2;
  late Takim _Takim1;
  late Takim _Takim2;


  Takim get Takim1 => _Takim1;

  set Takim1(Takim value) {
    _Takim1 = value;
  }

  double get Sure => _Sure;

  set Sure(double value) {
    _Sure = value;
  }

  double get PasHakki => _PasHakki;

  int get OyunTekrari => _OyunTekrari;

  set OyunTekrari(int value) {
    _OyunTekrari = value;
  }

  bool get MoladaMiyiz => _MoladaMiyiz;

  set MoladaMiyiz(bool value) {
    _MoladaMiyiz = value;
  }

  int get OynayanTakim => _OynayanTakim;

  set OynayanTakim(int value) {
    _OynayanTakim = value;
  }

  double get TabuHakki => _TabuHakki;

  set TabuHakki(double value) {
    _TabuHakki = value;
  }

  set PasHakki(double value) {
    _PasHakki = value;
  }

  Takim get Takim2 => _Takim2;

  set Takim2(Takim value) {
    _Takim2 = value;
  }
}

class Takim extends Model{
  late String _TakimAdi;
  double _Puan = 0;
  double _KullanilanPas = 0;
  double _KullanilanTabu = 0;

  String get TakimAdi => _TakimAdi;

  set TakimAdi(String value) {
    _TakimAdi = value;
  }

  double get Puan => _Puan;

  set Puan(double value) {
    _Puan = value;
  }

  double get KullanilanPas => _KullanilanPas;

  set KullanilanPas(double value) {
    _KullanilanPas = value;
  }

  double get KullanilanTabu => _KullanilanTabu;

  set KullanilanTabu(double value) {
    _KullanilanTabu = value;
  }
}