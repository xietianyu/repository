<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="author" content="Robin Liu">
    <meta http-equiv="Cache-Control" content="max-age=0">
    
    <title>TES 易学管理平台</title>
    
    <link rel="icon" href="../../favicon.ico">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/index.css" rel="stylesheet">
    <!-- font-awesome -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="js/common/jquery-1.11.3.min.js"></script>
    <script src="js/common/jquery.pin.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="js/common/bootstrap.min.js"></script>
    <!-- chart -->
    <script src="js/common/Chart.min.js"></script>
    
    <!-- 处理页面公共逻辑 -->
    <script src="js/basepath.js"></script>
    <script src="js/local.js"></script>
    <script src="js/common.js"></script>
    
  </head>

  <body>
  	<!-- 工具栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" id="header">
		<!-- 远程加载header.html至此 -->
	</nav>
   	
	<!-- 消息 -->
	<div class="modal fade bs-example-modal-lg" id="message_dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<!-- 远程加载message.html至此 -->
	</div>
	
	<!-- 修改密码 -->
	<div class="modal fade" id="editPasswd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<!-- 远程加载edit_pwd.html至此 -->
	</div>
  
    <div class="container-fluid">
		<div class="row">
			<!-- 导航栏 -->
			<div class="col-sm-3 col-md-2 sidebar" id="siderbar">
				<!-- 远程加载nav.html至此 -->
				<jsp:include page="page/nav.jsp"></jsp:include>
			</div>
			<!--  正文 -->
		    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="main">
		    	<!-- 远程加载main.html至此 -->
		    </div>
		</div>    
    </div>

  </body>
</html>