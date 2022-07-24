//todo 3

void main() {

  Enegery energy = Enegery();
  PowerPlant powerPlant = PowerPlant();
  SolarPlant solarPlant = SolarPlant();

  energy.addPlant(powerPlant);
  energy.addPlant(solarPlant);
}


class Enegery{

  List<Power> koneksiPower = [];

  void addPlant(Power power){
    power.turnOn();
    koneksiPower.add(power);
  }
}

class PowerPlant implements Power{
  void turnOn(){
    print('Power plant on');
  }
}

class SolarPlant implements Power{
  void turnOn(){
    print('Solar plant on');
  }
}

abstract class Power{
  void turnOn();
}

//todo 4 (next repository)
/**
 * 1. Kasus pada example_before_abctract bisa teratasa dengan menggunakan
 *    abstract class seperti diatas
 */



