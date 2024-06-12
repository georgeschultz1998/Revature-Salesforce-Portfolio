public class DataLord {
    public static void SpawnContacts() {
        List<Contact> contactsToCreate = new List<Contact>();
        for (Integer i = 0; i < 200; i++) {
            contactsToCreate.add(new Contact(LastName = 'Contact' + i));
        }
        insert contactsToCreate;
    }
}
