public class DataLord {
    public static void Play() {
        Savepoint sp = Database.setSavepoint();

        System.debug('Initial State');
        System.debug('Number of Contacts: ' + [SELECT COUNT() FROM Contact]);
        System.debug('Number of Accounts: ' + [SELECT COUNT() FROM Account]);

        SpawnContacts();
        CreateHomes();
        Relocate();
        AssignHomes();

        System.debug('After DML Operations');
        System.debug('Number of Contacts: ' + [SELECT COUNT() FROM Contact]);
        System.debug('Number of Accounts: ' + [SELECT COUNT() FROM Account]);

        List<Account> accounts = [SELECT Id, (SELECT Id FROM Contacts) FROM Account ORDER BY CreatedDate DESC LIMIT 3];
        for (Account acc : accounts) {
            System.debug('Account ' + acc.Id + ' has ' + acc.Contacts.size() + ' related Contacts.');
        }

        Database.rollback(sp);
    }
}
