<%@ page import="java.util.List" %>
<%@ page import="custom.TableData" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<TableData> objects = (List<TableData>)request.getSession().getAttribute("tableData");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="assets/css/stail_main.css">
</head>

<body>
<form action="./ControllerServlet" name="Date" id="forma_data" method="Post">
<table class="layout" border="0px">
    <tbody>
    <tr>
        <td colspan="3" id="hat">Минтус Евгений Андреевич P-32121 Вариант №11225</td>
    </tr>
    <tr>
        <td id="YData" align="center"><input id="YInput" name="y" type="text" maxlength="2" placeholder="Введите Y (от -3 до 5)" ></td>
        <td id="XData" align="center">
            <input type="radio" name="x" class="x" id="x_value_-3" value="-3">-3
            <input type="radio" name="x" class="x" id="x_value_-2" value="-2">-2
            <input type="radio" name="x" class="x" id="x_value_-1" value="-1">-1
            <input type="radio" name="x" class="x" id="x_value_0" value="0" checked>0
            <input type="radio" name="x" class="x" id="x_value_1" value="1">1
            <input type="radio" name="x" class="x" id="x_value_2" value="2">2
            <input type="radio" name="x" class="x" id="x_value_3" value="3">3
            <input type="radio" name="x" class="x" id="x_value_4" value="4">4
            <input type="radio" name="x" class="x" id="x_value_5" value="5">5
        </td>
        <td id="RData" align="center">
            <select id="RSelect" name="radius">
                <option value="1">Выберите значение R, по умолчанию выбрано 1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </td>
    </tr>
    <tr>
        <td class="exercise" colspan="3">
            <a>Проверить, попадает точка ли точка в заданную область</a>
            <button id="verify" type="submit" >Проверить</button>
        </td>
    </tr>
    <tr>
        <td class="leftChart"></td>
        <td id="rightChart"></td>
        <td id="chart">
            <svg class="svg" width="300" height="300">
                <!--Координатные оси-->
                <line x1="0" x2="300" y1="150" y2="150" stroke="white"></line>
                <line x1="150" x2="150" y1="0" y2="300" stroke="white"></line>
                <!--Стрелочки-->
                <polygon points="150,0 145,15 155,15" stroke="white"></polygon>
                <polygon points="300,150 285,145 285,155" stroke="white"></polygon>
                <!--Треугольник в первой четверти-->
               <polygon class="triangle" points="150,150 150,100 100,150" stroke="white" fill=#cb20da></polygon>
                <!--Четверть круга во второй четверти-->
                <path class="circle" d="M200,150 A50,50 90 0,1 150,200 L 150,150 Z" stroke="white" fill=#cb20da></path>
                <!--Квадрат в четвертой четверти-->
                <polygon class="square" points="150,150 150,250 100,250 100,150" stroke="white" fill=#cb20da></polygon>
                <g class="circles"></g>
                <!-- Подписи к осям -->
                <text x="285" y="135" stroke="white">X</text>
                <text x="160" y="15" stroke="white">Y</text>
                <!-- Метки для значений R на оси X -->
                <line x1="50" x2="50" y1="140" y2="160" stroke="white" ></line>
                <line x1="100" x2="100" y1="140" y2="160" stroke="white"></line>
                <line x1="200" x2="200" y1="140" y2="160" stroke="white"></line>
                <line x1="250" x2="250" y1="140" y2="160" stroke="white"></line>
                <!-- Метки для значений R на оси Y -->
                <line x1="140" x2="160" y1="50" y2="50" stroke="white"></line>
                <line x1="140" x2="160" y1="100" y2="100" stroke="white"></line>
                <line x1="140" x2="160" y1="200" y2="200" stroke="white"></line>
                <line x1="140" x2="160" y1="250" y2="250" stroke="white"></line>
                <!-- Значения R на оси X -->
                <text x="50" y="130" text-anchor="middle" id="-r" stroke="white">-R</text>
                <text x="98" y="130" text-anchor="middle" id="-r2" stroke="white">-R/2</text>
                <text x="200" y="130" text-anchor="middle" id="r2" stroke="white">R/2</text>
                <text x="250" y="130" text-anchor="middle" id="r" stroke="white">R</text>
                <!-- Значения R на оси Y -->
                <text x="170" y="52.5" id="r" stroke="white">R</text>
                <text x="170" y="102.5" id="r2" stroke="white">R/2</text>
                <text x="170" y="202.5" id="-r2" stroke="white">-R/2</text>
                <text x="170" y="252.5" id="-r" stroke="white">-R</text>
            </svg>
        </td>
    </tr>
    </tbody>
</table>
</form>
</body>
<script src="assets/js/main.js"></script>
<<script src="assets/js/interactive.js"></script>
</html>