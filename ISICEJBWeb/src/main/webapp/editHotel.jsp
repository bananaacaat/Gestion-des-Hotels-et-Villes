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
    <div class="container">
        <h1 class="text-center mb-4">Edit Hotel</h1>

        <!-- Form to add a new city -->
        <form class="custom_class" action="HotelController" method="post" class="form-inline mb-3">
            <div class="form-group">
                <label for="hotelNameInput">Nom :</label>
                <input type="text" name="nom" class="form-control" id="hotelNameInput" placeholder="Enter hotel name" value="${editHotel != null ? editHotel.nom : ''}" required>
            </div>
            <div class="form-group">
                <label for="hotelAddressInput">Adresse :</label>
                <input type="text" name="adresse" class="form-control" id="hotelAddressInput" placeholder="Enter hotel address" value="${editHotel != null ? editHotel.adresse : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="hotelTelephoneInput">Telephone :</label>
                <input type="text" name="telephone" class="form-control" id="hotelTelephoneInput" placeholder="Enter hotel telephone" value="${editHotel != null ? editHotel.telephone : ''}" required>
            </div>

            <c:if test="${not empty villes}">
                <div class="form-group">
                    <label for="hotelVilleSelect">Ville :</label>
                    <select name="ville" class="form-control" id="hotelVilleSelect">
                        <c:forEach items="${villes}" var="v">
                            <option value="${v.id}" ${editHotel != null && editHotel.ville.id == v.id ? 'selected' : ''}>${v.nom}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>

            <input type="hidden" name="action" value="${editHotel != null ? 'update' : 'create'}">
            <input type="hidden" name="id" value="${editHotel != null ? editHotel.id : ''}">
            <button type="submit" class="btn btn-primary">${editHotel != null ? 'Update' : 'Enregistrer'}</button>
        </form>

    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Ville and associated hotels?");
        }
    </script>
</body>
</html>