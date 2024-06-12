public class Calculator {

    // Add method
    public Integer Add(Integer a, Integer b) {
        return a + b;
    }

    // Multiply method
    public Integer Multiply(Integer a, Integer b) {
        Integer result = 0;
        for (Integer i = 0; i < b; i++) {
            result = Add(result, a);
        }
        return result;
    }

    // Divide method
    public Integer Divide(Integer a, Integer b) {
        if (b == 0) {
            return 0; // Return 0 if divisor is zero
        }
        Integer result = 0;
        Integer sum = b;
        while (sum <= a) {
            sum = Add(sum, b);
            result = Add(result, 1);
        }
        return result;
    }

    // Mod method
    public Integer Mod(Integer a, Integer b) {
        Integer quotient = Divide(a, b);
        Integer product = Multiply(quotient, b);
        return a - product;
    }

    // Calculate method
    public Double Calculate(String expression) {
        List<Double> values = new List<Double>();
        List<String> ops = new List<String>();

        Integer i = 0;
        while (i < expression.length()) {
            if (expression.substring(i, i + 1) == ' ') {
                i++;
                continue;
            }

            if (isDigitOrDot(expression.substring(i, i + 1))) {
                String sb = '';
                while (i < expression.length() && isDigitOrDot(expression.substring(i, i + 1))) {
                    sb += expression.substring(i, i + 1);
                    i++;
                }
                values.add(Double.valueOf(sb));
                continue;
            }

            if (expression.substring(i, i + 1) == '(') {
                ops.add('(');
            } else if (expression.substring(i, i + 1) == ')') {
                while (ops.get(ops.size() - 1) != '(') {
                    Double b = values.remove(values.size() - 1);
                    Double a = values.remove(values.size() - 1);
                    String op = ops.remove(ops.size() - 1);
                    values.add(evaluate(a, b, op));
                }
                ops.remove(ops.size() - 1);
            } else if (expression.substring(i, i + 1) == '+' || expression.substring(i, i + 1) == '-' || expression.substring(i, i + 1) == '*' || expression.substring(i, i + 1) == '/') {
                while (!ops.isEmpty() && hasPrecedence(expression.substring(i, i + 1), ops.get(ops.size() - 1))) {
                    Double b = values.remove(values.size() - 1);
                    Double a = values.remove(values.size() - 1);
                    String op = ops.remove(ops.size() - 1);
                    values.add(evaluate(a, b, op));
                }
                ops.add(expression.substring(i, i + 1));
            }
            i++;
        }

        while (!ops.isEmpty()) {
            Double b = values.remove(values.size() - 1);
            Double a = values.remove(values.size() - 1);
            String op = ops.remove(ops.size() - 1);
            values.add(evaluate(a, b, op));
        }

        return values.get(0);
    }

    private Boolean isDigitOrDot(String s) {
        Pattern p = Pattern.compile('^[0-9.]$');
        Matcher m = p.matcher(s);
        return m.matches();
    }

    private Double evaluate(Double a, Double b, String op) {
        if (op == '+') {
            return a + b;
        } else if (op == '-') {
            return a - b;
        } else if (op == '*') {
            return a * b;
        } else if (op == '/') {
            if (b == 0) {
                throw new AuraHandledException('Cannot divide by zero');
            }
            return a / b;
        } else {
            throw new AuraHandledException('Unknown operator: ' + op);
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
