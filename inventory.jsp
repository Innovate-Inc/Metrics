<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="jspClasses/commonMethods.jsp" %><%@ include file="jspClasses/login.jsp" %>
<%@page import="org.json.JSONObject" %>
<%@page import="org.json.JSONArray" %>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="org.apache.http.HttpResponse"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  String responseBody = "";
    String jsonUrl;
    Calendar today;
	JSONObject filterobj=null;
    today = Calendar.getInstance();
    long now = today.getTimeInMillis();

    jsonUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/json/cached_json/inventory.json?cacheClr=" + now;
	   
	HttpClient httpClient = new DefaultHttpClient();
	HttpGet getRequest = new HttpGet(jsonUrl);
	HttpResponse resp = httpClient.execute(getRequest);

	if (resp.getStatusLine().getStatusCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
			   + resp.getStatusLine().getStatusCode());
		}
		
	BufferedReader rd = new BufferedReader(
	new InputStreamReader(resp.getEntity().getContent()));

StringBuffer result = new StringBuffer();
String line = "";
while ((line = rd.readLine()) != null) {
	result.append(line);
}
System.out.println("print result:"+result);
filterobj = new JSONObject(result.toString());

JSONArray arr = filterobj.getJSONArray("items");

JSONArray ownersArr = new JSONArray();
JSONArray epaNonEpaArr = new JSONArray();
JSONArray publisherArr = new JSONArray();
JSONArray inputDtArr = new JSONArray();
JSONArray updateDtArr = new JSONArray();
JSONArray appStArr = new JSONArray();
JSONArray pubMthdArr = new JSONArray();
JSONArray accLvlArr = new JSONArray();
JSONArray dataGovAccLvlArr = new JSONArray();
JSONArray metadataStdlArr = new JSONArray();
JSONArray cntTypeArr = new JSONArray();
JSONArray srcArr = new JSONArray();
JSONArray licenseUrlArr = new JSONArray();
JSONArray rightsArr = new JSONArray();
JSONArray pgrStatusArr = new JSONArray();
JSONArray cmplArr = new JSONArray();
JSONArray collArr = new JSONArray();

for (int i = 0; i < arr.length(); i++) {
JSONObject item = arr.getJSONObject(i);
				
String owner = item.getString("username");
String epapub = item.getString("epapub");
String publisher = item.getString("publisher");
String inputDt = item.getString("inputdate");
String updateDt = item.getString("updatedate");
String appSt = item.getString("approvalstatus");
String pubMthd = item.getString("pubmethod");
String accessLvl = item.getString("acl_opt");
String dataGovAccLvl = item.getString("accesslevel");
String metadataStd = item.getString("schema_key");
String contentType = item.getString("content_type");
String source = item.getString("source");
String licenseUrl = item.getString("licenseurl");
String rights = item.getString("rightsnote");
String pgrStatus = item.getString("progressstatus");
String cmpl = item.getString("cmpparenttitle");
String coll = item.getString("colparenttitle");

ownersArr.put(owner);
epaNonEpaArr.put(epapub);
publisherArr.put(publisher);
inputDtArr.put(inputDt);
updateDtArr.put(updateDt);
appStArr.put(appSt);
pubMthdArr.put(pubMthd);
accLvlArr.put(accessLvl);
dataGovAccLvlArr.put(dataGovAccLvl);
metadataStdlArr.put(metadataStd);
cntTypeArr.put(contentType);
srcArr.put(source);
licenseUrlArr.put(licenseUrl);
rightsArr.put(rights);
pgrStatusArr.put(pgrStatus);
cmplArr.put(cmpl);
collArr.put(coll);
}
Map<String,Integer> ownersMap = new TreeMap<String,Integer>();
 for (int i = 0; i < ownersArr.length(); i++) {
	String ownerItem = ownersArr.getString(i);
	if(ownersMap.get(ownerItem) != null){
		ownersMap.put(ownerItem,ownersMap.get(ownerItem)+1);
	}else{
		ownersMap.put(ownerItem,1);
	}
 }
Map<String,Integer> epaMap = new TreeMap<String,Integer>();
 for (int i = 0; i < epaNonEpaArr.length(); i++) {
	String epaItem = epaNonEpaArr.getString(i);
	if(epaMap.get(epaItem) != null){
		epaMap.put(epaItem,epaMap.get(epaItem)+1);
	}else{
		epaMap.put(epaItem,1);
	}
 }
 Map<String,Integer> pubMap = new TreeMap<String,Integer>();
 for (int i = 0; i < publisherArr.length(); i++) {
	String publisherItem = publisherArr.getString(i);
	if(pubMap.get(publisherItem) != null){
		pubMap.put(publisherItem,pubMap.get(publisherItem)+1);
	}else{
		pubMap.put(publisherItem,1);
	}
 }
 Map<String,Integer> inputDtMap = new TreeMap<String,Integer>();
 for (int i = 0; i < inputDtArr.length(); i++) {
	String inputDtItem = inputDtArr.getString(i);
	if(inputDtMap.get(inputDtItem) != null){
		inputDtMap.put(inputDtItem,inputDtMap.get(inputDtItem)+1);
	}else{
		inputDtMap.put(inputDtItem,1);
	}
 }
  Map<String,Integer> updateDtMap = new TreeMap<String,Integer>();
 for (int i = 0; i < updateDtArr.length(); i++) {
	String updateDtItem = updateDtArr.getString(i);
	if(updateDtMap.get(updateDtItem) != null){
		updateDtMap.put(updateDtItem,updateDtMap.get(updateDtItem)+1);
	}else{
		updateDtMap.put(updateDtItem,1);
	}
 }
 Map<String,Integer> appStMap = new TreeMap<String,Integer>();
 for (int i = 0; i < appStArr.length(); i++) {
	String appStItem = appStArr.getString(i);
	if(appStMap.get(appStItem) != null){
		appStMap.put(appStItem,appStMap.get(appStItem)+1);
	}else{
		appStMap.put(appStItem,1);
	}
 }
 Map<String,Integer> pubMthdMap = new TreeMap<String,Integer>();
 for (int i = 0; i < pubMthdArr.length(); i++) {
	String pubMthdItem = pubMthdArr.getString(i);
	if(pubMthdMap.get(pubMthdItem) != null){
		pubMthdMap.put(pubMthdItem,pubMthdMap.get(pubMthdItem)+1);
	}else{
		pubMthdMap.put(pubMthdItem,1);
	}
 }
 Map<String,Integer> edgAccMap = new TreeMap<String,Integer>();
 for (int i = 0; i < accLvlArr.length(); i++) {
	String accLvlItem = accLvlArr.getString(i);
	if(edgAccMap.get(accLvlItem) != null){
		edgAccMap.put(accLvlItem,edgAccMap.get(accLvlItem)+1);
	}else{
		edgAccMap.put(accLvlItem,1);
	}
 }
 Map<String,Integer> dataGovAccLvlMap = new TreeMap<String,Integer>();
 for (int i = 0; i < dataGovAccLvlArr.length(); i++) {
	String dataGovAccLvlItem = dataGovAccLvlArr.getString(i);
	if(dataGovAccLvlMap.get(dataGovAccLvlItem) != null){
		dataGovAccLvlMap.put(dataGovAccLvlItem,dataGovAccLvlMap.get(dataGovAccLvlItem)+1);
	}else{
		dataGovAccLvlMap.put(dataGovAccLvlItem,1);
	}
 }
 Map<String,Integer> metadataStdMap = new TreeMap<String,Integer>();
 for (int i = 0; i < metadataStdlArr.length(); i++) {
	String metadataStdItem = metadataStdlArr.getString(i);
	if(metadataStdMap.get(metadataStdItem) != null){
		metadataStdMap.put(metadataStdItem,metadataStdMap.get(metadataStdItem)+1);
	}else{
		metadataStdMap.put(metadataStdItem,1);
	}
 }
 Map<String,Integer> cntTypeMap = new TreeMap<String,Integer>();
 for (int i = 0; i < cntTypeArr.length(); i++) {
	String cntTypeItem = cntTypeArr.getString(i);
	if(cntTypeMap.get(cntTypeItem) != null){
		cntTypeMap.put(cntTypeItem,cntTypeMap.get(cntTypeItem)+1);
	}else{
		cntTypeMap.put(cntTypeItem,1);
	}
 }
 Map<String,Integer> srcMap = new TreeMap<String,Integer>();
 for (int i = 0; i < srcArr.length(); i++) {
	String srcItem = srcArr.getString(i);
	if(srcMap.get(srcItem) != null){
		srcMap.put(srcItem,srcMap.get(srcItem)+1);
	}else{
		srcMap.put(srcItem,1);
	}
 }
 Map<String,Integer> licenseUrlMap = new TreeMap<String,Integer>();
 for (int i = 0; i < licenseUrlArr.length(); i++) {
	String licenseUrlItem = licenseUrlArr.getString(i);
	if(licenseUrlMap.get(licenseUrlItem) != null){
		licenseUrlMap.put(licenseUrlItem,licenseUrlMap.get(licenseUrlItem)+1);
	}else{
		licenseUrlMap.put(licenseUrlItem,1);
	}
 }
 Map<String,Integer> rightsMap = new TreeMap<String,Integer>();
 for (int i = 0; i < rightsArr.length(); i++) {
	String rightsItem = rightsArr.getString(i);
	if(rightsMap.get(rightsItem) != null){
		rightsMap.put(rightsItem,rightsMap.get(rightsItem)+1);
	}else{
		rightsMap.put(rightsItem,1);
	}
 }
 Map<String,Integer> pgrStatusMap = new TreeMap<String,Integer>();
 for (int i = 0; i < pgrStatusArr.length(); i++) {
	String pgrStatusItem = pgrStatusArr.getString(i);
	if(pgrStatusMap.get(pgrStatusItem) != null){
		pgrStatusMap.put(pgrStatusItem,pgrStatusMap.get(pgrStatusItem)+1);
	}else{
		pgrStatusMap.put(pgrStatusItem,1);
	}
 }
 Map<String,Integer> cmplMap = new TreeMap<String,Integer>();
 for (int i = 0; i < cmplArr.length(); i++) {
	String cmplItem = cmplArr.getString(i);
	if(cmplMap.get(cmplItem) != null){
		cmplMap.put(cmplItem,cmplMap.get(cmplItem)+1);
	}else{
		cmplMap.put(cmplItem,1);
	}
 }
 Map<String,Integer> collMap = new TreeMap<String,Integer>();
 for (int i = 0; i < collArr.length(); i++) {
	String collItem = collArr.getString(i);
	if(collMap.get(collItem) != null){
		collMap.put(collItem,collMap.get(collItem)+1);
	}else{
		collMap.put(collItem,1);
	}
 }
 
    commonMethods obj = new commonMethods();
    obj.setHttpServletRequest(request);
    
    login loginObj = new login(getServletContext());
    String[] ret = loginObj.verify(request);
    if (!(ret[0].equals("true"))) {
        out.println(obj.getNoAccessPage(ret));
        out.close();
    }

    String resourceLink, metadataLink;
    String[] links = obj.getMetaDataLinks(request);
    resourceLink = links[0];
    metadataLink = links[1];
%>
<html>

<!--[if IEMobile 7]><html class="iem7 no-js" lang="en" dir="ltr"><![endif]-->
<!--[if lt IE 7]><html class="lt-ie9 lt-ie8 lt-ie7 no-js" lang="en" dir="ltr"><![endif]-->
<!--[if (IE 7)&(!IEMobile)]><html class="lt-ie9 lt-ie8 no-js" lang="en" dir="ltr"><![endif]-->
<!--[if IE 8]><html class="lt-ie9 no-js" lang="en" dir="ltr"><![endif]-->
<!--[if (gt IE 8)|(gt IEMobile 7)]><!-->
<html class="no-js not-oldie" lang="en" dir="ltr">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="HandheldFriendly" content="true" />
<link rel="shortcut icon"
	href="https://www.epa.gov/sites/all/themes/epa/favicon.ico"
	type="image/vnd.microsoft.icon" />
<meta name="MobileOptimized" content="width" />
<meta http-equiv="cleartype" content="on" />
<meta http-equiv="ImageToolbar" content="false" />
<meta name="viewport" content="width=device-width" />
<meta name="version" content="20161218" />
<!--googleon: all-->
<meta name="DC.description" content="" />
<meta name="DC.title" content="" />
<title>EDG Inventory</title>
<!--googleoff: snippet-->
<meta name="keywords" content="" />
<link rel="shortlink" href="" />
<link rel="canonical" href="" />
<meta name="DC.creator" content="" />
<meta name="DC.language" content="en" />
<meta name="DC.Subject.epachannel" content="" />
<meta name="DC.type" content="" />
<meta name="DC.date.created" content="" />
<meta name="DC.date.modified" content="" />
<!--googleoff: all-->
<!-- font libs -->
<link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"	rel="stylesheet" />
<link rel="stylesheet" href="javaScripts/bootstrap.min.css">

<!-- demo page styles -->
<link href="javaScripts/dist/css/jplist.demo-pages.min.css"	rel="stylesheet" type="text/css" />

<!-- jPList css files -->
<link href="javaScripts/dist/css/jplist.core.min.css" rel="stylesheet" type="text/css" />
<link href="javaScripts/dist/css/jplist.textbox-filter.min.css"	rel="stylesheet" type="text/css" />
<link href="javaScripts/dist/css/jplist.pagination-bundle.min.css" rel="stylesheet" type="text/css" />
<link href="javaScripts/jquery-ui.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="https://www.epa.gov/sites/all/libraries/template2/s.css" media="all" />
<!-- jQuery lib -->		
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- jPList core js and css  -->
<link href="javaScripts/dist/css/jplist.core.min.css" rel="stylesheet" type="text/css" />	
<script src="javaScripts/dist/js/jplist.core.min.js"></script>
<!-- jPList toggle bundle -->
<script src="javaScripts/dist/js/jplist.filter-toggle-bundle.min.js"></script>
<link href="javaScripts/dist/css/jplist.filter-toggle-bundle.min.css" rel="stylesheet" type="text/css" />
<!-- filter dropdown bundle -->
<script src="javaScripts/dist/js/jplist.filter-dropdown-bundle.min.js"></script>
<!-- jPList textbox filter control -->
<script src="javaScripts/dist/js/jplist.textbox-filter.min.js"></script>
<link href="javaScripts/dist/css/jplist.textbox-filter.min.css" rel="stylesheet" type="text/css" />

<!--[if lt IE 9]><link type="text/css" rel="stylesheet" href="https://www.epa.gov/sites/all/themes/epa/css/ie.css" media="all" /><![endif]-->
<link rel="alternate" type="application/atom+xml"
	title="EPA.gov All Press Releases"
	href="https://www.epa.gov/newsreleases/search/rss" />
<link rel="alternate" type="application/atom+xml"
	title="EPA.gov Headquarters Press Releases"
	href="https://www.epa.gov/newsreleases/search/rss/field_press_office/headquarters" />
<link rel="alternate" type="application/atom+xml"
	title="Greenversations, EPA's Blog"
	href="https://blog.epa.gov/blog/feed/" />
<!--[if lt IE 9]><script src="https://www.epa.gov/sites/all/themes/epa/js/html5.js"></script><![endif]-->
<style>
.demoHeaders {
	margin-top: 2em;
}

#dialog-link {
	padding: .4em 1em .4em 20px;
	text-decoration: none;
	position: relative;
}

#dialog-link span.ui-icon {
	margin: 0 5px 0 0;
	position: absolute;
	left: .2em;
	top: 50%;
	margin-top: -8px;
}

#icons {
	margin: 0;
	padding: 0;
}

#icons li {
	margin: 2px;
	position: relative;
	padding: 4px 0;
	cursor: pointer;
	float: left;
	list-style: none;
}

#icons span.ui-icon {
	float: left;
	margin: 0 4px;
}

.fakewindowcontain .ui-widget-overlay {
	position: absolute;
}

select {
	width: 200px;
}

.title {
	font-size: 12px;
	padding: 4px 14px;
	font-weight: bold;
}

.jplist .title {
	font-size: 16px;
	color: black;
}

.jplist .list .list-item {
	margin-top: -23px;
	float: left;
	/*border-bottom: 6px solid #cccccc;*/
}

.ui-accordion .ui-accordion-header {
	display: block;
	cursor: pointer;
	position: relative;
	margin: 2px 0 0 0; //
	padding: .5em .5em .5em .7em;
	font-size: 12px;
	vertical-align: middle;
	padding: 10px 0px;
	color: #595959;
	background-color: #f8f8f8;
}

*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	font-size: 12px;
	background-color: #ffffff;
	font-family: "Avenir Next W01", "Avenir Next", "Avenir",
		"Helvetica Neue", "Helvetica", "Arial", sans-serif;
	line-height: 1.66667;
	color: #4c4c4c;
	background-color: #f8f8f8;
	font-weight: 300;
	letter-spacing: .03em;
}

html {
	font-size: 10px;
	-webkit-tap-highlight-color: transparent;
}

.pull-left {
	float: left !important;
}

.jplist-panel {
	color: #27252a;
	margin-left: .6em;
}

.desc {
	padding: 2px;
	font-size: 10px;
	width: 85%;
	margin-left: 20px;
}

.jplist .date {
	float: right;
	color: #440e00;
	padding: 2px;
	font-size: 10px;
	width: 85%;
	margin-left: 20px;
}
.site-name-and-slogan {
    float: left;
}
.site-slogan {
   
    font-family: Arial, sans-serif;
    font-size: 100%;
    font-weight: normal;
    line-height: 1;
    position: relative;
    padding: .5em 0 0;
    display: block;
    white-space: nowrap;
}
accItem{
margin-left: -31px;}
#noofresults {
    padding: 3px 12px 9px 11px;
    line-height: normal;
    border: 1px;
    border-style: solid;
    height: 222px;
    border-radius: -55px;
    box-shadow: 0 0 1px #fff;
    -ms-box-sizing: border-box;
    -o-box-sizing: border-box;
    box-sizing: border-box;
    border: 1px solid #dbdbdb;
    border-radius: 3px;
    text-shadow: 1px 1px 1px #fff;
    color: #27252a;
    width: 150px;
    text-indent: 6px;
    background: #fff;
}
.ui-widget-content{
   display: block; height: 84px;
}
#menu{
    list-style: none;
}
#menu td{
    display: inline-flex;
    padding: 0 10px;
    border-left: solid 1px black;
}
#menu td:first-child{
    border-left: none;
}
#accordion ul{
	    list-style: none;
}
.publisher{
    width: 110px;
}
.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
    padding: 8px;
    line-height: 1.128571;
    vertical-align: top;
    border-top: 1px solid #ddd;
   
}
.ul>table>thead>tbody>tr>th>li{
	list-style: none;
}
dd, ol, p, ul, .fieldset-description, .form-actions, .form-item, .pane-content > .node, .node-teaser, .view-mode-teaser:not(.file), .view-mode-teaser2, .view-mode-title2, ul.accordion ul {
    margin: 0;
    padding-bottom: 0px;
    word-wrap: break-word;
}
.table>thead>tr>th {
    vertical-align: bottom;
    border-bottom: 0px solid #ddd;
}
td, th {
    border: 1px solid #ccc;
}
input[type='checkbox'] {
  padding: 0;
  position: absolute;
  left: 176px;
}
</style>
</head>
<!-- NOTE, figure out body classes! -->
<body class="node-type-page resource-directory wide-template">
	<!-- Google Tag Manager -->
	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-L8ZB"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-L8ZB');</script>
	<!-- End Google Tag Manager -->
	<div class="skip-links">
		<a href="#main-content"
			class="skip-link element-invisible element-focusable">Jump to main content</a>
	</div>
	<header class="masthead clearfix" role="banner"> <img
		class="site-logo"
		src="https://www2.epa.gov/sites/all/themes/epa/logo.png" alt="" /> <hgroup
		class="site-name-and-slogan">
	<h1 class="site-name">
		<a href="https://www.epa.gov/" title="Go to the home page" rel="home"><span>US EPA</span></a>
	</h1>
	<div class="site-slogan">United States Environmental Protection	Agency</div>
	</hgroup> </header>
	<section id="main-content" class="main-content clearfix" role="main">

	<div class="main-column clearfix">
		<!--googleon: all-->
		<%-- <h1 class="page-title"></h1> --%>
		<div class="panel-pane pane-node-content">
			<div class="pane-content">
				<div class="node node-page clearfix view-mode-full">

                  <div class="box">
							<div class="center">
								<!--<><><><><><><><><><><><><><><><><><><><><><><><><><> DEMO START <><><><><><><><><><><><><><><><><><><><><><><><><><>-->

								<!-- demo -->
								<div id="demo" class="box jplist" style="margin: 36px 0 50px 33px;">  
									<div class="jplist-ios-button">
										<i class="fa fa-sort"></i> jPList Actions
									</div>
									<div class="jplist-panel box panel-top jplist-group">
									
					<div style="width: 30%; height: 50%; float: left;margin-top: -33px; margin-left: -88px;">
						<!-- Accordion -->
                        				
				
                   <div class="text-filter-box" style="padding-top: 35px; padding-left: 31px;">

						   <i class="fa fa-search jplist-icon"></i>
						   
						   <!--[if lt IE 10]>
						   <div class="jplist-label">Search any text in the element:</div>
						   <![endif]-->
						   
						   <input style="width: 141px;
							  data-path="*" id="anytext"
							  type="text" 
							  value="" 
							  placeholder="Search any text in the element"
							  data-control-type="textbox" 
							  data-control-name="title-filter" 
							  data-control-action="filter"
							  class="jplist-no-right-border"
						   />
						   <i class="fa fa-times-circle jplist-clear" data-type="clear"></i>
						   
						  
						</div>	
						<select id="sel" onchange="myfun()"
						   class="jplist-select jplist-dd-panel" style="margin-left: 223px;width: 75px;margin-top: 0px;"
						   >
						     <option value="">Filter By</option> 
							 <option value=".title">Title</option>
                             <option value=".username">Owner</option>							
						</select>
						<div id="accordion" style="margin: 75px 0 50px 33px;">
                          <h3 class="title accItem">Text based search on "Resource Title"</h3>						   
						   <div>
							
							<div class="text-filter-box">

											<i class="fa fa-search  jplist-icon"></i>

											<!--[if lt IE 10]>
                            <div class="jplist-label">Filter by Title:</div>
                            <![endif]-->

											<input  data-path=".title" type="text" value=""
												placeholder="Filter by Title" data-control-type="textbox"
												data-control-name="title-filter"
												data-control-action="filter" />
										</div>
							</div>
							<h3 class="title">Text based search on "Owner"</h3>						   
						   <div>
							
							<div class="text-filter-box">

											<i class="fa fa-search  jplist-icon"></i>

											<!--[if lt IE 10]>
                            <div class="jplist-label">Filter by Title:</div>
                            <![endif]-->

											<input data-path=".username" type="text" value=""
												placeholder="Filter by Owner" data-control-type="textbox"
												data-control-name="owner-filter"
												data-control-action="filter" />
										</div>
							</div>
							
                            	
                              <h3 class="title">Owner:</h3>							
							    <div>
							
								<ul>
								<div style="border:0px;" 
						   class="jplist-group"
						   data-control-type="checkbox-group-filter"
						   data-control-action="filter"
						   data-control-name="themes">
							<%  
							 Set<String> ownerKeySet = ownersMap.keySet();
							 Iterator<String> ownersIterator = ownerKeySet.iterator();
							 while(ownersIterator.hasNext()){	                         
								String ownerItem = ownersIterator.next();
								Integer count = ownersMap.get(ownerItem);
							%>
							
							 <li><input type="checkbox" data-path=".username" id="username"><%=count%> <%=ownerItem%>
							 
						   </li>
							<% } %>
							</div>
							 </ul>
							
							</div>
							
							<h3 class="title">EPA/Non-EPA :</h3>
							<div>
								<ul>
							<%  
	                          Set<String> epaKeySet = epaMap.keySet();
							 Iterator<String> epaIterator = epaKeySet.iterator();
							 while(epaIterator.hasNext()){	                         
								String epapubItem = epaIterator.next();
								Integer count = epaMap.get(epapubItem);
							%>
							 <li><strong><%=count%></strong> <%=epapubItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Text based search on "Publisher"</h3>
							<div>
							<input type="text" name="publisher" style="width: 295px;">
							</div>
							 	
                              <h3 class="title">Publisher:</h3>							
							    <div>
							
								<ul>
							<%  
	                          Set<String> pubKeySet = pubMap.keySet();
							 Iterator<String> pubIterator = pubKeySet.iterator();
							 while(pubIterator.hasNext()){	                         
								String publisherItem = pubIterator.next();
								Integer count = pubMap.get(publisherItem);
							%>
							 <li><%=count%> <%=publisherItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Text based search on "Document UUID"</h3>
							<div>
							<input type="text" name="docId" style="width: 295px;">
							</div>
							
							<h3 class="title">Text based search on "Input Date"</h3>
							<div>
							<input type="text" name="inputDt" style="width: 295px;">
							</div>
							
							<h3 class="title">Input Date:</h3>							
							    <div>
							
								<ul>
							<%  
	                          Set<String> inputDtKeySet = inputDtMap.keySet();
							 Iterator<String> inputDtIterator = inputDtKeySet.iterator();
							 while(inputDtIterator.hasNext()){	                         
								String inputDtItem = inputDtIterator.next();
								Integer count = inputDtMap.get(inputDtItem);
							%>
							 <li><%=count%> <%=inputDtItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Text based search on "Update Date"</h3>
							<div>
							<input type="text" name="updateDt" style="width: 295px;">
							</div>
							
							<h3 class="title">Update Date:</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> updateDtKeySet = updateDtMap.keySet();
							 Iterator<String> updateDtIterator = updateDtKeySet.iterator();
							 while(updateDtIterator.hasNext()){	                         
								String updateDtItem = updateDtIterator.next();
								Integer count = updateDtMap.get(updateDtItem);
							%>
							 <li><%=count%> <%=updateDtItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Text based search on "Approval Status"</h3>
							<div>
							<input type="text" name="apprSt" style="width: 295px;">
							</div>
							
							<h3 class="title">Approval Status :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> appStKeySet = appStMap.keySet();
							 Iterator<String> appStIterator = appStKeySet.iterator();
							 while(appStIterator.hasNext()){	                         
								String appStItem = appStIterator.next();
								Integer count = appStMap.get(appStItem);
							%>
							 <li><%=count%> <%=appStItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Text based search on "Publication Method"</h3>
							<div>
							<input type="text" name="pubMthd" style="width: 295px;">
							</div>
							
							<h3 class="title">Publication Method :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> pubmethodKeySet = pubMthdMap.keySet();
							 Iterator<String> pubMthdIterator = pubmethodKeySet.iterator();
							 while(pubMthdIterator.hasNext()){	                         
								String pubMthdItem = pubMthdIterator.next();
								Integer count = pubMthdMap.get(pubMthdItem);
							%>
							 <li><%=count%> <%=pubMthdItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">EDG Access Level :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> edgAccKeySet = edgAccMap.keySet();
							 Iterator<String> edgAccIterator = edgAccKeySet.iterator();
							 while(edgAccIterator.hasNext()){	                         
								String accLvlItem = edgAccIterator.next();
								Integer count = edgAccMap.get(accLvlItem);
							%>
							 <li><%=count%> <%=accLvlItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Data.gov Access Level :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> dataGovAccLvlKeySet = edgAccMap.keySet();
							 Iterator<String> dataGovAccLvlIterator = dataGovAccLvlKeySet.iterator();
							 while(dataGovAccLvlIterator.hasNext()){	                         
								String dataGovAccLvlItem = dataGovAccLvlIterator.next();
								Integer count = edgAccMap.get(dataGovAccLvlItem);
							%>
							 <li><%=count%> <%=dataGovAccLvlItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Text based search on "Metadata standard"</h3>
							<div>
							<input type="text" name="metadataStd" style="width: 295px;">
							</div>
							
							<h3 class="title">Metadata standard :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> metadataStdKeySet = metadataStdMap.keySet();
							 Iterator<String> metadataStdIterator = metadataStdKeySet.iterator();
							 while(metadataStdIterator.hasNext()){	                         
								String metadataStdItem = metadataStdIterator.next();
								Integer count = metadataStdMap.get(metadataStdItem);
							%>
							 <li><%=count%> <%=metadataStdItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Text based search on "Content Type"</h3>
							<div>
							<input type="text" name="cntType" style="width: 295px;">
							</div>
							
							<h3 class="title">Content Type :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> cntTypeKeySet = cntTypeMap.keySet();
							 Iterator<String> cntTypeIterator = cntTypeKeySet.iterator();
							 while(cntTypeIterator.hasNext()){	                         
								String cntTypeItem = cntTypeIterator.next();
								Integer count = metadataStdMap.get(cntTypeItem);
							%>
							 <li><%=count%> <%=cntTypeItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Text based search on "Source"</h3>
							<div>
							<input type="text" name="src" style="width: 295px;">
							</div>
							
							<h3 class="title">Source :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> srcKeySet = srcMap.keySet();
							 Iterator<String> srcIterator = srcKeySet.iterator();
							 while(srcIterator.hasNext()){	                         
								String srcItem = srcIterator.next();
								Integer count = srcMap.get(srcItem);
							%>
							 <li><%=count%> <%=srcItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">License URL :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> licenseUrlKeySet = licenseUrlMap.keySet();
							 Iterator<String> licenseUrlIterator = licenseUrlKeySet.iterator();
							 while(licenseUrlIterator.hasNext()){	                         
								String lcnsUrlItem = licenseUrlIterator.next();
								Integer count = licenseUrlMap.get(lcnsUrlItem);
							%>
							 <li><%=count%> <%=lcnsUrlItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Rights (CUI Statement) :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> rightsKeySet = rightsMap.keySet();
							 Iterator<String> rightsIterator = rightsKeySet.iterator();
							 while(rightsIterator.hasNext()){	                         
								String rghtsItem = rightsIterator.next();
								Integer count = rightsMap.get(rghtsItem);
							%>
							 <li><%=count%> <%=rghtsItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Progress Status :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> pgrStatusKeySet = pgrStatusMap.keySet();
							 Iterator<String> pgrStatusIterator = pgrStatusKeySet.iterator();
							 while(pgrStatusIterator.hasNext()){	                         
								String prgrItem = pgrStatusIterator.next();
								Integer count = pgrStatusMap.get(prgrItem);
							%>
							 <li><%=count%> <%=prgrItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Compilation :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> cmplKeySet = cmplMap.keySet();
							 Iterator<String> cmplIterator = cmplKeySet.iterator();
							 while(cmplIterator.hasNext()){	                         
								String cmplItem = cmplIterator.next();
								Integer count = cmplMap.get(cmplItem);
							%>
							 <li><%=count%> <%=cmplItem%></li>
							<% } %>
							 </ul>
							</div>
							
							<h3 class="title">Collection :</h3>							
							<div>
							<ul>
							<%  
	                          Set<String> collKeySet = collMap.keySet();
							 Iterator<String> collIterator = collKeySet.iterator();
							 while(collIterator.hasNext()){	                         
								String collItem = collIterator.next();
								Integer count = collMap.get(collItem);
							%>
							 <li><%=count%> <%=collItem%></li>
							<% } %>
							 </ul>
							</div>
							
						</div>
					</div>


									<div
										style="width: 70%; height: 50%; float: right; padding-top: 25px; margin-left: -14px; border-style: ridge; margin-right: -30px;">
										<!-- main content -->
										<div style="margin-left: 14px;">
											<!-- ios button: show/hide panel -->


											<!-- panel -->


											<!-- items per page dropdown -->
											<div class="jplist-drop-down"
												data-control-type="items-per-page-drop-down"
												data-control-name="paging" data-control-action="paging">

												<ul>
													<li><span data-number="3"> 3 per page </span></li>
													<li><span data-number="5"> 5 per page </span></li>
													<li><span data-number="10" data-default="true">
															10 per page </span></li>
													<li><span data-number="all"> View All </span></li>
												</ul>
											</div>

											<!-- sort dropdown -->
											<div class="jplist-drop-down"
												data-control-type="sort-drop-down" data-control-name="sort"
												data-control-action="sort"
												data-datetime-format="{month}/{day}/{year}">
												<!-- {year}, {month}, {day}, {hour}, {min}, {sec} -->

												<ul>
													<li><span data-path="default">Sort by</span></li>
													<li><span data-path=".title" data-order="asc"
														data-type="text">Title A-Z</span></li>
													<li><span data-path=".title" data-order="desc"
														data-type="text">Title Z-A</span></li>
													<li><span data-path=".desc" data-order="asc"
														data-type="text">Description A-Z</span></li>
													<li><span data-path=".desc" data-order="desc"
														data-type="text">Description Z-A</span></li>
													<li><span data-path=".like" data-order="asc"
														data-type="number" data-default="true">Likes asc</span></li>
													<li><span data-path=".like" data-order="desc"
														data-type="number">Likes desc</span></li>
													<li><span data-path=".date" data-order="asc"
														data-type="datetime">Date asc</span></li>
													<li><span data-path=".date" data-order="desc"
														data-type="datetime">Date desc</span></li>
												</ul>
											</div>

											<!-- filter by title -->
											<div class="text-filter-box">

												<i class="fa fa-search  jplist-icon"></i>

												<!--[if lt IE 10]>
                            <div class="jplist-label">Filter by Title:</div>
                            <![endif]-->

												<input data-path=".title" type="text" value=""
													placeholder="Filter by Title" data-control-type="textbox"
													data-control-name="title-filter"
													data-control-action="filter" />
											</div>

											<!-- pagination results -->
											<div class="jplist-label"
												data-type="Page {current} of {pages}"
												data-control-type="pagination-info"
												data-control-name="paging" data-control-action="paging">
											</div>

											<!-- pagination control -->
											<div class="jplist-pagination" data-control-type="pagination"
												data-control-name="paging" data-control-action="paging">
											</div>
											<div style="padding-top: 14px;">
												<span id="noofresults"><%=arr.length()%> items</span>
											</div>

										</div>

										<!-- data -->
										<div class="list box text-shadow">

											<%for (int i = 0; i < arr.length(); i++) {
                                            JSONObject item = arr.getJSONObject(i);
                                            String title = item.getString("title");
											String owner = item.getString("username");
											String publisher = item.getString("publisher");
											String epaNonepa = item.getString("epapub");
											String source = item.getString("source");
											String sourceUri = item.getString("sourceuri");
											String metStd = item.getString("schema_key");
											String accLvl = item.getString("accesslevel");
											String licenseUrl = item.getString("licenseurl");
											String rights = item.getString("rightsnote");
											String inputDt = item.getString("inputdate");
											String updateDt = item.getString("updatedate");
											String pgrStatus = item.getString("progressstatus");
											String docId = item.getString("docuuid");
											String cmpl = item.getString("cmpparenttitle");
                                            String coll = item.getString("colparenttitle");
											
                                            %>
											<!-- item 1 -->

											<div class="list-item box">
												<!-- data -->

												<div>


													<div class="title"><%=title%></div>


													<table class="table">

														<tbody>
															<tr>
																<td style="border: 0px; width: 30%">Owner</td>
																<td
																	style="border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: solid 1px silver; width: 30%">Publisher</td>
																<td
																	style="border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: solid 1px silver; width: 30%">EPA/Non-EPA
																	status</td>

															</tr>
															<tr>

																<td style="border: 0px; width: 30%"><div
																		class="username"><%=owner%></div></td>
																<td style="border: 0px; width: 30%"><div
																		class="publisher"><%=publisher%></div></td>
																<td style="border: 0px; width: 30%"><div
																		class="epapub"><%=epaNonepa%></div></td>

															</tr>

														</tbody>
													</table>
													<table class="table">
														<thead class="thead-default">
															<tr>
																<th>Source</th>
																<th>Source URI</th>
																<th>Metadata Standard</th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td><div class="source"><%=source%></div></td>
																<td><div class="sourceuri" style="width: 251px;"><%=sourceUri%></div></td>
																<td><div class="schema_key"><%=metStd%></div></td>
															</tr>

														</tbody>
													</table>
													<table class="table">
														<thead class="thead-default">
															<tr>
																<th>Project Open Data Access Level</th>
																<th>License URL</th>
																<th>Rights (CUI Statement)</th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td><div class="accesslevel"><%=accLvl%></div></td>
																<td><div class="licenseurl"><%=licenseUrl%></div></td>
																<td><div class="rightsnote"><%=rights%></div></td>
															</tr>

														</tbody>
													</table>
													<table class="table">
														<thead class="thead-default">
															<tr>
																<th>Input Date</th>
																<th>Update Date</th>
																<th>Progress Status</th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td><div class="inputdate"><%=inputDt%></div></td>
																<td><div class="updatedate"><%=updateDt%></div></td>
																<td><div class="progressstatus"><%=pgrStatus%></div></td>
															</tr>

														</tbody>
													</table>
													<table class="table">
														<thead class="thead-default">
															<tr>
																<th>Document UUID</th>
																<th>Embedded UUID</th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td><div class="docuuid"><%=docId%></div></td>
																<td></td>
															</tr>

														</tbody>
													</table>
													<table class="table">
														<thead class="thead-default">
															<tr>
																<th>Metadata Links (XML/Details)</th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td><a
																	href="javaScript:window.open('<% out.print(resourceLink);%>?id="
																	<%=docId%>&xsl=metadata_to_html_full');">Formatted</a>
																	/<a
																	href="javaScript:window.open('<% out.print(resourceLink);%>?id="<%=docId%>');">XML</a>
																	/<a
																	href="javaScript:window.open('<% out.print(metadataLink);%>?uuid={{.docuuid}}');">Details</a></td>

															</tr>

														</tbody>
													</table>
													<table class="table">
														<thead class="thead-default">
															<tr>
																<th>Compilation</th>
																<th>Collection</th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td><div class="cmpparenttitle"><%=cmpl%></div></td>
																<td><div class="colparenttitle"><%=coll%></div></td>
															</tr>

														</tbody>
													</table>




												</div>


											</div>

											<%}%>

										</div>


										<!--<><><><><><><><><><><><><><><><><><><><><><><><><><> DEMO END <><><><><><><><><><><><><><><><><><><><><><><><><><>-->
									</div>


									<!--googleoff: all-->
				</div>
			</div>
		</div>
	</div>
	</section>
	<nav class="nav simple-nav simple-main-nav" role="navigation">
	<div class="nav__inner">
		<h2 class="element-invisible">Main menu</h2>
		<ul class="menu" role="menu">
			<li class="menu-item" id="menu-learn" role="presentation"><a
				href="https://www.epa.gov/environmental-topics"
				title="Learn about Environmental Topics that EPA covers."
				class="menu-link" role="menuitem">Introduction</a></li>
			<li class="menu-item" id="menu-lawsregs" role="presentation"><a
				href="https://www.epa.gov/laws-regulations"
				title="Laws written by Congress provide the authority for EPA to write regulations. Regulations explain the technical, operational, and legal details necessary to implement laws."
				class="menu-link" role="menuitem">EDG Inventory</a></li>
			<li class="menu-item" id="menu-about" role="presentation"><a
				href="https://www.epa.gov/aboutepa"
				title="Learn more about: our mission and what we do, how we are organized, and our history."
				class="menu-link" role="menuitem">Detailed Inventory</a></li>
		</ul>
	</div>
	</nav>
	<footer class="main-footer clearfix" role="contentinfo">
	<div class="main-footer__inner">
		<div class="region-footer">
			<div class="block block-pane block-pane-epa-global-footer">
				<div class="row cols-3">
					<div class="col size-1of3">
						<div class="col__title">Discover.</div>
						<ul class="menu">
							<li><a href="https://www.epa.gov/accessibility">Accessibility</a></li>
							<li><a
								href="https://www.epa.gov/aboutepa/administrator-gina-mccarthy">EPA
									Administrator</a></li>
							<li><a href="https://www.epa.gov/planandbudget">Budget
									&amp; Performance</a></li>
							<li><a href="https://www.epa.gov/contracts">Contracting</a></li>
							<li><a
								href="https://www.epa.gov/home/grants-and-other-funding-opportunities">Grants</a></li>
							<li><a
								href="https://www.epa.gov/ocr/whistleblower-protections-epa-and-how-they-relate-non-disclosure-agreements-signed-epa-employees">No
									FEAR Act Data</a></li>
							<li><a
								href="https://www.epa.gov/home/privacy-and-security-notice">Privacy
									and Security</a></li>
						</ul>
					</div>
					<div class="col size-1of3">
						<div class="col__title">Connect.</div>
						<ul class="menu">
							<li><a href="https://www.data.gov/">Data.gov</a></li>
							<li><a
								href="https://www.epa.gov/office-inspector-general/about-epas-office-inspector-general">Inspector
									General</a></li>
							<li><a href="https://www.epa.gov/careers">Jobs</a></li>
							<li><a href="https://www.epa.gov/newsroom">Newsroom</a></li>
							<li><a href="https://www.whitehouse.gov/open">Open
									Government</a></li>
							<li><a href="http://www.regulations.gov/">Regulations.gov</a></li>
							<li><a
								href="https://www.epa.gov/newsroom/email-subscriptions">Subscribe</a></li>
							<li><a href="https://www.usa.gov/">USA.gov</a></li>
							<li><a href="https://www.whitehouse.gov/">White House</a></li>
						</ul>
					</div>
					<div class="col size-1of3">
						<div class="col__title">Ask.</div>
						<ul class="menu">
							<li><a href="https://www.epa.gov/home/forms/contact-us">Contact
									Us</a></li>
							<li><a href="https://www.epa.gov/home/epa-hotlines">Hotlines</a></li>
							<li><a href="https://www.epa.gov/foia">FOIA Requests</a></li>
							<li><a
								href="https://www.epa.gov/home/frequent-questions-specific-epa-programstopics">Frequent
									Questions</a></li>
						</ul>
						<div class="col__title">Follow.</div>
						<ul class="social-menu">
							<li><a class="menu-link social-facebook"
								href="https://www.facebook.com/EPA">Facebook</a></li>
							<li><a class="menu-link social-twitter"
								href="https://twitter.com/epa">Twitter</a></li>
							<li><a class="menu-link social-youtube"
								href="https://www.youtube.com/user/USEPAgov">YouTube</a></li>
							<li><a class="menu-link social-flickr"
								href="https://www.flickr.com/photos/usepagov">Flickr</a></li>
							<li><a class="menu-link social-instagram"
								href="https://instagram.com/epagov">Instagram</a></li>
						</ul>
						<p class="last-updated">{LAST UPDATED DATE}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</footer>
	<script
		src="https://www.epa.gov/sites/all/libraries/template2/jquery.js"></script>
	<script src="https://www.epa.gov/sites/all/libraries/template2/js.js"></script>
	<script
		src="https://www.epa.gov/sites/all/modules/custom/epa_core/js/alert.js"></script>
	<!--[if lt IE 9]><script src="https://www.epa.gov/sites/all/themes/epa/js/ie.js"></script><![endif]-->
	<!-- REMOVE if not using -->

	<script src="javaScripts/external/jquery/jquery.js"></script>
	<script src="javaScripts/jquery-ui.js"></script>
	<script data-main="javaScripts/app" src="javaScripts/lib/require.js"></script>
	<script>
		function myfun() {
			document.getElementById("anytext").setAttribute("data-path",document.getElementById("sel").value);
		}

		$("#accordion").accordion({
			collapsible : true
		});

		$('document').ready(function() {

			$('#demo').jplist({
				itemsBox : '.list',
				itemPath : '.list-item',
				panelPath : '.jplist-panel'
			});
		});
	</script>

</body>
</html>