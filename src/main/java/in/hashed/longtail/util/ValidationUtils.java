package in.hashed.longtail.util;


/**
 * The Class ValidationUtils.
 */
public final class ValidationUtils
{
    /**
     * Empty.
     * 
     * @param value
     *            the value
     * @return true, if successful
     */
    public static boolean empty(final String value)
    {
        return value == null || "".equals(value);
    }

    /**
     * Validate.
     * 
     * @param value
     *            the value
     * @param regex
     *            the regex
     * @return true, if successful
     */
    public static boolean matches(final String value, final String regex)
    {
        return value.matches(regex);
    }

    /**
    private static final int MAX_WEIGHT_KG = 300;
    private static final int MIN_WEIGHT_KG = 20;
    private static final int MAX_HEIGHT_INCHES = 100;
    private static final int MIN_HEIGHT_INCHES = 12;
    // private static final Date MIN_DATE = DateTimeUtils.date(1900, 1, 1);

     * Reject.
     * 
     * @param fieldName
     *            the field name
     * @param validationContext
     *            the validation context
     
    public static void reject(final String fieldName, final ValidationContext validationContext)
    {
        reject(fieldName, validationContext, fieldName);
    }

    /**
     * Reject.
     * 
     * @param fieldName
     *            the field name
     * @param validationContext
     *            the validation context
     * @param defaultErrorCode
     *            the default error code
    public static void reject(final String fieldName, final ValidationContext validationContext,
        final String defaultErrorCode)
    {
        String errorCode = defaultErrorCode;

        if (validationContext == null || fieldName == null)
        {
            return;
        }

        if (errorCode == null)
        {
            errorCode = fieldName;
        }

        validationContext.getMessageContext().addMessage(
                new MessageBuilder().error().source(fieldName).code("form.errors." + errorCode).defaultText(errorCode)
                        .build());
    }

    /**
     * Reject.
     * 
     * @param fieldName
     *            the field name
     * @param validationContext
     *            the validation context
     * @param defaultErrorCode
     *            the default error code
     * @param args
     *            the args
    public static void reject(final String fieldName, final ValidationContext validationContext,
        final String defaultErrorCode, final Object... args)
    {
        validationContext.getMessageContext().addMessage(
                new MessageBuilder().error().source(fieldName).code("form.errors." + defaultErrorCode).args(args)
                        .defaultText(defaultErrorCode).build());
    }

    /**
     * Reject if.
     * 
     * @param reject
     *            the reject
     * @param fieldName
     *            the field name
     * @param validationContext
     *            the validation context
     * @return true, if successful
    public static boolean rejectIf(final boolean reject, final String fieldName,
        final ValidationContext validationContext)
    {
        if (reject)
        {
            reject(fieldName, validationContext, fieldName);
        }

        return reject;
    }

    /**
     * Reject if empty.
     * 
     * @param field
     *            the field
     * @param value
     *            the value
     * @param validationContext
     *            the validation context
    public static void rejectIfEmpty(final String field, final Object value, final ValidationContext validationContext)
    {
        if (value == null)
        {
            reject(field, validationContext);
        }

    }

    /**
     * Validate dob.
     * 
     * @param fieldName
     *            the field name
     * @param dateOfBirth
     *            the date of birth
     * @param validationContext
     *            the validation context
     * @return true, if successful
    public static boolean validateDob(final String fieldName, final Date dateOfBirth,
        final ValidationContext validationContext)
    {
        if (dateOfBirth.before(MIN_DATE) || dateOfBirth.after(DateTimeUtils.currentDate()))
        {
            reject(fieldName, validationContext);
            return false;
        }

        return true;
    }

    /**
     * Validate email.
     * 
     * @param field
     *            the field
     * @param email
     *            the email
     * @param validationContext
     *            the validation context
     * @return true, if successful
     */ 
    public static boolean isValidEmail(final String email)
    {
        return email != null && matches(email, "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}");
    }

    /**
     * Validate height.
     * 
     * @param fieldName
     *            the field name
     * @param height
     *            the height
     * @param validationContext
     *            the validation context
     * @return true, if successful
    public static boolean validateHeight(final String fieldName, final Double height,
        final ValidationContext validationContext)
    {
        if (height < MIN_HEIGHT_INCHES || height > MAX_HEIGHT_INCHES)
        {
            reject(fieldName, validationContext);
            return false;
        }

        return true;
    }
    */
    
    /**
     * Validate name.
     * 
     * @param field
     *            the field
     * @param userName
     *            the user name
     * @param validationContext
     *            the validation context
     * @return true, if successful
    public static boolean validateName(final String field, final String userName,
        final ValidationContext validationContext)
    {
        if (userName == null || !matches(userName, "[a-z0-9A-Z .]{4,50}"))
        {
            reject(field, validationContext);
            return false;
        }

        return true;
    }
    */
    
    /**
     * Validate nick name.
     * 
     * @param nickName
     *            the nick name
     * @param fieldName
     *            the field name
     * @param validationContext
     *            the validation context
     * @return true, if validate nick name
    public static boolean validateNickName(final String fieldName, final String nickName,
        final ValidationContext validationContext)
    {
        if (empty(nickName) || !matches(nickName, "[a-zA-Z0-9_ ]{2,30}"))
        {
            reject(fieldName, validationContext);
            return false;
        }

        return true;
    }
     */

    /**
     * Validate password.
     * 
     * @param field
     *            the field
     * @param password
     *            the password
     * @param validationContext
     *            the validation context
    public static boolean validatePassword(final String field, final String password,
        final ValidationContext validationContext)
    {
        if (password == null || !matches(password, ".{5,30}"))
        {
            reject(field, validationContext);
            return false;
        }
        
        return true;
    }     */

    /**
     * Validate team title.
     * 
     * @param field
     *            the field
     * @param title
     *            the title
     * @param validationContext
     *            the validation context
     * @return true, if successful
    public static boolean validateTeamTitle(final String field, final String title,
        final ValidationContext validationContext)
    {
        if (title == null || !matches(title, "[A-Za-z0-9 _.'-]{5,100}"))
        {
            reject(field, validationContext);
            return false;
        }

        return true;
    }     */

    /**
     * Validate text.
     * 
     * @param field
     *            the field
     * @param catchPhrase
     *            the catch phrase
     * @param validationContext
     *            the validation context
    public static void validateText(final String field, final String catchPhrase,
        final ValidationContext validationContext)
    {
        if (catchPhrase == null || !matches(catchPhrase, ".{5,2048}"))
        {
            reject(field, validationContext);
        }
    }     */

    /**
     * Validate weight.
     * 
     * @param fieldName
     *            the field name
     * @param weight
     *            the weight
     * @param validationContext
     *            the validation context
     * @return true, if successful

    public static boolean validateWeight(final String fieldName, final Double weight,
        final ValidationContext validationContext)
    {
        if (weight < MIN_WEIGHT_KG || weight > MAX_WEIGHT_KG)
        {
            reject(fieldName, validationContext);
            return false;
        }

        return true;
    }
    */
    /**
     * Instantiates a new validation utils.
     */
    private ValidationUtils()
    {

    }

}
