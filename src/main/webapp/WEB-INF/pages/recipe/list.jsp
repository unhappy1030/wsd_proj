<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recipes</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h1 class="mb-4">Recipes</h1>
  <div class="row">
    <c:forEach var="recipe" items="${recipes}">
      <div class="col-md-4">
        <div class="card mb-4">
          <img src="${recipe['ATT_FILE_NO_MAIN']}" class="card-img-top" alt="${recipe['RCP_NM']}">
          <div class="card-body">
            <h5 class="card-title">${recipe['RCP_NM']}</h5>
            <p class="card-text">${recipe['RCP_PARTS_DTLS']}</p>
            <a href="#" class="btn btn-primary">Details</a>
            <a href="edit?rcp_seq=${recipe['RCP_SEQ']}" class="btn btn-secondary">Custom</a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
