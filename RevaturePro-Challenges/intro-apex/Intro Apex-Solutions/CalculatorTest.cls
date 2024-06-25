@isTest
public class CalculatorTest {

    @isTest
    static void testCalculate() {
        Calculator calc = new Calculator();
        
        // Test simple addition
        Double result = calc.Calculate('2 + 3');
        System.assertEquals(5.0, result);
        
        // Test simple subtraction
        result = calc.Calculate('5 - 2');
        System.assertEquals(3.0, result);
        
        // Test simple multiplication
        result = calc.Calculate('4 * 3');
        System.assertEquals(12.0, result);
        
        // Test simple division
        result = calc.Calculate('10 / 2');
        System.assertEquals(5.0, result);
        
        // Test combination of operations
        result = calc.Calculate('2 + 3 * 4');
        System.assertEquals(14.0, result); // Multiplication before addition
        
        // Test parentheses
        result = calc.Calculate('(2 + 3) * 4');
        System.assertEquals(20.0, result); // Addition before multiplication due to parentheses
    
        // Test complex expression
        result = calc.Calculate('10 + 2 * 6');
        System.assertEquals(22.0, result); // Multiplication before addition
        
        result = calc.Calculate('100 * 2 + 12');
        System.assertEquals(212.0, result);
        
        result = calc.Calculate('100 * ( 2 + 12 )');
        System.assertEquals(1400.0, result); // Parentheses
        
        result = calc.Calculate('100 * ( 2 + 12 ) / 14');
        System.assertEquals(100.0, result); // Combination of operations
    }
}
