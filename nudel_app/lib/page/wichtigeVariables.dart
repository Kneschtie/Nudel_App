
final Nudelnameliste = List<String>.filled(200, 'test');
final Kochzeitliste = List<int>.filled(200, 0);
int amountofNoodles = 0;
final Zuletztgekocht = List<int>.filled(4, 0);


class WichtigeVariablen {






void Nudelname (String x, int y, int index){
  if(index != null ) {
    print(index);
  Nudelnameliste[index] = x;
  Kochzeitliste[index] = y;
  print(Nudelnameliste.elementAt(index));
  print(y);
  print('iiiiiiiiiiiiiiiiiiii');
}
else{
  print('Error');
}
}

String getNudelName(int x){

  return Nudelnameliste.elementAt(x);
}
int getKochzeit(int x){
  return Kochzeitliste.elementAt(x);
}
void setAmountofNoodles(int x){
  amountofNoodles = x;
}

void setLastNoodles(int index, int data){
  Zuletztgekocht[index] = data;

}

int GetlastNoodleindex(int x){

  return 1;
}

void allesAusgeben(){
  for (int i = 0; i <= amountofNoodles; i++){
    print(Nudelnameliste.elementAt(i));
    print(Kochzeitliste.elementAt(i));
  }
}


}