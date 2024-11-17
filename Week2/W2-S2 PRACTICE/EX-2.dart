class BankAccount {
  final int accountId;
  final String accountOwner;
  double _balance;

  // Main constructor
  BankAccount(this.accountId, this.accountOwner, this._balance);

  // Named constructor for a savings account
  BankAccount.savingsAccount(int accountId, String accountOwner, double initialBalance)
      : this(accountId, accountOwner, initialBalance);

  // Named constructor for a checking account
  BankAccount.checkingAccount(int accountId, String accountOwner)
      : this(accountId, accountOwner, 0.0);

  // Method to get the current balance
  double balance() {
    return _balance;
  }

  // Method to withdraw an amount
  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception('Insufficient funds');
    }
    _balance -= amount;
  }

  // Method to credit an amount
  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  final String Name;
  final List<BankAccount> _accounts = [];

  // Constructor with named parameters
  Bank({required this.Name});

  // Method to create a new bank account
  BankAccount createAccount(int accountId, String accountOwner) {
    // Check for unique account ID
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account ID already exists');
      }
    }

    // Create and add the account
    var newAccount = BankAccount(accountId, accountOwner, 0.0);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  // Creating a bank using named parameter
  Bank myBank = Bank(Name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print("Balance: \$${ronanAccount.balance()}"); // Balance: $0.0
  ronanAccount.credit(100);
  print("Balance: \$${ronanAccount.balance()}"); // Balance: $100.0
  ronanAccount.withdraw(50);
  print("Balance: \$${ronanAccount.balance()}"); // Balance: $50.0

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient funds
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account ID already exists
  }
}
