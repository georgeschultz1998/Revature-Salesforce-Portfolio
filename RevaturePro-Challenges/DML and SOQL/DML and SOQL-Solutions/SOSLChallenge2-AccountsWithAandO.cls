public class DataLord {
    public static List<Account> AccountsWithAandO() {
        return [FIND 'a AND o' IN ALL FIELDS RETURNING Account(Name)];
    }
}
