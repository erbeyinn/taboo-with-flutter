class BaseModel {
  int index = 0;
  List items = [];
  int currentIndex = 0;
  double GeciciSure = 0;
  double Sure = 0;
  double PasHakki = 0;
  double TabuHakki = 0;
  int OynayanTakim = 1;
  bool MoladaMiyiz = false;
  int OyunTekrari = 6;
  TakimModel Takim1 = TakimModel();
  TakimModel Takim2 = TakimModel();
}

class TakimModel{
  late String TakimAdi;
  double Puan = 0;
  double KullanilanPas = 0;
  double KullanilanTabu = 0;
}

