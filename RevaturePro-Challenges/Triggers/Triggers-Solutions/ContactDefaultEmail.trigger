trigger ContactDefaultEmail on Contact (before insert) {
    for (Contact con : Trigger.new) {
        if (con.Email == null) {
            con.Email = 'default@example.com';
        }
    }
}
