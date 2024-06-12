public class DataLord {
    public static void Relocate() {
        List<Contact> contactsToDelete = [SELECT Id FROM Contact ORDER BY CreatedDate DESC LIMIT 50];
        delete contactsToDelete;
    }
}
