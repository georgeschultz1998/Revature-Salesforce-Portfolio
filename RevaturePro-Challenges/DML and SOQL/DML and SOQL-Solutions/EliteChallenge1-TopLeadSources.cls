public class DataLord {
    public static List<AggregateResult> TopLeadSources() {
        return [SELECT LeadSource, COUNT(Id) num, COUNT(CASE WHEN IsWon = TRUE THEN 1 ELSE NULL END) num_won FROM Opportunity WHERE LeadSource != NULL GROUP BY LeadSource ORDER BY num_won DESC LIMIT 5];
    }
}
