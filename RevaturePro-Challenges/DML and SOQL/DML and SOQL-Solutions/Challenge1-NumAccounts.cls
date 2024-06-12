public class DataLord {
    public static Integer NumAccounts() {
        return [SELECT COUNT() FROM Account];
    }
}
