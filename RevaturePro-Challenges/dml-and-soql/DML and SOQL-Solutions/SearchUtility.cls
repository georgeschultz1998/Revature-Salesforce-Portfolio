public class SearchUtility {
    // Challenge I: Retrieve all Contacts and Leads named Tom
    public static List<List<SObject>> findTom() {
        return [FIND 'Tom' IN Name FIELDS RETURNING Contact(Id, Name), Lead(Id, Name)];
    }

    // Challenge II: Retrieve all Accounts with 'a' and 'o' in any field
    public static List<Account> findAccountsWithAandO() {
        List<List<SObject>> results = [FIND 'a AND o' IN ALL FIELDS RETURNING Account(Id, Name)];
        List<Account> accounts = new List<Account>();
        if (!results.isEmpty() && results[0] != null) {
            for (SObject obj : results[0]) {
                accounts.add((Account)obj);
            }
        }
        return accounts;
    }

    // Elite Challenge I: Find records with phone number ending in 1000
    public static List<List<SObject>> findPhoneEndingIn1000() {
        return [FIND '*1000' IN Phone FIELDS RETURNING Account(Id, Name), Contact(Id, Name), Lead(Id, Name)];
    }
}
