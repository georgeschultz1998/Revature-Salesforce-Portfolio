trigger PreventDuplicateContactPhone on Contact (before insert, before update) {
    Set<String> phoneNumbers = new Set<String>();
    for (Contact con : [SELECT Phone FROM Contact WHERE Phone != null]) {
        phoneNumbers.add(con.Phone);
    }
    for (Contact con : Trigger.new) {
        if (con.Phone != null && phoneNumbers.contains(con.Phone)) {
            con.addError('This phone number is already in use by another Contact.');
        } else if (con.Phone != null) {
            phoneNumbers.add(con.Phone);
        }
    }
}
