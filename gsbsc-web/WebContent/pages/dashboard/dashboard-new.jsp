<%@page import="com.netsteadfast.greenstep.base.Constants"%>
<%@page import="com.netsteadfast.greenstep.util.ApplicationSiteUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="gs" uri="http://www.gsweb.org/controller/tag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String mainSysBasePath = ApplicationSiteUtils.getBasePath(Constants.getMainSystem(), request);

%>
<!doctype html>
<html itemscope="itemscope" itemtype="http://schema.org/WebPage">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <base href="<%=basePath%>">
    
    <title>bambooCORE</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="bambooCORE">
	<meta http-equiv="description" content="bambooCORE">
	
<style type="text/css">

.btnExcelIcon {
  	background-image: url(./icons/excel.png);
  	background-repeat: no-repeat;
  	width: 16px;
  	height: 16px;
  	text-align: center;
}

.btnPdfIcon {
  	background-image: url(./icons/application-pdf.png);
  	background-repeat: no-repeat;
  	width: 16px;
  	height: 16px;
  	text-align: center;
}

</style>

<script type="text/javascript">

var BSC_PROG003D0009Q_fieldsId = new Object();
BSC_PROG003D0009Q_fieldsId['visionOid'] 					= 'BSC_PROG003D0009Q_visionOid';
BSC_PROG003D0009Q_fieldsId['frequency'] 					= 'BSC_PROG003D0009Q_frequency';
BSC_PROG003D0009Q_fieldsId['startYearDate'] 				= 'BSC_PROG003D0009Q_startYearDate';
BSC_PROG003D0009Q_fieldsId['endYearDate'] 					= 'BSC_PROG003D0009Q_endYearDate';
BSC_PROG003D0009Q_fieldsId['startDate'] 					= 'BSC_PROG003D0009Q_startDate';
BSC_PROG003D0009Q_fieldsId['endDate'] 						= 'BSC_PROG003D0009Q_endDate';
BSC_PROG003D0009Q_fieldsId['measureDataOrganizationOid'] 	= 'BSC_PROG003D0009Q_measureDataOrganizationOid';
BSC_PROG003D0009Q_fieldsId['measureDataEmployeeOid'] 		= 'BSC_PROG003D0009Q_measureDataEmployeeOid';

function BSC_PROG003D0009Q_query() {
	BSC_PROG003D0009Q_clearContent();
	setFieldsBackgroundDefault(BSC_PROG003D0009Q_fieldsId);
	setFieldsNoticeMessageLabelDefault(BSC_PROG003D0009Q_fieldsId);
	xhrSendParameter(
			'${basePath}/bsc.kpiReportContentQueryAction.action', 
			{ 
				'fields.visionOid' 					: 	dijit.byId("BSC_PROG003D0009Q_visionOid").get("value"),
				'fields.startYearDate'				:	dijit.byId("BSC_PROG003D0009Q_startYearDate").get('displayedValue'),
				'fields.endYearDate'				:	dijit.byId("BSC_PROG003D0009Q_endYearDate").get('displayedValue'),
				'fields.startDate'					:	dijit.byId("BSC_PROG003D0009Q_startDate").get('displayedValue'),
				'fields.endDate'					:	dijit.byId("BSC_PROG003D0009Q_endDate").get('displayedValue'),
				'fields.dataFor'					:	dijit.byId("BSC_PROG003D0009Q_dataFor").get("value"),
				'fields.measureDataOrganizationOid'	:	dijit.byId("BSC_PROG003D0009Q_measureDataOrganizationOid").get("value"),
				'fields.measureDataEmployeeOid'		:	dijit.byId("BSC_PROG003D0009Q_measureDataEmployeeOid").get("value"),
				'fields.frequency'					:	dijit.byId("BSC_PROG003D0009Q_frequency").get("value")
			}, 
			'json', 
			_gscore_dojo_ajax_timeout,
			_gscore_dojo_ajax_sync, 
			true, 
			function(data) {
				if ('Y' != data.success) {
					setFieldsBackgroundAlert(data.fieldsId, BSC_PROG003D0009Q_fieldsId);
					setFieldsNoticeMessageLabel(data.fieldsId, data.fieldsMessage, BSC_PROG003D0009Q_fieldsId);
					alertDialog(_getApplicationProgramNameById('${programId}'), data.message, function(){}, data.success);
					return;
				}
				/*
				BSC_PROG003D0009Q_showTables( data );
				BSC_PROG003D0009Q_showKpisBarCharts( data );
				BSC_PROG003D0009Q_showKpisMeterGauge( data );
				*/
			}, 
			function(error) {
				alert(error);
			}
	);	
}


function BSC_PROG003D0009Q_setDataForValue() {
	dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set("value", _gscore_please_select_id);
	dijit.byId('BSC_PROG003D0009Q_measureDataEmployeeOid').set("value", _gscore_please_select_id);	
	dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set('readOnly', true);
	dijit.byId('BSC_PROG003D0009Q_measureDataEmployeeOid').set('readOnly', true);
	var dataFor = dijit.byId("BSC_PROG003D0009Q_dataFor").get("value");
	if ('employee' == dataFor) {
		dijit.byId('BSC_PROG003D0009Q_measureDataEmployeeOid').set('readOnly', false);
	}
	if ('organization' == dataFor) {
		dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set('readOnly', false);
	}	
}

function BSC_PROG003D0009Q_setMeasureDataOrgaValue() {
	var dataFor = dijit.byId("BSC_PROG003D0009Q_dataFor").get("value");
	if ('all' == dataFor || 'employee' == dataFor) {
		dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set("value", _gscore_please_select_id);
	}
}

function BSC_PROG003D0009Q_setMeasureDataEmplValue() {
	var dataFor = dijit.byId("BSC_PROG003D0009Q_dataFor").get("value");
	if ('all' == dataFor || 'organization' == dataFor) {
		dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set("value", _gscore_please_select_id);
	}	
}

function BSC_PROG003D0009Q_setFrequencyValue() {
	var frequency = dijit.byId("BSC_PROG003D0009Q_frequency").get("value");
	dijit.byId("BSC_PROG003D0009Q_startYearDate").set("readOnly", true);
	dijit.byId("BSC_PROG003D0009Q_endYearDate").set("readOnly", true);
	dijit.byId("BSC_PROG003D0009Q_startDate").set("readOnly", true);
	dijit.byId("BSC_PROG003D0009Q_endDate").set("readOnly", true);
	if ( frequency == _gscore_please_select_id ) {
		return;
	}
	if ('1' == frequency || '2' == frequency || '3' == frequency) { // day, week, month
		dijit.byId("BSC_PROG003D0009Q_startDate").set("readOnly", false);
		dijit.byId("BSC_PROG003D0009Q_endDate").set("readOnly", false);		
	} else { // quarter, half-year, year
		dijit.byId("BSC_PROG003D0009Q_startYearDate").set("readOnly", false);
		dijit.byId("BSC_PROG003D0009Q_endYearDate").set("readOnly", false);				
	}
}


function BSC_PROG003D0009Q_clearContent() {
	
}

function BSC_PROG003D0009Q_parseScore( score ) {
	var scoreStr = viewPage.roundFloat(score, 2) + '';
	scoreStr = scoreStr.replace('.00', '');
	return scoreStr;
}

//------------------------------------------------------------------------------
function ${programId}_page_message() {
	var pageMessage='<s:property value="pageMessage" escapeJavaScript="true"/>';
	if (null!=pageMessage && ''!=pageMessage && ' '!=pageMessage) {
		alert(pageMessage);
	}	
}
//------------------------------------------------------------------------------

</script>

</head>

<body class="flat">

	<gs:toolBar
		id="${programId}" 
		cancelEnable="Y" 
		cancelJsMethod="${programId}_TabClose();" 
		createNewEnable="N"
		createNewJsMethod=""		 
		saveEnabel="N" 
		saveJsMethod=""
		refreshEnable="Y" 		 
		refreshJsMethod="${programId}_TabRefresh();" 		
		></gs:toolBar>
	<jsp:include page="../header.jsp"></jsp:include>	
	
	<table border="0" width="100%" >
		<tr valign="top">
			<td width="100%" align="center" height="35%">
				<div data-dojo-type="dijit.TitlePane" data-dojo-props="title: '<s:property value="getText('BSC_PROG003D0006Q_options')" escapeJavaScript="true"/>' " >						
					<div dojoType="dijit.layout.ContentPane" region="left" splitter="false" style="width:99%;height:145px">
					
						<table border="0" width="100%" >
							<tr valign="top">
								<td width="100%" align="left" height="25px" style="border:1px #ebeadb solid; border-radius: 5px; background: linear-gradient(to top, #f1eee5 , #fafafa);">	
								
									<button id="BSC_PROG003D0009Q_btnQuery" data-dojo-type="dijit.form.Button"
										data-dojo-props="
											iconClass:'dijitIconSearch',
											showLabel:false,
											onClick:function(){  
												BSC_PROG003D0009Q_query();
											}"><s:property value="getText('BSC_PROG003D0006Q_btnQuery')"/></button>										
									
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_visionOid"></gs:inputfieldNoticeMsgLabel>
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_frequency"></gs:inputfieldNoticeMsgLabel>
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_startYearDate"></gs:inputfieldNoticeMsgLabel>
									<!-- 
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_endYearDate"></gs:inputfieldNoticeMsgLabel>
									-->
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_startDate"></gs:inputfieldNoticeMsgLabel>
									<!--  
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_endDate"></gs:inputfieldNoticeMsgLabel>
									-->
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_measureDataOrganizationOid"></gs:inputfieldNoticeMsgLabel>
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_measureDataEmployeeOid"></gs:inputfieldNoticeMsgLabel>
											
								</td>
							</tr>
							<tr valign="top">
								<td width="100%" align="left" height="25px">	
								
									<s:property value="getText('BSC_PROG003D0006Q_visionOid')"/>
									<gs:select name="BSC_PROG003D0009Q_visionOid" dataSource="visionMap" id="BSC_PROG003D0009Q_visionOid"></gs:select>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_visionOid'">
					    				Select vision.
									</div>  									
						    		&nbsp;		    			
					    																	
									<s:property value="getText('BSC_PROG003D0006Q_frequency')"/>
									<gs:select name="BSC_PROG003D0009Q_frequency" dataSource="frequencyMap" id="BSC_PROG003D0009Q_frequency" value="6" width="140" onChange="BSC_PROG003D0009Q_setFrequencyValue();"></gs:select>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_frequency'">
					    				Select frequency.
									</div> 										
									&nbsp;
																	
								</td>											
							</tr>	
							<tr valign="top">
								<td width="100%" align="left" height="25px">
								
							    	<s:property value="getText('BSC_PROG003D0006Q_startYearDate')"/>
							    	<input id="BSC_PROG003D0009Q_startYearDate" name="BSC_PROG003D0009Q_startYearDate" data-dojo-type="dojox.form.YearTextBox" 
							    		maxlength="4"  type="text" data-dojo-props='style:"width: 80px;" ' />
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_startYearDate'">
					    				Select start year.
									</div>									    				
							    	&nbsp;
							    	<s:property value="getText('BSC_PROG003D0006Q_endYearDate')"/>
							    	<input id="BSC_PROG003D0009Q_endYearDate" name="BSC_PROG003D0009Q_endYearDate" data-dojo-type="dojox.form.YearTextBox" 
							    		maxlength="4"  type="text" data-dojo-props='style:"width: 80px;" ' />
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_endYearDate'">
					    				Select end year.
									</div>																		    									    							
							    	&nbsp;&nbsp;		
									<s:property value="getText('BSC_PROG003D0006Q_startDate')"/>
									<input id="BSC_PROG003D0009Q_startDate" type="text" name="BSC_PROG003D0009Q_startDate" data-dojo-type="dijit.form.DateTextBox"
										maxlength="10" 
										constraints="{datePattern:'yyyy/MM/dd', selector:'date' }" style="width:120px;" readonly />
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_startDate'">
					    				Select start date.
									</div>												
									&nbsp;						
									<s:property value="getText('BSC_PROG003D0006Q_endDate')"/>
									<input id="BSC_PROG003D0009Q_endDate" type="text" name="BSC_PROG003D0009Q_endDate" data-dojo-type="dijit.form.DateTextBox"
										maxlength="10" 
										constraints="{datePattern:'yyyy/MM/dd', selector:'date' }" style="width:120px;" readonly />																	    									    	
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_endDate'">
					    				Select end date.
									</div>									    										    														    										
								</td>
							</tr>															
							<tr valign="top">
								<td width="100%" align="left" height="25px">							
									<s:property value="getText('BSC_PROG003D0006Q_dataFor')"/>
									<gs:select name="BSC_PROG003D0009Q_dataFor" dataSource="{ \"all\":\"All\", \"organization\":\"${action.getText('BSC_PROG003D0006Q_measureDataOrganizationOid')}\", \"employee\":\"${action.getText('BSC_PROG003D0006Q_measureDataEmployeeOid')}\" }" id="BSC_PROG003D0009Q_dataFor" onChange="BSC_PROG003D0009Q_setDataForValue();" width="140"></gs:select>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_dataFor'">
					    				Select measure data type.
									</div>											
									&nbsp;&nbsp;
									<s:property value="getText('BSC_PROG003D0006Q_measureDataOrganizationOid')"/>
									<gs:select name="BSC_PROG003D0009Q_measureDataOrganizationOid" dataSource="measureDataOrganizationMap" id="BSC_PROG003D0009Q_measureDataOrganizationOid" onChange="BSC_PROG003D0009Q_setMeasureDataOrgaValue();" readonly="Y"></gs:select>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_measureDataOrganizationOid'">
					    				Select measure data organization/department.
									</div>											
									&nbsp;&nbsp;
									<s:property value="getText('BSC_PROG003D0006Q_measureDataEmployeeOid')"/>
									<gs:select name="BSC_PROG003D0009Q_measureDataEmployeeOid" dataSource="measureDataEmployeeMap" id="BSC_PROG003D0009Q_measureDataEmployeeOid" onChange="BSC_PROG003D0009Q_setMeasureDataEmplValue();" readonly="Y"></gs:select>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_measureDataEmployeeOid'">
					    				Select measure data personal/Employee.
									</div>										
								</td>
							</tr>								
							
														
						</table>										
					
					</div>
				</div>
			</td>
		</tr>
	</table>	
	

	<!-- chart div put this -->
	
<script type="text/javascript">${programId}_page_message();</script>	
</body>
</html>

	