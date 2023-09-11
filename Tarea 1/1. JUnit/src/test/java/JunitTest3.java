import java.time.LocalDateTime;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assumptions.assumeFalse;
import static org.junit.jupiter.api.Assumptions.assumeTrue;
import static org.junit.jupiter.api.Assumptions.assumingThat;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;
/**
 *
 * @author ANGELLO
 */
public class JunitTest3 {
    @Test
    public void testAssumeTrue() {
        boolean b = 'A' == 'A';
        assumeTrue(b);
        assertEquals("Hello", "Hello");
    }

    @Test
    @DisplayName("test executes only on Saturday")
    public void testAssumeTrueSunday() {
        LocalDateTime dt = LocalDateTime.now();
        assumeTrue(dt.getDayOfWeek().getValue() == 7);
        System.out.println("further code will execute only if above assumption holds true");
    }

    @Test
    public void testAssumeFalse() {
        boolean b = 'A' != 'A';
        assumeFalse(b);
        assertEquals("Hello", "Hello");
    }

    @Test
    public void testAssumeFalseEnvProp() {
        System.setProperty("env", "prod");
        assumeFalse("dev".equals(System.getProperty("env")));
        System.out.println("further code will execute only if above assumption hold");
    }

    @Test
    public void testAssumingThat() {
        System.setProperty("env", "test");
        assumingThat("test".equals(System.getProperty("env")),
              () -> {
               assertEquals(10, 10);
               System.out.println("perform below assertions only on the test env");
               });

         assertEquals(20, 20);
        System.out.println("perform below assertions on all env");
    }
}
    