public class DeleteStaleAccountsBatch implements Database.Batchable<SObject>, Database.Stateful {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id FROM Account WHERE Id NOT IN ' +
                       '(SELECT AccountId FROM Opportunity WHERE CloseDate >= LAST_N_MONTHS:6 AND IsClosed = FALSE)';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope) {
        List<Account> accountsToDelete = new List<Account>();

        for (Account acc : scope) {
            accountsToDelete.add(acc);
        }

        delete accountsToDelete;
    }

    public void finish(Database.BatchableContext bc) {
        // Optional: Add any post-processing or logging here
    }
}
