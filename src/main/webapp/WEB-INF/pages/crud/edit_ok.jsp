<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.wsd22.dao.PostDao" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="p" class="org.example.wsd22.bean.Post"/>
<jsp:setProperty name="p" property="*"/>
<%
  PostDao postDao = new PostDao();
  int i = postDao.updatePost(p);
  String msg = "update Success!";
  if(i == 0) msg = "update ERROR!";
%>

<script>
  alert('<%=msg%>');
  location.href = 'list.jsp';
</script>