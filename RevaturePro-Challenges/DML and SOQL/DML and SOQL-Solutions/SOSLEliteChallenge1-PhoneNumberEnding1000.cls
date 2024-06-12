public class DataLord {
    public static List<List<SObject>> PhoneNumberEnding1000() {
        return [FIND '1000' IN PHONE FIELDS RETURNING Account(Name), Contact(Name), Lead(Name)];
    }
}
