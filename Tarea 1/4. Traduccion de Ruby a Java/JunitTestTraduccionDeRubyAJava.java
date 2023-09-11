import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 *
 * @author ANGELLO
 */
public class JunitTestTraduccionDeRubyAJava {

    @Test
    public void testAddWithTwoNumbers_given2And4_shouldReturn6() {
        int result = StringCalculator.add("2,4");
        assertEquals(6, result);
    }

    @Test
    public void testAddWithTwoNumbers_given17And100_shouldReturn117() {
        int result = StringCalculator.add("17,100");
        assertEquals(117, result);
    }
}
