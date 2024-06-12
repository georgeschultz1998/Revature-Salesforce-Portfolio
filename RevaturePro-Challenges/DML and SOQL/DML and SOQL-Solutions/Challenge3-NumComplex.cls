public class DataLord {
    public static Integer NumComplex() {
        return [SELECT COUNT() FROM Account WHERE Name LIKE '%&%'];
    }
}
