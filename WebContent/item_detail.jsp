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

  <form action="#" method="post">
    <input type="hidden" name="itemId" value="${item.id}">
	<div class="row">
	  <div class="col-xs-offset-2 col-xs-8">
	    <h3 class="text-center">商品詳細</h3>
		<div class="row">
		  <div class="col-xs-5">
		    <img src="img/${item.imagePath}" class="img-responsive img-rounded">
		  </div>
		  <div class="col-xs-5">
		    <div class="bs-component">
			  <h4>${item.name}</h4><br><br>
			  <p>${item.description}</p>
			</div>
		  </div>
		 </div><br>
		 <div class="row">
		   <div class="col-xs-offset-2 col-xs-8">
		     <div class="form-group">
			   <div class="row">
			     <div class="col-sm-12">
				   <label for="inputResponsibleCompany">サイズ</label>
				 </div>
				 <div class="col-sm-12">
				   <label class="radio-inline">
				     <input type="radio" class="inputSize" name="size" checked="checked" value="M">
					 <span class="price">&nbsp;М&nbsp;</span>&nbsp;&nbsp;<span id="sizeM">${item.priceM}</span>円(税抜)
				   </label>
				   <label class="radio-inline">
				     <input type="radio" class="inputSize" name="size" value="L">
					 <span class="price">&nbsp;Ｌ</span>&nbsp;&nbsp;<span id="sizeL">${item.priceL}</span>円(税抜)
				   </label>
			  	 </div>
			   </div>
			 </div>
		   </div>
		 </div><br>
		 <div class="row">
		   <div class="col-xs-offset-2 col-xs-8">
		     <div class="form-group">
			   <div class="row">
			     <div class="col-sm-12">
				   <label for="inputResponsibleCompany">トッピング：&nbsp;1つにつき
				     <span>&nbsp;М&nbsp;</span>&nbsp;&nbsp;200円(税抜)
					 <span>&nbsp;Ｌ</span>&nbsp;&nbsp;300円(税抜)
				   </label>
				 </div>
			   <div class="col-sm-12">
			     <c:forEach var="topping" items="${item.toppingList}">
			       <label class="checkbox-inline">
 				     <input class="inputTopping" type="checkbox" name="orderToppingList" value="${topping.id}">
 				       <span>${topping.name}</span>
				   </label>
			     </c:forEach>
			   </div>
			 </div>
		   </div>
		 </div>
	   </div>
	   <div class="row">
	     <div class="col-xs-offset-2 col-xs-8">
		   <div class="form-group">
		     <div class="row">
			   <div class="col-xs-5 col-sm-5">
			     <label for="">数量:</label>
				 <label class="control-label" style="color: red" for="inputError">数量を選択してください</label> 
				 <select id="inputQuantity" name="quantity" class="form-control">
				   <option value="1">1</option>
				   <option value="2">2</option>
				   <option value="3">3</option>
				   <option value="4">4</option>
				   <option value="5">5</option>
				 </select>
			   </div>
		     </div>
		   </div>
		 </div>
	   </div>
	   <br>
	   <div class="row">
	     <div class="col-xs-offset-2 col-xs-10">
		   <div class="form-group">
		     <span>この商品金額：<span id="total-price">38,000</span>円(税抜)</span>
		   </div>
		  </div>
	    </div>
		<div class="row">
		  <div class="col-xs-offset-2 col-xs-3">
		    <div class="form-group">
			<p><input class="form-control btn btn-warning btn-block" type="submit" value="カートに入れる"></p>
		    </div>
		  </div>
		</div>
	  </div>
    </div>
  </form>

	</div>
	<!-- end container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/calc_total_price.js"></script>
</body>
</html>