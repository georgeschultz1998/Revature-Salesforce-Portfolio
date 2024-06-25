public class ContactTriggerHandler {
    
    public static void handleBeforeInsert(List<Contact> newContacts) {
        setDefaultEmail(newContacts);
        preventDuplicatePhone(newContacts);
    }

    public static void handleBeforeUpdate(List<Contact> newContacts, Map<Id, Contact> oldContactsMap) {
        syncAccountPhone(newContacts);
        preventDuplicatePhone(newContacts);
    }

    private static void setDefaultEmail(List<Contact> newContacts) {
        for (Contact con : newContacts) {
            if (con.Email == null) {
                con.Email = con.LastName + '@example.com';
            }
        }
    }

    private static void syncAccountPhone(List<Contact> newContacts) {
        List<Account> accountsToUpdate = new List<Account>();
        for (Contact con : newContacts) {
            Account acc = [SELECT Id, Phone FROM Account WHERE Id = :con.AccountId];
            if (acc != null && acc.Phone != con.Phone) {
                acc.Phone = con.Phone;
                accountsToUpdate.add(acc);
            }
        }
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }

    private static void preventDuplicatePhone(List<Contact> newContacts) {
        Set<String> phoneNumbers = new Set<String>();
        for (Contact con : newContacts) {
            if (con.Phone != null && phoneNumbers.contains(con.Phone)) {
                con.addError('Duplicate phone number found: ' + con.Phone);
            }
            phoneNumbers.add(con.Phone);
        }
    }
}
