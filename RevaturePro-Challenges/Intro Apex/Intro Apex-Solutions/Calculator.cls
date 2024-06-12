public class Calculator {

    // Challenge I: Add method
    public Integer Add(Integer a, Integer b) {
        return a + b;
    }

    // Challenge II: Multiply method
    public Integer Multiply(Integer a, Integer b) {
        Integer result = 0;
        for (Integer i = 0; i < b; i++) {
            result = Add(result, a);
        }
        return result;
    }

    // Challenge III & IV: Divide method
    public Integer Divide(Integer a, Integer b) {
        if (b == 0) {
            return 0; // Challenge IV: Return 0 if divisor is zero
        }
        Integer result = 0;
        Integer sum = b;
        while (sum <= a) {
            sum = Add(sum, b);
            result = Add(result, 1);
        }
        return result;
    }

    // Challenge V: Mod method
    public Integer Mod(Integer a, Integer b) {
        Integer quotient = Divide(a, b);
        Integer product = Multiply(quotient, b);
        return a - product;
    }

    // Elite Challenge I: Calculate method
    public Decimal Calculate(String expression) {
        // Evaluate the expression using the built-in Apex expression evaluation
        Decimal result = (Decimal)Parser.parseExpression(expression).evaluate();
        return result;
    }
    
    // Main method for testing
    public static void main() {
        Calculator calc = new Calculator();
        
        System.debug('Add: ' + calc.Add(1, 2)); // 3
        System.debug('Multiply: ' + calc.Multiply(2, 3)); // 6
        System.debug('Divide: ' + calc.Divide(10, 2)); // 5
        System.debug('Divide by zero: ' + calc.Divide(10, 0)); // 0
        System.debug('Mod: ' + calc.Mod(10, 3)); // 1

        // Elite Challenge I test cases
        System.debug('Calculate 1 + 2 * 3: ' + calc.Calculate('1 + 2 * 3')); // 7
        System.debug('Calculate 2 * 2 + 3: ' + calc.Calculate('2 * 2 + 3')); // 7
        System.debug('Calculate (1 + 2) * 3: ' + calc.Calculate('(1 + 2) * 3')); // 9
        System.debug('Calculate ((3 * (4 + 2) - 8) + 10) / 2: ' + calc.Calculate('((3 * (4 + 2) - 8) + 10) / 2')); // 10
        System.debug('Calculate (10.5 * 2 - 10) * 0.5: ' + calc.Calculate('(10.5 * 2 - 10) * 0.5')); // 5.5
    }
}
