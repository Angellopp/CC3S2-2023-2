import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;

/**
 *
 * @author ANGELLO
 */
public class JunitTest1 {
    
    @BeforeAll
    public static void beforeAll() {
        System.out.println("**--- Executed once before all test methods in this class ---**");
    }

    @BeforeEach
    public void beforeEach() {
      System.out.println("**--- Executed before each test method in this class ---**");
    }

    @Test
    public void testMethod1() {
      System.out.println("**--- Test method1 executed ---**");
    }

    @DisplayName("Test method2 with condition")
    @Test
    public void testMethod2() {
        System.out.println("**--- Test method2 executed ---**");
    }

    @Test
    @Disabled("implementation pending")
    public void testMethod3() {
        System.out.println("**--- Test method3 executed ---**");
    }

    @AfterEach
    public void afterEach() {
        System.out.println("**--- Executed after each test method in this class ---**");
    }

    @AfterAll
    public static void afterAll() {
        System.out.println("**--- Executed once after all test methods in this class ---**");
    }
}
