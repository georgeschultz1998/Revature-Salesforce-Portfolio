public class Challenge2_Multiply {
    public static Integer Multiply(Integer num1, Integer num2) {
        Integer result = 0;
        for (Integer i = 0; i < num2; i++) {
            result = Challenge1_Add.Add(result, num1);
        }
        return result;
    }
}