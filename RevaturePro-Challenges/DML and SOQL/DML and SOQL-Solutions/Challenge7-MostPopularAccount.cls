public class DataLord {
    public static String MostPopularAccount() {
        List<Account> accs = [SELECT Name FROM Account WHERE Id IN (SELECT AccountId FROM Contact GROUP BY AccountId ORDER BY COUNT(Id) DESC LIMIT 1)];
        return accs.size() > 0 ? accs[0].Name : null;
    }
}
