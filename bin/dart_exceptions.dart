//arquivo que contém a função main que rodará nosso código
import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Paulo",
      account:
          Account(name: "Paulo Filho", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Renato",
      account:
          Account(name: "Renato Luiz", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  bool result = bankController.makeTransfer(
      idSender: "Renato", idReceiver: "Paulo", amount: 200);

  // Observando resultado
  print(result);
}
