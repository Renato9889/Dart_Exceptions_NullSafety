//classe responsável por representar uma conta de banco dos clientes
class Account {
  String name; //epresentando o nome;
  double balance; //representando o saldo em conta;
  bool isAuthenticated; //representa se o usuário está ou não autenticado.

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated});

  //método editBalance usado para editar o saldo.
  editBalance({required value}) {
    balance = balance + value;
  }
}
