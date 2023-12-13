<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestion des Villes</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 20px;
}

form {
	margin: 0 auto;
	text-align: center;
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form input[type="text"] {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

form .btn-primary {
	background-color: #8e44ad;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

h1 {
	color: #333;
	text-align: center;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:hover {
	background-color: #f5f5f5;
}

label {
	display: block;
	margin-bottom: 8px;
}

.btn {
	padding: 6px 12px;
	margin-right: 5px;
	text-decoration: none;
	color: #fff;
	border-radius: 3px;
	cursor: pointer;
}

.btn-primary {
	background-color: #8e44ad;
}

.btn-danger {
	background-color: #c0392b;
}
</style>
</head>

<body>
	<header>
		<h1>Gestion des Villes</h1>
	</header>

	<form class="custom_class mb-4" action="VilleController" method="post"
		class="form-inline inline-form">
		<div class="form-group mr-2">
			<label for="villeInput" class="sr-only">Nom :</label> <input
				type="text" name="ville" class="form-control" id="villeInput"
				placeholder="Enter city name"
				value="${editVille != null ? editVille.nom : ''}" required>
		</div>
		<input type="hidden" name="action"
			value="${editVille != null ? 'update' : 'create'}"> <input
			type="hidden" name="id"
			value="${editVille != null ? editVille.id : ''}">
		<button type="submit" class="btn btn-primary action-buttons">${editVille != null ? 'Update' : 'Enregistrer'}</button>
	</form>

	<h2>Liste des villes :</h2>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Nom</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${villes}" var="v">
				<tr>
					<td>${v.id}</td>
					<td>${v.nom}</td>
					<td>
						<form action="VilleController" method="post"
							onsubmit="return confirmDelete();" class="inline-form">
							<input type="hidden" name="action" value="delete"> <input
								type="hidden" name="id" value="${v.id}">
							<button type="submit"
								class="btn btn-danger btn-sm action-buttons">Delete</button>
						</form>
						<form action="VilleController" method="get" class="inline-form">
							<input type="hidden" name="action" value="edit"> <input
								type="hidden" name="id" value="${v.id}">
							<button type="submit"
								class="btn btn-primary btn-sm action-buttons">Edit</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		function confirmDelete() {
			return confirm("Are you sure you want to delete this hotel?");
		}
	</script>

	<footer>
		<!-- Footer content, if applicable -->
	</footer>

</body>

</html>