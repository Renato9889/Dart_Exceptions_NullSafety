//arquivo que contém a função main que rodará nosso código
import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();
  //Account accountTeste = Account(name: "Ricarth", balance: -20, isAuthenticated: true);
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
  try{
    bool result = bankController.makeTransfer(idSender: "Renato", idReceiver: "Paulo", amount: 100);
    // Observando resultado
    if(result){
      print("Transferência Realizada com sucesso!!!");
    }
  } on SenderIdInvalidException catch(e){
    print(e);
    print("O ID '${e.idSender}' do remetente não é um ID válido.");
  } on ReceiverIdInvalidException catch(e){
    print(e);
    print("O ID '${e.idReceiver}' do destinatário não é um ID válido.");
  } on SenderNotAuthenticatedException catch(e){
    print(e);
    print("O usuário remetente de ID '${e.idSender}' não está autenticado");
  } on SenderBalanceLowerThanAmountException catch(e){
    print(e);
    print("O usuário de ID '${e.idSender}' tentou enviar ${e.amount} sendo que na sua conta tem apenas ${e.senderBalance}");
  } on Exception{
    print("Algo deu muito muito errado");
  }
}
