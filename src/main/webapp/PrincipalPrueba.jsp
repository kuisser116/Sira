<%--
  Created by IntelliJ IDEA.
  User: kuiss
  Date: 18/07/2024
  Time: 10:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservas</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                locale: 'es',
                initialView: 'timeGridWeek',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                buttonText: {
                    today: 'Hoy',
                    month: 'Mes'
                },
                views: {
                    timeGridWeek: {
                        type: 'timeGridWeek',
                        buttonText: 'Semana'
                    },
                    timeGridDay: {
                        type: 'timeGridDay',
                        buttonText: 'Día'
                    },
                },
                slotDuration: '00:30:00',
                slotLabelInterval: '01:00:00',
                allDaySlot: false
            });
            calendar.render();

            // Agregamos un formulario para agregar eventos
            let addEventForm = document.getElementById('add-event-form');
            addEventForm.addEventListener('submit', function(event) {
                event.preventDefault();
                let title = document.getElementById('title').value;
                let start = document.getElementById('start').value;
                let end = document.getElementById('end').value;

                let newEvent = {
                    title: title,
                    start: start,
                    end: end
                };

                calendar.addEvent(newEvent);
            });
        });
    </script>
    <link rel="stylesheet" href="styles/style_calendar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

</head>

<body>
<div class="barra">
    <img src="styles/" alt="" class="logo">
    <h1>SIRA </h1>
</div>

<nav>
    <ul class="list">
        <li>
            <i class="fas fa-calendar-check"></i>
        <li><a href="" id="btn-abrir-modal">
            <span class="nav-item">Reservar</span>
        </a></li>
        <i class="fas fa-calendar-times"></i>
        <a href="">
            <span class="nav-item">Cancelar</span>
        </a>
        </li>
        <li>
            <i class="fas fa-edit"></i>
            <a href="">
                <span class="nav-item">Editar</span>
            </a></li>
        <li>
            <i class="fas fa-calendar-plus"></i>
            <a href="">
                <span class="nav-item">Agregar dia Inhabil</span>
            </a></li>
        <li>
            <i class="fas fa-calendar-minus"></i>
            <a href="">
                <span class="nav-item">Cancelar dia inhabil</span>
            </a></li>
    </ul>
</nav>

<div id="calendar"></div>
<dialog id="modal">
    <form id="add-event-form" method="dialog">
        <label for="title">Titulo:</label>
        <input type="text" id="title" name="title"><br><br>
        <label for="start">Fecha de inicio:</label>
        <input type="datetime-local" id="start" name="start"><br><br>
        <label for="end">Fecha de fin:</label>
        <input type="datetime-local" id="end" name="end"><br><br>
        <button type="submit" id="btn-cerrar-modal">Agregar evento</button>
    </form>
</dialog>

<script>
    const btnabrirmodal = document.querySelector("#btn-abrir-modal");
    const modal = document.querySelector("#modal");
    const btncerrarmodal = document.querySelector("#btn-cerrar-modal");

    btnabrirmodal.addEventListener("click",()=>{
        event.preventDefault();
        modal.showModal();

        btncerrarmodal.addEventListener("click",()=>{
            modal.close();
        })


    });



</script>

</body>
</html>