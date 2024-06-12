public class DataLord {
    public static List<Contact> MajorPlayers() {
        return [SELECT Name, Email FROM Contact WHERE Account.Rating = 'Hot'];
    }
}
