public class ScheduleDeleteStaleAccounts implements Schedulable {

    public void execute(SchedulableContext sc) {
        DeleteStaleAccountsBatch batch = new DeleteStaleAccountsBatch();
        Database.executeBatch(batch);
    }
}
