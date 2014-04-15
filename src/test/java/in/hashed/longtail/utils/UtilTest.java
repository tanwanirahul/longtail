package in.hashed.longtail.utils;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import in.hashed.longtail.util.ValidationUtils;
/**
 * Unit test for simple App.
 */
public class UtilTest
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public UtilTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( UtilTest.class );
    }

    /**
     * Just a dummy implementation.
     */
    public void testApp()
    {
        assertTrue( true );
    }

    /**
     * Tests isValidEmail utility.
     */
    public void testIsValidEmail()
    {
        String email = "a.com";
        assertFalse("IsValid should fail for " + email, ValidationUtils.isValidEmail(email));
        email = "git@github.com";
        assertTrue("IsValid shouldn't fail for " + email, ValidationUtils.isValidEmail(email));
    }

    /**
     * Tests empty utility.
     */
    public void testEmpty()
    {
        String data = " ";
        assertFalse(ValidationUtils.empty(data));
        data = "";
        assertTrue(ValidationUtils.empty(data));
        data = null;
        assertTrue(ValidationUtils.empty(data));
    }
}
