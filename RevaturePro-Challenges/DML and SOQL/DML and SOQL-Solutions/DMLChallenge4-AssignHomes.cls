public class DataLord {
    public static void AssignHomes() {
        List<Account> accounts = [SELECT Id FROM Account ORDER BY CreatedDate DESC LIMIT 3];
        List<Contact> contacts = [SELECT Id FROM Contact ORDER BY CreatedDate DESC LIMIT 200];
        Integer i = 0;
        for (Contact con : contacts) {
            con.AccountId = accounts[i % 3].Id;
            i++;
        }
        update contacts;
    }
}
