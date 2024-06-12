public class SearchUtility {
    // Challenge I: Retrieve all Contacts and Leads named Tom
    public static List<List<SObject>> findTom() {
        return [FIND 'Tom' IN Name FIELDS RETURNING Contact(Id, Name), Lead(Id, Name)];
    }

    // Challenge II: Retrieve all Accounts with 'a' and 'o' in any field
    public static List<Account> findAccountsWithAandO() {
        return [FIND 'a AND o' IN ALL FIELDS RETURNING Account(Id, Name)];
    }

    // Elite Challenge I: Find records with phone number ending in 1000
    public static List<List<SObject>> findPhoneEndingIn1000() {
        return [FIND '*1000' IN Phone FIELDS RETURNING Account(Id, Name), Contact(Id, Name), Lead(Id, Name)];
    }
}
