
//todo 1

void main() {
  Enegery energy = Enegery();
  PowerPlant powerPlant = PowerPlant();
  SolarPlant solarPlant = SolarPlant();
  energy.addPlant(powerPlant);
  // energy.addPlant(solarPlant);
}
class Enegery{
  List<PowerPlant> koneksiPower = [];

  void addPlant(PowerPlant power){
    power.turnOn();
    koneksiPower.add(power);
  }
}

class PowerPlant{
  void turnOn(){
    print('Power plant on');
  }
}

class SolarPlant {
  void turnOn(){
    print('Solar plant on');
  }
}

//todo 2 next example_after_abstract
/**
 * 1 Pada code diatas kurang clean, karena ada method yang sama yaitu turnOn()
 * 2. Nah kalau misalkan method tersebut dipanggil tapi class nya berbeda
 *    maka tidak bisa dilakukan, seperti code baris 9
 * 3. Unntuk antisipasinya, dibutuhkan abtract class
 */

