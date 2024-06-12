public class Challenge5_Mod {
    public static Integer Mod(Integer num1, Integer num2) {
        if (num2 == 0) {
            return 0;
        }
        Integer quotient = Challenge3_Divide.Divide(num1, num2);
        Integer product = Challenge2_Multiply.Multiply(quotient, num2);
        return num1 - product;
    }
}