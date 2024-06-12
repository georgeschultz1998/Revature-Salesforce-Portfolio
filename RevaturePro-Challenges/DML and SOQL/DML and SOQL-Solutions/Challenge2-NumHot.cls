public class DataLord {
    public static Integer NumHot() {
        return [SELECT COUNT() FROM Account WHERE Rating = 'Hot'];
    }
}
