import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Nested;

/**
 *
 * @author ANGELLO
 */
public class JunitTest4 {
    
    @BeforeAll
    public static void beforeAll() {
        System.out.println("**--- JUnit5Sample4Test :: beforeAll :: Executed once before all test methods ---**");
    }
 
    @BeforeEach
    public void beforeEach() {
	System.out.println("**--- JUnit5Sample4Test :: beforeEach :: Executed before each test method ---**");
    }

    @AfterEach
    public void afterEach() {
	System.out.println("**--- JUnit5Sample4Test :: afterEach :: Executed after each test method ---**");
    }

    @AfterAll
    public static void afterAll() {
	System.out.println("**--- JUnit5Sample4Test :: afterAll :: Executed after all test method ---**");
    }
 
    @Nested
    public class InnerClass {
        
        @BeforeEach
        public void beforeEach() {
            System.out.println("**--- InnerClass :: beforeEach :: Executed before each test method ---**");
        }
 
        @AfterEach
        public void afterEach() {
            System.out.println("**--- InnerClass :: afterEach :: Executed after each test method ---**");
        }  
 
        @Test
        public void testMethod1() {
            System.out.println("**--- InnerClass :: testMethod1 :: Executed test method1 ---**");
        }
 
        @Nested
        public class InnerMostClass {
 
            @BeforeEach
            public void beforeEach() {
                System.out.println("**--- InnerMostClass :: beforeEach :: Executed before each test method ---**");
            }

            @AfterEach
            public void afterEach() {
                System.out.println("**--- InnerMostClass :: afterEach :: Executed after each test method ---**");
            }

            @Test
            public void testMethod2() {
                System.out.println("**--- InnerMostClass :: testMethod2 :: Executed test method2 ---**");
            }
        }
    }
}
