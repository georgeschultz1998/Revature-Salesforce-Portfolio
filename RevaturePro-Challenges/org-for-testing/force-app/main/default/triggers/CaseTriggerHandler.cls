public class CaseTriggerHandler {
    
    public static void handleBeforeInsert(List<Case> newCases) {
        setStatusNew(newCases);
    }

    public static void handleBeforeUpdate(List<Case> newCases, Map<Id, Case> oldCasesMap) {
        updateStatusToWorking(newCases, oldCasesMap);
    }

    private static void setStatusNew(List<Case> newCases) {
        for (Case c : newCases) {
            if (c.Status == null) {
                c.Status = 'New';
            }
        }
    }

    private static void updateStatusToWorking(List<Case> newCases, Map<Id, Case> oldCasesMap) {
        for (Case c : newCases) {
            if (c.InternalComments != null && c.Status == 'New') {
                c.Status = 'Working';
            }
        }
    }
}
