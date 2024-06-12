trigger DefaultEmailOnContactInsert on Contact (before insert) {
    for (Contact con : Trigger.new) {
        if (String.isBlank(con.Email)) {
            con.Email = 'default@example.com';
        }
    }
}
