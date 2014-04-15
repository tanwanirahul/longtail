<html>
<head>
    <title>DesignOnCloud Leads Report Page</title>
    <script type="text/javascript" src="/static/js/jquery-latest.js"></script> 
    <script type="text/javascript" src="/static/js/jquery.tablesorter.js"></script> 

    <script type="text/javascript">
        $(function() {
            $("#tablesorter").tablesorter({
                headers: {
                    0: {sorter: 'usLongDate'}, 
                    1: {sorter: 'ipAddress'}
                }
            });
        }); 
    </script>    
</head>
<body>

<style>
    table.tablesorter {
        font-family:arial;
        background-color: #CDCDCD;
        margin:10px 0pt 15px;
        font-size: 8pt;
        width: 100%;
        text-align: left;
    }
    table.tablesorter thead tr th, table.tablesorter tfoot tr th {
        background-color: #e6EEEE;
        border: 1px solid #FFF;
        font-size: 8pt;
        padding: 4px;
    }
    table.tablesorter thead tr .header {
        background-image: url('http://content.designoncloud.com/static/img/bg.gif');
        background-repeat: no-repeat;
        background-position: center right;
        cursor: pointer;
    }
    table.tablesorter tbody td {
        color: #3D3D3D;
        padding: 4px;
        background-color: #FFF;
        vertical-align: top;
    }
    table.tablesorter tbody tr.even td {
        background-color:#F0F0F6;
    }
    table.tablesorter thead tr .headerSortUp {
        background-image: url('http://content.designoncloud.com/static/img/asc.gif');
    }
    table.tablesorter thead tr .headerSortDown {
        background-image: url('http://content.designoncloud.com/static/img/desc.gif');
    }
    table.tablesorter thead tr .headerSortDown, table.tablesorter thead tr .headerSortUp {
        background-color: #8dbdd8;
    }

    table#tablesorter {margin: 10px 0 0 0;}
    body{background-color:#fff;color:#333;font-size:small;margin:0;padding:0;}
</style>

<@w.renderPagination page=page targetId="formBrowseList" targetUrl="${req.servicesBase}/data/report?"/>

<div class="yui3-g">
  <table id="tablesorter" class="tablesorter" border="0" cellpadding="0" cellspacing="1">
      <thead>
          <tr class="yellow"> 
            <th>Date</th>
            <th>IP</th>
            <th>Browser</th>
            <th>Version</th>
            <th>UserAgent</th>
            <th>UserName</th>
            <th>Phone No</th>
            <th>Email</th>
            <th>FormName</th>
            <th>Category</th>
            <th>Invite Code</th>
            <th>Comments</th>
          </tr>  
      </thead>
      <tbody>
          <#assign i = 0/>
          <#list page.results as f>
            <#assign i = i + 1/>
            <tr class="<#if i%2 == 0>even<#else>odd</#if>">
                <td>${f.date}</td>
                <td>${f.ip!}</td>
                <@extractBrowserInformation f.userAgent/>
                <td>${f.userAgent!}</td>
                <td>${f.values["Name"]!}</td>
                <td>${f.values["Phone_No"]!}</td>
                <td>${f.values["Email"]!}</td>
                <td>${f.values["formName"]!}</td>
                <td>${f.values["category"]!}</td>
                <td>${f.values["InviteCode"]!"N/A"}</td>
                <td>${f.values["Comments"]!f.values["Tell Us About Your Business"]!}</td>
            </tr>
          </#list>
      </tbody>
  </table>
</div>

<#macro extractBrowserInformation nAgt>
    <#assign browserName  = "" />
    <#assign fullVersion  = 0.0/>
    <#assign ix = 0/>
    <#assign flag = false/>

    <#-- In Opera, the true version is after "Opera" or after "Version" -->
    <#assign verOffset = nAgt?index_of("Opera") />
    <#if verOffset != -1 > 
        <#assign browserName = "Opera" />
        <#assign fullVersion = nAgt?substring(verOffset + 6) />
        <#assign verOffset = nAgt?index_of("Version") />
        <#if verOffset != -1 >
            <#assign fullVersion = nAgt?substring(verOffset + 8) />
        </#if>    
        <#assign flag = true/>
    </#if>

    <#-- In MSIE, the true version is after "MSIE" in userAgent -->
    <#assign verOffset = nAgt?index_of("MSIE") />
    <#if verOffset != -1 && !flag > 
        <#assign browserName = "Microsoft Internet Explorer" />
        <#assign fullVersion = nAgt?substring(verOffset + 5) />
        <#assign flag = true/>
    </#if>
    
    <#-- In Chrome, the true version is after "Chrome" -->
    <#assign verOffset = nAgt?index_of("Chrome") />
    <#if verOffset != -1 && !flag > 
        <#assign browserName = "Chrome"/>
        <#assign fullVersion = nAgt?substring(verOffset + 7)/>
        <#assign flag = true/>
    </#if>

    <#-- In Safari, the true version is after "Safari" or after "Version" -->
    <#assign verOffset = nAgt?index_of("Safari") />
    <#if verOffset != -1 && !flag > 
        <#assign browserName = "Safari"/>
        <#assign fullVersion = nAgt?substring(verOffset + 7)/>
        <#assign verOffset = nAgt?index_of("Version") />
        <#if verOffset != -1 >
            <#assign fullVersion = nAgt?substring(verOffset + 8)/>
        </#if>
        <#assign flag = true/>
    </#if>

    <#-- In Firefox, the true version is after "Firefox" -->
    <#assign verOffset = nAgt?index_of("Firefox") />
    <#if verOffset != -1 && !flag> 
        <#assign browserName = "Firefox"/>
        <#assign fullVersion = nAgt?substring(verOffset + 8)/>
        <#assign flag = true/>
    </#if>

    <#-- In most other browsers, "name/version" is at the end of userAgent -->
    <#assign nameOffset = nAgt?last_index_of(' ') + 1 />
    <#assign verOffset = nAgt?last_index_of('/') />
    <#if nameOffset < verOffset && !flag> 
        <#assign browserName = nAgt?substring(nameOffset,verOffset)/>
        <#assign fullVersion = nAgt?substring(verOffset+1)/>
        <#if browserName?trim == "" >
            <#assign browserName = nAgt/>
        </#if>
    </#if>

    <#-- trim the fullVersion string at semicolon/space if present -->
    <#assign ix = fullVersion?index_of(";") />
    <#if ix != -1 >
        <#assign fullVersion=fullVersion?substring(0,ix)/>
    </#if>

    <#assign ix = fullVersion?index_of(" ") />
    <#if ix != -1 >
        <#assign fullVersion=fullVersion?substring(0,ix)/>
    </#if>

    <td>${browserName}</td>
    <td>${fullVersion}</td>
</#macro>

</body>
</html>
