public class AccountsAndContactsController {
    public List<Account> accounts { get; private set; }

    public AccountsAndContactsController() {
        accounts = [SELECT Name, (SELECT Name FROM Contacts) FROM Account];
    }
}
