<%@page import="java.util.List"%>
<%@page import="entities.Hotel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gestion des Hotels</title>
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
    <div class="container">
        <form class="my_form" action="HotelController" method="post">
            <div class="form-group">
                <label for="nom">Nom :</label>
                <input type="text" name="nom" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="adresse">Adresse :</label>
                <input type="text" name="adresse" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="telephone">Telephone :</label>
                <input type="text" name="telephone" class="form-control" required>
            </div>
            
            <c:if test="${not empty villes}">
                <div class="form-group">
                    <label for="ville">Ville :</label>
                    <select name="ville" class="form-control">
                        <c:forEach items="${villes}" var="v">
                            <option value="${v.id}">${v.nom}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <!-- Table to showcase hotel information -->
<h2 class="text-center mt-4">Liste des Hôtels :</h2>
<table class="table table-bordered table-striped">
    <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Adresse</th>
            <th>Telephone</th>
            <th>Ville</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <!-- Add a loop to iterate over the list of hotels -->
        <c:forEach items="${Hotels}" var="hotel">
            <tr>
                <td>${hotel.id}</td>
                <td>${hotel.nom}</td>
                <td>${hotel.adresse}</td>
                <td>${hotel.telephone}</td>
                <td>${hotel.ville.nom}</td>
                <td>
               	 <form action="HotelController" method="post" onsubmit="return confirmDelete();" class="inline-form">
                               <input type="hidden" name="action" value="delete">
                               <input type="hidden" name="id" value="${hotel.id}">
                               <button type="submit" class="btn btn-danger btn-sm action-buttons">Delete</button>
                           </form>
                           <form action="HotelController" method="get" class="inline-form">
                               <input type="hidden" name="action" value="edit">
                               <input type="hidden" name="id" value="${hotel.id}">
                               <button type="submit" class="btn btn-primary btn-sm action-buttons">Edit</button>
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
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>