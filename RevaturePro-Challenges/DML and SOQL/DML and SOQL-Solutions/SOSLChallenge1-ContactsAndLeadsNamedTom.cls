public class DataLord {
    public static List<List<SObject>> ContactsAndLeadsNamedTom() {
        return [FIND 'Tom' IN NAME FIELDS RETURNING Contact(Name), Lead(Name)];
    }
}
