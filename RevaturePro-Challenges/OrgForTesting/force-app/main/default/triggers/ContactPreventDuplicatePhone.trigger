trigger ContactPreventDuplicatePhone on Contact (before insert, before update) {
    Set<String> phoneNumbers = new Set<String>();
    for (Contact con : [SELECT Phone FROM Contact WHERE Phone IN :Trigger.newMap.keySet()]) {
        phoneNumbers.add(con.Phone);
    }

    for (Contact con : Trigger.new) {
        if (con.Phone != null && phoneNumbers.contains(con.Phone)) {
            con.addError('Duplicate phone number detected.');
        } else if (con.Phone != null) {
            phoneNumbers.add(con.Phone);
        }
    }
}
