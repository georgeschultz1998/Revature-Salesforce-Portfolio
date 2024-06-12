public class DataManipulationUtility {
    // Challenge I: Spawn 200 Contacts
    public static void SpawnContacts() {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 200; i++) {
            contacts.add(new Contact(LastName = 'Contact' + i));
        }
        insert contacts;
    }

    // Challenge II: Create 3 Accounts
    public static void CreateHomes() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            accounts.add(new Account(Name = 'Home' + i));
        }
        insert accounts;
    }

    // Challenge III: Delete 50 most recent Contacts
    public static void Relocate() {
        List<Contact> contactsToDelete = [SELECT Id FROM Contact ORDER BY CreatedDate DESC LIMIT 50];
        delete contactsToDelete;
    }

    // Challenge IV: Assign Contacts to 3 Accounts randomly
    public static void AssignHomes() {
        List<Contact> contacts = [SELECT Id FROM Contact WHERE CreatedDate = TODAY];
        List<Account> accounts = [SELECT Id FROM Account WHERE CreatedDate = TODAY];
        Integer accountIndex = 0;
        for (Contact con : contacts) {
            con.AccountId = accounts[accountIndex].Id;
            accountIndex = (accountIndex + 1);
            if (accountIndex >= accounts.size()) {
                accountIndex = 0;
            }
        }
        update contacts;
    }

    // Elite Challenge I: Set a savepoint, rollback, and print database statistics
    public static void Play() {
        Savepoint sp = Database.setSavepoint();
        System.debug('Number of Contacts at start: ' + [SELECT count() FROM Contact]);
        System.debug('Number of Accounts at start: ' + [SELECT count() FROM Account]);
        SpawnContacts();
        CreateHomes();
        Relocate();
        AssignHomes();
        System.debug('Number of Contacts currently: ' + [SELECT count() FROM Contact]);
        System.debug('Number of Accounts currently: ' + [SELECT count() FROM Account]);
        List<Account> accounts = [SELECT Id, (SELECT Id FROM Contacts) FROM Account];
        for (Account acc : accounts) {
            System.debug('Account Id: ' + acc.Id + ', Number of Related Contacts: ' + acc.Contacts.size());
        }
        Database.rollback(sp);
    }
}
