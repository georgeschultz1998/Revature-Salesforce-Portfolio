public class AccountInputController {
    public String accountName { get; set; }
    public Account account { get; private set; }

    public void search() {
        account = [SELECT Name, Industry, (SELECT Name FROM Contacts) FROM Account WHERE Name = :accountName LIMIT 1];
    }
}
