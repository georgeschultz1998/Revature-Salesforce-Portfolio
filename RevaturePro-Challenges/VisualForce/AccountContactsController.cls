public class AccountContactsController {
    public List<Contact> contacts { get; private set; }

    public AccountContactsController(ApexPages.StandardController controller) {
        Id accountId = controller.getId();
        contacts = [SELECT Name FROM Contact WHERE AccountId = :accountId];
    }
}
