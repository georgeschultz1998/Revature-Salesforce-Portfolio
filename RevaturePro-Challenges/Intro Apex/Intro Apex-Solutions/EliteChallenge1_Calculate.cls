public class EliteChallenge1_Calculate {
    public static Decimal Calculate(String expression) {
        List<String> tokens = expression.split(' ');
        Decimal result = 0;
        Decimal current = 0;
        String operation = '';

        for (String token : tokens) {
            if (token.isNumeric()) {
                current = Decimal.valueOf(token);
                switch (operation) {
                    case '+':
                        result += current;
                        break;
                    case '-':
                        result -= current;
                        break;
                    case '*':
                        result *= current;
                        break;
                    case '/':
                        result /= current;
                        break;
                    default:
                        result = current;
                        break;
                }
            } else {
                operation = token;
            }
        }
        return result;
    }
}
