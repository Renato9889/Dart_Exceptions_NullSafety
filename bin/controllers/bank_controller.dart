//classe responsável por gerenciar conta e fazer as transações entre elas
import '../models/account.dart';
import '../exceptions/bank_controller_exceptions.dart';

class BankController {
  //banco de dados Map onde a chave é uma String representando um ID e o valor será uma instância de Account;
  final Map<String, Account> _database = {}; 

  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }
  //Função fazer transferência
  bool makeTransfer(
    // Sender(Remetente) , Receiver(Receptor) e Amount(Quantia)
      {required String idSender,
      required String idReceiver,
      required double amount}) {
    // Verificar se ID de remetente é válido
    if (!verifyId(idSender)) {
      throw SenderIdInvalidException(idSender: idSender);
    }

    // Verificar se ID de destinatário é válido
    if (!verifyId(idReceiver)) {
      throw ReceiverIdInvalidException(idReceiver: idReceiver);
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Verificar se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      throw SenderNotAuthenticatedException(idSender: idSender);
    }

    // Verificar se o remetente possui saldo suficiente
    if (accountSender.balance < amount) {
      throw SenderBalanceLowerThanAmountException( idSender: idSender,
        senderBalance: accountSender.balance,
        amount: amount,);
    }

    // Se tudo estiver certo, efetivar transação
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }
  // Vefificar se o banco de dados tem o ID
  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}
