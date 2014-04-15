<%@page import="org.hibernate.stat.Statistics"%>
<%@page import="org.hibernate.stat.SecondLevelCacheStatistics"%>
<%@page import="in.hashed.longtail.model.User"%>
<%@page import="in.hashed.longtail.model.CustomSharedLayoutSite"%>
<%@page import="in.hashed.longtail.model.Page"%><div>
<%@page import="in.hashed.longtail.model.manager.KeyValue"%>
<%@page import="in.hashed.longtail.model.AbstractSite"%>
<%@page import="in.hashed.longtail.model.Site"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="net.sf.ehcache.CacheManager"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
	String server = java.net.InetAddress.getLocalHost().toString(); 
	long total = Runtime.getRuntime().totalMemory() / 1024 / 1024;
	long free = Runtime.getRuntime().freeMemory() / 1024 / 1024;
	long inUse = total - free;
%>
<table>
<tr><td>Total</td><td><%= total %> M</td></tr>
<tr><td>Free</td><td><%= free %> M</td></tr>
<tr><td>Used</td><td><%= inUse %> M</td></tr>
</table>
<%



	WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
	SessionFactory sessionFactory = ctx.getBean(SessionFactory.class);
	
	String cache = request.getParameter("cache");
	
	String message = "";
	
	if("clear".equals(cache))
	{
		sessionFactory.evict(CustomSharedLayoutSite.class);
		sessionFactory.evict(KeyValue.class);
		sessionFactory.evict(Page.class);
		sessionFactory.evict(User.class);
		sessionFactory.evictQueries();
		message += "Cleared cache for Site, KeyValue, Widgets, Pages and User";
	}
	
	Statistics stats = sessionFactory.getStatistics();
	if("display".equals(cache))
	{
	    
	    long hitCount = stats.getSecondLevelCacheHitCount();
	    long missCount = stats.getSecondLevelCacheMissCount();
	    long putCount = stats.getSecondLevelCachePutCount();
	    String[] regionNames  = stats.getSecondLevelCacheRegionNames();
	%>
			
				<div>Hit Count : <%=hitCount%></div>
				<div>Miss Count : <%=missCount%></div>
				<div>Hit Ratio : <%=((double) 100 * hitCount) / (hitCount + missCount) %> %</div>
				<div>
					<% for(String name : regionNames) {
						%>
							<div><a href="debug.jsp?cache=display&region=<%=name%>"><%=name%></a></div>
						<% 
					 } %>
				</div>
			</div>	    
	<%
		
		String regionName = request.getParameter("region");
		if(regionName != null)
		{
			SecondLevelCacheStatistics sStats = stats.getSecondLevelCacheStatistics(regionName);
			
			%>
				<h1><%=regionName%></h1>
				<div>Category name<%=sStats.getCategoryName() %></div>
				<div>Size in Memory : <%=sStats.getSizeInMemory() %></div>
				<div>Element Count <%=sStats.getElementCountInMemory() %></div>
				<div>Element Count (Disk) <%=sStats.getElementCountOnDisk() %></div>
				<div>Hit Count <%=sStats.getHitCount() %></div>
				<div>Miss Count <%=sStats.getMissCount() %></div>
				<div>Put Count <%=sStats.getPutCount() %></div>
				<div>Keys <%=sStats.getEntries().keySet() %></div>
			<%
		}
	}
%>
<h1>Welcome to DesignOnCloud.com Debug Page</h1>
<h3><%=message%></h3>
<table>
	<tr><td>Cache</td><td><a href="debug.jsp?cache=clear">Clear</a></td></tr>
	<tr><td>Cache</td><td><a href="debug.jsp?cache=display">Display</a></td></tr>
</table>
