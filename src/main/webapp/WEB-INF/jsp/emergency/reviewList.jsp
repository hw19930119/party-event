<!--
 版权所有：厦门畅享信息技术有限公司
 Copyright 2014 Xiamen Sunsharing Information CO., LTD.
 All right reserved. 
====================================================
 文件名称: text.html
 修订记录：
 No    日期				作者(操作:具体内容)
 1.    14-10-29			Administrator(创建:创建文件)
====================================================
 文件描述：(说明本文件需要实现的内容)
 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<meta charset=utf-8>
<html lang="zh-cn">
<head>
<title>应急信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/lib/bootstrap/css/bootstrap.min.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/lib/select2-4.0.2/dist/css/select2.min.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/sslib/qlTree/qlTree.css"/>" />
<link type="text/css" rel="stylesheet" 
	href="<c:url value="/lib/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/styles/css/base.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/styles/css/nineModules.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/styles/css/listpage.css"/>" />

<script type="text/javascript"
	src="<c:url value="/lib/jquery-1.9.1/jquery-1.9.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/lib/bootstrap/js/bootstrap.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/lib/select2-4.0.2/dist/js/select2.full.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/lib/artTemplate/template-simple.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/sslib/ulynlist/ulynlist.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/sslib/ulynlist/ulynlist.table.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/sslib/ulynlist/ulynlist.pagebar.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/sslib/qlTree/qlTree.js"/>"></script>
<%-- <script src="<c:url value="/lib/layer/layer.min.js"/>"></script> --%>
<script src="<c:url value="/lib/layer-3.1.1/dist/layer.js"/>"></script>
 <script type="text/javascript" 
 	src="<c:url value="/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/lib/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"/>"></script>
<style>
body #s2id_type .select2-choice {
	height: 30px;
	line-height: 30px;
	width: 318px;
}
</style>
<script src="<c:url value="/lib/My97DatePicker/WdatePicker.js"/>"
	charset="gb2312"></script>
</head>
<script>
	var contextPath = "<%=(request.getContextPath())%>";
	var ulynlistPath = {
		basePath : '<c:url value="/sslib/ulynlist"/>',
		url : '<c:url value="/emergency/review_list.do"/>',
		typelist:[]
	}
	var config = {
		detailurl : '<c:url value="/emergency/detail.do"/>',
		exportUrl : '<c:url value="/emergency/export.do"/>'
	}

	<c:forEach items="${typelist }" var="type_item">
	ulynlistPath.typelist.push({id:"${type_item.TYPE_ID}",name:"${type_item.TYPE_NAME}"});
	</c:forEach>
	
	layer.config({
        extend: 'lx/style.css', //加载您的扩展样式
        skin: 'layer-ext-lx'
    });
	</script>
<style>
.jgxz {
	font-weight: bold;;
	color: #357ebd;
}
</style>
<jsp:include page="../include/listMenu.jsp"></jsp:include>
<body>
	<div class="content-box">
	   <%--  <div class="cb-sidebar ${visiteditem}">
        <div id="qlTree"></div>
    	</div> --%>
		<div class="cb-content" <%-- <c:if test="${visiteditem eq 'hide'}"> --%>style="margin-left: 0px"<%-- </c:if> --%>>
			<div class="content">
				<div class="mainContent" style="top: 0px">
					<div class="mcBox">
						<jsp:include page="../include/emergencyReview.jsp"></jsp:include>
						<div class="dwBottom">
							<!-- <div class="TableToolDiv clearfix">
								<div class="btnDiv" id="jgxz">
									共有<span id="allcount" class="jgxz"></span>条信息

								</div>
								<div class="btnFunction">
									<a href="javascript:void(0)" onclick="gomap()">
										<button class="btnMap" type="btnMap"></button>
									</a>
									<button class="btnTable btnTableActive" type="btnTable"></button>

								</div>
							</div> -->
							<div class="table-title">
		                		<b>查询结果</b>
		                		<%-- <div class="title-right">
		                			<button data-url="<c:url value="/info/news_edit.do"/>" type="button" class="title-btn" id="add-news" ptype="button">
		                			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		                			</button>       		
		                		</div> --%>
		                	</div>
							<!-- <div class="table-content">
		                    <div id="ulyn-table-id" style=""></div>
		                    <div id="ulyn-pageBar-id"></div>
		                </div> -->
							<div class="ulynTab">
								<div id="dwTab"></div>
								<div id="dwPager"></div>
							</div>
							<!-- 地图模式 -->
							<!-- <div class="mapMs clearfix">
								<div class="mapList"></div>
								<div class="mapHere clearfix"></div>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<c:url value="/js/page_js/emergencyReview.js"/>"></script>
<%-- <script src="<c:url value="/js/page_js/fire.js"/>"></script> --%>
<script>
	$(document).ready(function() {
		$(".select2").select2();
	});
	function gomap() {
		// 	var data='';
		// 	data += "status="+$("#status").val();
		// 	data += "&street="+$("#street").val();
		// 	data += "&type="+$("#type").val();
		// 	data += "&startTime="+$("#startTime").val();
		// 	data += "&endTime="+$("#endTime").val();
		// 	data += "&userName="+$("#userName").val();
		// 	window.location.href = '<c:url value="/fire/listMap.do?'+data+'"/>';
		$("#search-form").attr("action",
				'<c:url value="/emergency/listMap.do"/>');
		$("#search-form").submit();
	}
	function changevalue(obj, id) {
		$(obj).parent().find('.all-style').removeClass('all-style');
		$(obj).addClass("all-style");
		$("#" + id).val($(obj).attr("id"));
	}
</script>
</html>