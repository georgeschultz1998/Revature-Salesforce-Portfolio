public class Challenge4_DivideWithZeroCheck {
    public static Integer DivideWithZeroCheck(Integer num1, Integer num2) {
        if (num2 == 0) {
            return 0;
        }
        return Challenge3_Divide.Divide(num1, num2);
    }
}