@IsTest
public class CalculatorTest {

    @IsTest
    static void testCalculate() {
        Calculator calc = new Calculator();
        
        // Test simple addition
        Double result = calc.Calculate('2 + 3');
        System.assertEquals(5.0, result, 'Test Case: 2 + 3 Failed');
        
        // Test simple subtraction
        result = calc.Calculate('5 - 2');
        System.assertEquals(3.0, result, 'Test Case: 5 - 2 Failed');
        
        // Test simple multiplication
        result = calc.Calculate('4 * 3');
        System.assertEquals(12.0, result, 'Test Case: 4 * 3 Failed');
        
        // Test simple division
        result = calc.Calculate('10 / 2');
        System.assertEquals(5.0, result, 'Test Case: 10 / 2 Failed');
        
        // Test combination of operations
        result = calc.Calculate('2 + 3 * 4');
        System.assertEquals(14.0, result, 'Test Case: 2 + 3 * 4 Failed'); // Multiplication before addition
        
        // Test parentheses
        result = calc.Calculate('(2 + 3) * 4');
        System.assertEquals(20.0, result, 'Test Case: (2 + 3) * 4 Failed'); // Addition before multiplication due to parentheses
        
        // Test complex expression
        result = calc.Calculate('10 + 2 * 6');
        System.assertEquals(22.0, result, 'Test Case: 10 + 2 * 6 Failed'); // Multiplication before addition
        
        result = calc.Calculate('100 * 2 + 12');
        System.assertEquals(212.0, result, 'Test Case: 100 * 2 + 12 Failed');
        
        result = calc.Calculate('100 * ( 2 + 12 )');
        System.assertEquals(1400.0, result, 'Test Case: 100 * ( 2 + 12 ) Failed'); // Parentheses
        
        result = calc.Calculate('100 * ( 2 + 12 ) / 14');
        System.assertEquals(100.0, result, 'Test Case: 100 * ( 2 + 12 ) / 14 Failed'); // Combination of operations

        // Additional test cases
        // Test case 1: 1 + 2 * 3 = 7
        result = calc.Calculate('1 + 2 * 3');
        System.assertEquals(7.0, result, 'Test Case: 1 + 2 * 3 Failed');

        // Test case 2: 2 * 2 + 3 = 7
        result = calc.Calculate('2 * 2 + 3');
        System.assertEquals(7.0, result, 'Test Case: 2 * 2 + 3 Failed');

        // Test case 3: (1 + 2) * 3 = 9
        result = calc.Calculate('(1 + 2) * 3');
        System.assertEquals(9.0, result, 'Test Case: (1 + 2) * 3 Failed');

        // Test case 4: ((3 * (4 + 2) - 8) + 10) / 2 = 10
        result = calc.Calculate('((3 * (4 + 2) - 8) + 10) / 2');
        System.assertEquals(10.0, result, 'Test Case: ((3 * (4 + 2) - 8) + 10) / 2 Failed');

        // Test case 5: (10.5 * 2 - 10) * 0.5 = 5.5
        result = calc.Calculate('(10.5 * 2 - 10) * 0.5');
        System.assertEquals(5.5, result, 'Test Case: (10.5 * 2 - 10) * 0.5 Failed');
    }
}
