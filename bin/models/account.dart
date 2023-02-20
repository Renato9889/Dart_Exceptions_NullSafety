//classe responsável por representar uma conta de banco dos clientes
class Account {
  String name; //epresentando o nome;
  double balance; //representando o saldo em conta;
  bool isAuthenticated; //representa se o usuário está ou não autenticado.
  DateTime? createdAT;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated,this.createdAT}): assert(name.isNotEmpty, "O nome não pode ser uma String vazia"),
        assert(balance >= 0);

  //método editBalance usado para editar o saldo.
  editBalance({required value}) {
    balance = balance + value;
  }
}
