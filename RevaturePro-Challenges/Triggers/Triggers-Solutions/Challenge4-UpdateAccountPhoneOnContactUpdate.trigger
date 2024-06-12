trigger UpdateAccountPhoneOnContactUpdate on Contact (after update) {
    Map<Id, String> accountPhonesToUpdate = new Map<Id, String>();
    for (Contact con : Trigger.new) {
        if (con.Phone != Trigger.oldMap.get(con.Id).Phone && con.AccountId != null) {
            accountPhonesToUpdate.put(con.AccountId, con.Phone);
        }
    }
    if (!accountPhonesToUpdate.isEmpty()) {
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accId : accountPhonesToUpdate.keySet()) {
            accountsToUpdate.add(new Account(Id = accId, Phone = accountPhonesToUpdate.get(accId)));
        }
        update accountsToUpdate;
    }
}
