<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	if(parent.$("tbody tr").size() >= 1)
	{
		parent.$("tbody").empty();
	}
	parent.$("tbody").append("${orderList}");
</script>