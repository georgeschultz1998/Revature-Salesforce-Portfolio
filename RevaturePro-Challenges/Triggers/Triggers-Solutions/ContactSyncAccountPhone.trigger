trigger ContactSyncAccountPhone on Contact (after update) {
    Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
    for (Contact con : Trigger.new) {
        Contact oldCon = Trigger.oldMap.get(con.Id);
        if (con.Phone != oldCon.Phone && con.AccountId != null) {
            accountsToUpdate.put(con.AccountId, new Account(Id = con.AccountId, Phone = con.Phone));
        }
    }
    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate.values();
    }
}
