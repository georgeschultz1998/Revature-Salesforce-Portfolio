public class DataLord {
    public static Opportunity LastBigOpportunity() {
        return [SELECT Name, CloseDate, Amount FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC LIMIT 1];
    }
}
