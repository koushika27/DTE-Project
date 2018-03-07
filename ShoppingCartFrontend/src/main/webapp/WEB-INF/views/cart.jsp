<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/basicStyles.css">
<title>Cart Page</title>
<style>
	.panel-success>.panel-heading {
	    font-weight: bold;
	    color: #ffffff;
	    background-color: #5cb85c;
	    border-color: #4cae4c;
	}
	.tableTextvAlign {
	vertical-align:middle!important;
	}
</style>
</head>
<body class="bg">
	<div class="container">
	<div class="panel panel-success">
		<div class="panel-heading">
        	<div class="panel-title">Your Cart</div>
        </div>
		<c:url value="/confirmOrder" var="actionString"></c:url>
		<form:form action="${actionString}">
			<table class="table table-hover table-condensed" style="width: 90%;">				
				<c:forEach items="${cartList}" var="cart">
					<c:set var = "productIdFromCart" value = "${cart.productId}"/>
					<c:forEach items="${productDetails}" var="prod">
						<c:set var = "productIdFromProductList" value = "${prod.key}"/>
						<c:if test="${productIdFromCart==productIdFromProductList}">
							<c:set var="productName" value="${prod.value}" />
						</c:if>
					</c:forEach>
					<tr align="center">
						<td class="tableTextvAlign" rowspan="5">
							<img src="<c:url value="/resources/images/${cart.productId}.jpg"/>" alt="ProductImage" width="100" height="150"/>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2"><b>${productName}</b></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td><b>${cart.quantity}</b></td>
					</tr>
					<tr>
						<td>Sub Total</td>
						<td><b>Rs.${cart.subTotal}</b></td>
					</tr>
					<tr>
					<c:url value="/editCart/${cart.cartItemId}" var="editString"></c:url>
					<c:url value="/deleteCart/${cart.cartItemId}" var="deleteString"></c:url>
					<td colspan="2" align="center"><a href="${editString}" class="btn btn-success" role="button">Edit Cart</a>&nbsp;&nbsp;<a href="${deleteString}" class="btn btn-warning" role="button">Remove from cart</a></td>
					</tr>
				</c:forEach>
					<tr align="right">
					<td colspan="3" align="right"><input type="button" value="Proceed to checkout" class="btn btn-lg btn-primary"/></td>
					</tr>
			</table>
		</form:form>
	</div>
	</div>
</body>
</html>