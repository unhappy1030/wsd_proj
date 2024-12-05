<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="p" class="org.example.wsd22.bean.Post"/>
<jsp:setProperty name="p" property="*"/>
<%
  PostDao postDao = new PostDao();
  int i = postDao.insertPost(p);
  String msg = "Insert Success!";
  if(i == 0) msg = "Insert ERROR!";
%>

<script>
  alert('<%=msg%>');
  location.href = 'list.jsp';
</script>