<%--
  Created by IntelliJ IDEA.
  User: white
  Date: 24. 12. 5.
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recipe List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .recipe-card img {
      height: 200px;
      object-fit: cover;
    }
    .recipe-card {
      min-height: 350px;
    }
  </style>
</head>
<body class="bg-dark text-light">
<div class="container my-5">
  <h1 class="text-center mb-4">Recipe List</h1>
  <div id="recipeList" class="row g-4">
  </div>
</div>

<script>
  // Sample API URL
  const API_URL = 'http://openapi.foodsafetykorea.go.kr/api/3649564af8f14222a7d2/COOKRCP01/json/1/5';

  // Fetch data from API
  async function fetchRecipes() {
    try {
      const response = await fetch(API_URL);
      const data = await response.json();
      const recipes = data.COOKRCP01.row;
      displayRecipes(recipes);
    } catch (error) {
      console.error('Error fetching recipes:', error);
    }
  }

  // Display recipes as Bootstrap cards
  function displayRecipes(recipes) {
    const recipeList = document.getElementById('recipeList');
    recipeList.innerHTML = recipes.map(recipe => `
                <div class="col-md-4">
                    <div class="card bg-light text-dark recipe-card">
                        <img src="${recipe.ATT_FILE_NO_MAIN}" class="card-img-top" alt="${recipe.RCP_NM}">
                        <div class="card-body">
                            <h5 class="card-title">${recipe.RCP_NM}</h5>
                            <p class="card-text">
                                <strong>Cooking Method:</strong> ${recipe.RCP_WAY2 || 'N/A'}<br>
                                <strong>Type:</strong> ${recipe.RCP_PAT2 || 'N/A'}<br>
                                <strong>Calories:</strong> ${recipe.INFO_ENG || 'N/A'} kcal
                            </p>
                            <a href="#" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
            `).join('');
  }

  // Initialize
  fetchRecipes();
</script>
</body>
</html>
