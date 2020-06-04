<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, controller.*, domain.*"%>
<!-- ブラウザの文字化けを防ぐために追加 -->
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ラクラクカリー</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/piza.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
  <div class="container">
    <!-- navigation -->
    <nav class="navbar navbar-default">
	<div class="container-fluid">
	  <!-- Brand and toggle get grouped for better mobile display -->
	  <div class="navbar-header">
	    <button type="button" class="navbar-toggle collapsed"
		data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		  <span class="sr-only">Toggle navigation</span> 
		  <span class="icon-bar"></span> 
		  <span class="icon-bar"></span> 
		  <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"> 
		  <!-- 企業ロゴ -->
		  <img alt="main log" src="img/header_logo.png" height="35">
		</a>
	  </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
	  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    <p class="navbar-text navbar-right">
	      <a href="/show-cart" class="navbar-link">ショッピングカート</a>&nbsp;&nbsp; 
	      <a href="/show-order-history" class="navbar-link">注文履歴</a>&nbsp;&nbsp; 
	      <a href="/tologin" class="navbar-link">ログイン</a>&nbsp;&nbsp; 
	      <a href="/logout" class="navbar-link">ログアウト</a>
	    </p>
	  </div>
	<!-- /.navbar-collapse -->
	</div>
  <!-- /.container-fluid -->
  </nav>

  <!-- search form -->
  <div class="row">
    <div class="col-lg-offset-3 col-lg-6 col-md-offset-2 col-md-8 col-sm-10 col-xs-12">
	  <div class="panel panel-default">
	    <div class="panel-heading">
		  <div class="panel-title">商品を検索する</div>
		</div>
		<div class="panel-body">
		  <form method="post" action="#" class="form-horizontal">
		    <div class="form-group">
			  <label for="code" class="control-label col-sm-2">商品名</label>
			    <div class="col-sm-9">
				  <input type="text" name="name" id="autocomplete" class="form-control input-sm">
				</div>
			</div>
			<div class="text-center">
			  <button type="submit" value="検索" class="btn btn-primary">検索</button>
			  <button type="reset" value="クリア" class="btn btn-default">クリア</button>
			</div>
		  </form>
		</div>
	  </div>
    </div>
  </div>

  <!-- table -->
  <div class="row">
    <div class="table-responsive col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-10 col-xs-12">
	  <table class="table table-striped">
	    <tbody>
	  　　<!-- forEach処理 -->
	     <c:forEach var="threeItemList" items="${itemList}">
  	       <tr>
  	         <c:forEach var="item" items="${threeItemList}">
	  	       <!-- リンクの設定 -->
  	 	       <c:url var="detailLink" value="ShowItemDetailControllerServlet">
	             <c:param name="itemId" value="${item.id}"/>
	           </c:url>
	           
	           <th>
	             <a href="${detailLink}"><img src="img/${item.imagePath}" class="img-responsive img-rounded" width="200" height="600">
				 </a><br>
				 <a href="${detailLink}">${item.name}</a><br>
				  <span class="price">&nbsp;М&nbsp;</span>&nbsp;&nbsp;
				  <span>${item.priceM}</span>円(税抜)<br>
				  <span>${item.priceL}</span>円(税抜)<br>
	           </th>
  	         </c:forEach>
  	       </tr>
	     </c:forEach>
	   </tbody>
	 </table>
    </div>
  </div>
  </div>
<!-- end container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>
