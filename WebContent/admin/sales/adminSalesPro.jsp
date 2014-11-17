<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	if(parent.$("#tb tr").size() >= 1)
	{
		parent.$("#tb").empty();
	}
	parent.$("#tb").append("${orderList}");
	parent.document.getElementById("price").innerHTML = "<strong>${tPriceString}</strong>";
	parent.document.getElementById("count").innerHTML = "<strong>${tCountString}</strong>";
</script>