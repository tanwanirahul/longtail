package in.hashed.longtail;

public class Constants {
	
	public static final String CONTACT_EMAIL_ADDRESS = "\"Himanshu\" <contact@hashedin.com>";
	public static final String CONTACT_PREFIX_ADDRESS = "contact";
	public static final String EMAIL_DOMAIN_ADDRESS = "@hashedin.com";
	public static final String SUPERADMIN_EMAIL_ADDRESS = "admin@hashedin.com";
	public static final String DOMAIN_NAME = "designoncloud.com";
	public static final String DOMAIN_PREFIX = "designoncloud";
	
	public static class URL { 
		public static final String ADMIN_BASE_URL = "/lt_admin";
		public static final String ADMIN_EDIT_URL = "lt_edit";
		public static final String ADMIN_WIZARD_URL = "/lt_wizard";
		public static final String SERVICES_BASE_URL = ADMIN_BASE_URL + "/" + "services";
	}
	
	public static class MIME { 
		public static final String CSS = "text/css";
		public static final String JAVASCRIPT = "text/javascript";
	}

	public static class ParameterNames {
		public static final String SESSION_ID = "sessionID";
		public static final String SESSION_ID_COOKIE_NAME = "JSESSIONID";
		public static final String URL_SIGNATURE = "signature";
	}
	
	public static class HTTP {
	    public static class Headers {
	        public static final String USER_AGENT = "User-Agent";
	        public static final String ACCEPT_ENCODING = "Accept-Encoding";
	        public static final String SERVER = "Server";
	        public static final String LOCATION = "Location";
	        public static final String CONTENT_TYPE = "Content-Type";
	        public static final String CONTENT_LENGTH = "Content-Length";
	        public static final String CONTENT_ENCODING = "Content-Encoding";
	        public static final String EXPIRES = "Expires";
	    }
	}
	
	public static class RoleNames {
		/**
		 * Default role - can only view sites
		 */
		public static final String ROLE_GLOBAL_USER = "ROLE_GLOBAL_USER";
		
		/**
		 * Administrator across all sites - can do pretty much anything
		 */
		public static final String ROLE_GLOBAL_ADMIN = "ROLE_GLOBAL_ADMIN";
		
		/**
		 * Editor for one particular site. Can edit content for that site
		 */
		public static final String ROLE_SITE_EDITOR = "ROLE_SITE_EDITOR";
		
		/**
		 * Administrator for one particular site. Can do pretty much anything on that site
		 */
		public static final String ROLE_SITE_ADMIN = "ROLE_SITE_ADMIN";
	}
}
