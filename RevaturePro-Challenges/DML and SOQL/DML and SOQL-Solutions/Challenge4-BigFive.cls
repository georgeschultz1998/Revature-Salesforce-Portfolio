public class DataLord {
    public static List<Account> BigFive() {
        return [SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC LIMIT 5];
    }
}
