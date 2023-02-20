
import 'dart:math';
import '../controllers/bank_controller.dart';
import '../exceptions/bank_controller_exceptions.dart';
import '../models/account.dart';


void testingNullSafety(){
  Account? myAccount = Account(name: "Ricarth Lima", balance: 300, isAuthenticated: true);

  // Simulando uma comunicação externa que pode ou não preencher myAccount
  Random rng = Random();
  if (rng.nextInt(10) % 2 == 0) {
    myAccount.createdAT = DateTime.now();
  }
  print(myAccount.runtimeType);

  if(myAccount != null){
    print("Conta criada para o cliente ${myAccount.name}");
    if(myAccount.createdAT != null){
      print("O mes de criação da conta é ${myAccount.createdAT!.month}");
    }
  }else{
    print("Conta Nula!!!!");
  }

  //print(myAccount != null ? myAccount.name : "Conta nula.");

  //print(myAccount.name);
}
void main(){
  testingNullSafety();
}