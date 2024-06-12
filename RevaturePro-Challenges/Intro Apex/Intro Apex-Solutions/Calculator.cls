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
    public Double Calculate(String expression) {
        Stack<Double> values = new Stack<Double>();
        Stack<String> ops = new Stack<String>();
    
        Integer i = 0;
        while (i < expression.length()) {
            if (expression.charAt(i) == ' ') {
                i++;
                continue;
            }
    
            if (Character.isDigit(expression.charAt(i)) || expression.charAt(i) == '.') {
                StringBuilder sb = new StringBuilder();
                while (i < expression.length() && (Character.isDigit(expression.charAt(i)) || expression.charAt(i) == '.')) {
                    sb.append(expression.charAt(i++));
                }
                values.push(Double.valueOf(sb.toString()));
                continue;
            }
    
            if (expression.charAt(i) == '(') {
                ops.push('(');
            } else if (expression.charAt(i) == ')') {
                while (ops.peek() != '(') {
                    Double b = values.pop();
                    Double a = values.pop();
                    String op = ops.pop();
                    values.push(evaluate(a, b, op));
                }
                ops.pop();
            } else if (expression.charAt(i) == '+' || expression.charAt(i) == '-' || expression.charAt(i) == '*' || expression.charAt(i) == '/') {
                while (!ops.isEmpty() && hasPrecedence(expression.charAt(i), ops.peek())) {
                    Double b = values.pop();
                    Double a = values.pop();
                    String op = ops.pop();
                    values.push(evaluate(a, b, op));
                }
                ops.push(String.valueOf(expression.charAt(i)));
            }
            i++;
        }
    
        while (!ops.isEmpty()) {
            Double b = values.pop();
            Double a = values.pop();
            String op = ops.pop();
            values.push(evaluate(a, b, op));
        }
    
        return values.pop();
    }
    
    private Double evaluate(Double a, Double b, String op) {
        switch on op {
            when '+' { return Double.valueOf(Add(a.intValue(), b.intValue())); }
            when '-' { return Double.valueOf(Add(a.intValue(), -b.intValue())); }
            when '*' { return Double.valueOf(Multiply(a.intValue(), b.intValue())); }
            when '/' { return Double.valueOf(Divide(a.intValue(), b.intValue())); }
            when else { throw new AuraHandledException('Unknown operator: ' + op); }
        }
    }
    
    private Boolean hasPrecedence(String op1, String op2) {
        if (op2 == '(' || op2 == ')') {
            return false;
        }
        if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-')) {
            return false;
        }
        return true;
    }
    
}
