<!-- informacion.jsp con carrusel reducido y botón al quiz -->
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Información de Vóley</title>
  <style>
    :root {
      --dark-bg: #121212;
      --dark-card: #1e1e1e;
      --primary: #ff8c00;
      --accent: #ffffff;
    }
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, sans-serif;
      background: var(--dark-bg);
      color: var(--accent);
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }
    .carousel-container {
      background: var(--dark-card);
      border-radius: 16px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.5);
      padding: 40px;
      max-width: 600px;
      width: 90%;
      position: relative;
      text-align: center;
    }
    .slide {
      display: none;
      font-size: 1.1rem;
      line-height: 1.5;
      padding: 20px;
    }
    .slide.active {
      display: block;
    }
    .carousel-btn {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background: var(--primary);
      border: none;
      color: var(--dark-bg);
      padding: 8px 16px;
      cursor: pointer;
      border-radius: 8px;
      font-weight: bold;
    }
    #prevBtn { left: 16px; }
    #nextBtn { right: 16px; }
    .next-quiz-btn {
      display: block;
      margin: 20px auto 0;
      padding: 12px 24px;
      background: var(--primary);
      color: var(--dark-bg);
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      text-decoration: none;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="carousel-container">
    <div class="slide active">El voleibol es un deporte donde dos equipos de seis jugadores buscan enviar el balón por encima de la red hacia el campo contrario. Se anotan puntos cuando el balón toca el suelo del equipo rival o cometen errores en el pase o recepción.</div>
    <div class="slide">Cada equipo tiene hasta tres toques para devolver el balón. Se utilizan golpes de antebrazos, dedos (colocación) y remates. No se permite sujetar ni lanzar el balón: debe ser golpeado limpiamente.</div>
    <div class="slide">El saque da inicio a cada jugada y se realiza desde detrás de la línea de fondo. El jugador dispone de 8 segundos para ejecutar el saque, y puede hacerlo con la mano abierta o el puño cerrado. Cuando el equipo recupera el saque, debe rotar sus posiciones.</div>
    <div class="slide">Los partidos oficiales se juegan al mejor de cinco sets. Los primeros cuatro se juegan a 25 puntos y el quinto, si es necesario, a 15 puntos. En todos los casos se requiere una ventaja de 2 puntos para ganar un set.</div>
    <div class="slide">La red mide 2.43 m para hombres y 2.24 m para mujeres. El bloqueo, que ocurre en la red, cuenta como un toque. Los árbitros se encargan de aplicar las reglas, controlar los tiempos y sancionar cualquier falta como invasiones o dobles toques.</div>

    <button id="prevBtn" class="carousel-btn" onclick="changeSlide(-1)">❮</button>
    <button id="nextBtn" class="carousel-btn" onclick="changeSlide(1)">❯</button>
  </div>
  <a href="quiz.jsp" class="next-quiz-btn">Ir al Quiz</a>

  <script>
    let slideIndex = 0;
    const slides = document.querySelectorAll('.slide');
    function showSlide(idx) {
      slides.forEach((s, i) => s.classList.toggle('active', i === idx));
    }
    function changeSlide(delta) {
      slideIndex = (slideIndex + delta + slides.length) % slides.length;
      showSlide(slideIndex);
    }
  </script>
</body>
</html>
