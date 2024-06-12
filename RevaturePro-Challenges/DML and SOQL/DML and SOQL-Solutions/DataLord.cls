public class DataLord {
    // Challenge I: Number of Accounts
    public static Integer NumAccounts() {
        return [SELECT count() FROM Account];
    }

    // Challenge II: Number of Hot Accounts
    public static Integer NumHot() {
        return [SELECT count() FROM Account WHERE Rating = 'Hot'];
    }

    // Challenge III: Number of Accounts with '&' in Name
    public static Integer NumComplex() {
        return [SELECT count() FROM Account WHERE Name LIKE '%&%'];
    }

    // Challenge IV: Top 5 Accounts by Annual Revenue
    public static List<Account> BigFive() {
        return [SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC LIMIT 5];
    }

    // Challenge V: Most Recent Opportunity with Amount > 100,000
    public static Opportunity LastBigOpportunity() {
        return [SELECT Id, Name, CloseDate FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC LIMIT 1];
    }

    // Challenge VI: Contacts associated with Hot Accounts
    public static List<Contact> MajorPlayers() {
        return [SELECT Id, Name FROM Contact WHERE Account.Rating = 'Hot'];
    }

    // Challenge VII: Account Name with Most Contacts
    public static String MostPopularAccount() {
        AggregateResult ar = [SELECT Account.Name Name, COUNT(Id) ContactCount FROM Contact GROUP BY Account.Name ORDER BY COUNT(Id) DESC LIMIT 1];
        return (String)ar.get('Name');
    }

    // Elite Challenge I: Top 5 Lead Sources by Likelihood to Close
    public static List<AggregateResult> TopLeadSources() {
        return [SELECT LeadSource, COUNT(Id) Total, COUNT(Id) / (SELECT COUNT(Id) FROM Opportunity WHERE IsClosed = TRUE) Likelihood 
                FROM Opportunity WHERE LeadSource != NULL GROUP BY LeadSource ORDER BY COUNT(Id) DESC LIMIT 5];
    }
}
