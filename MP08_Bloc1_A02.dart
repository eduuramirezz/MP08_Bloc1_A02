mixin Basket {
  int tirarCistellaTirLliure(bool encert) {
    return encert ? 1 : 0;
  }

  int tirarCistellaDeDosPunts(bool encert) {
    return encert ? 2 : 0;
  }

  int tirarCistellaDeTresPunts(bool encert) {
    return encert ? 3 : 0;
  }
}

mixin Futbol {
  int picarFalta(bool encert) {
    return encert ? 1 : 0;
  }

  int picarPenal(bool encert) {
    return encert ? 1 : 0;
  }
}

abstract class Esportista {
  DateTime dataNaixement;
  String nacionalitat;
  String nomEsport;

  Esportista(this.dataNaixement, this.nacionalitat, this.nomEsport);
}

abstract class EsportistaEquip extends Esportista {
  String nomJugador;
  String nomEquip;
  DateTime dataFiContracte;

  EsportistaEquip(
    DateTime dataNaixement,
    String nacionalitat,
    String nomEsport,
    this.nomJugador,
    this.nomEquip,
    this.dataFiContracte,
  ) : super(dataNaixement, nacionalitat, nomEsport);
}

class JugadorFutbol extends EsportistaEquip with Futbol {
  JugadorFutbol(
    DateTime dataNaixement,
    String nacionalitat,
    String nomEsport,
    String nomJugador,
    String nomEquip,
    DateTime dataFiContracte,
  ) : super(
        dataNaixement,
        nacionalitat,
        nomEsport,
        nomJugador,
        nomEquip,
        dataFiContracte,
      );
  @override
  String toString() {
    return '$nomJugador $nomEquip $dataNaixement $dataFiContracte $nacionalitat $nomEsport';
  }
}

class JugadorBasket extends EsportistaEquip with Basket {
  JugadorBasket(
    DateTime dataNaixement,
    String nacionalitat,
    String nomEsport,
    String nomJugador,
    String nomEquip,
    DateTime dataFiContracte,
  ) : super(
        dataNaixement,
        nacionalitat,
        nomEsport,
        nomJugador,
        nomEquip,
        dataFiContracte,
      );
  @override
  String toString() {
    return '$nomJugador $nomEquip $dataNaixement $dataFiContracte $nacionalitat $nomEsport';
  }
}

void main() {
  var araujo = JugadorFutbol(
    DateTime(1999, 3, 7),
    'Uruguai',
    'Futbol',
    'Ronald Araujo',
    'FC Barcelona',
    DateTime(2027, 6, 30),
  );

  print(araujo);
  print(araujo.picarFalta(false));
  print(araujo.picarPenal(true));

  var nadji = JugadorBasket(
    DateTime(2004, 8, 14),
    'Nigèria',
    'Basket',
    'James Nadji',
    'FC Barcelona',
    DateTime(2025, 6, 30),
  );

  print(nadji);
  print(nadji.tirarCistellaTirLliure(true));
  print(nadji.tirarCistellaDeDosPunts(false));
  print(nadji.tirarCistellaDeTresPunts(true));
}
