public class DataLord {
    public static void CreateHomes() {
        List<Account> accountsToCreate = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            accountsToCreate.add(new Account(Name = 'Home' + i));
        }
        insert accountsToCreate;
    }
}
