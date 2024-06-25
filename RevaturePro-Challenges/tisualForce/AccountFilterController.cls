public class AccountFilterController {
    public String filter { get; set; }
    public transient List<Account> filteredAccounts { get; private set; }

    public void applyFilter() {
        filteredAccounts = [SELECT Name, (SELECT Name FROM Contacts) FROM Account WHERE Name LIKE :('%' + filter + '%')];
    }
}
