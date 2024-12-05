<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.wsd22.dao.PostDao" %>
<%@ page import="org.example.wsd22.bean.Post" %>
<%
  // 삭제할 게시물의 ID를 가져옴
  String id = request.getParameter("id");
  int postId = Integer.parseInt(id);

  // PostDao를 통해 삭제 작업 수행
  PostDao postDao = new PostDao();
  postDao.deletePost(postId); // ID를 이용해 게시물 삭제
%>

<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시물 삭제</title>
</head>
<body>
<script>
  alert("ID <%= id %>인 게시물이 성공적으로 삭제되었습니다.");
  window.location.href = "list.jsp"; // 홈으로 자동 이동
</script>
</body>
</html>
