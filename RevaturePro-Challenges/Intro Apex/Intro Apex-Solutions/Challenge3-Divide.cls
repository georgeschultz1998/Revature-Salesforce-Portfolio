public class Challenge3_Divide {
    public static Integer Divide(Integer num1, Integer num2) {
        Integer quotient = 0;
        Integer sum = num2;
        while (sum <= num1) {
            sum = Challenge1_Add.Add(sum, num2);
            quotient = Challenge1_Add.Add(quotient, 1);
        }
        return quotient;
    }
}