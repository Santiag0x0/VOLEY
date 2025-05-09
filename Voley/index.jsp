
<!-- index.jsp con estilo oscuro y temática de vóley y posiciones mejoradas de imágenes -->
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quiz Educativo de Vóley</title>
  <style>
    /* Variables de colores */
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
      justify-content: center;
      align-items: center;
      height: 100vh;
      overflow: hidden;
    }
    .cover {
      position: relative;
      background: var(--dark-card);
      border-radius: 16px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.5);
      padding: 60px 40px 40px;
      text-align: center;
      max-width: 480px;
      width: 90%;
    }
    .cover h1 {
      font-size: 2.2rem;
      margin-bottom: 1.5rem;
      color: var(--primary);
      text-shadow: 1px 1px 2px rgba(0,0,0,0.7);
    }
    .images-container {
      display: flex;
      justify-content: space-between;
      position: absolute;
      top: -30px;
      left: 50%;
      transform: translateX(-50%);
      width: 120%;
    }
    .cover-img {
      width: 100px;
      filter: drop-shadow(0 2px 4px rgba(0,0,0,0.7));
      transform: rotate(-15deg);
      transition: transform 0.3s;
    }
    .cover-img:nth-child(2) { transform: rotate(15deg); }
    .cover-img:hover {
      transform: rotate(0) scale(1.1);
    }
    .btn {
      display: inline-block;
      padding: 12px 28px;
      margin-top: 2rem;
      background: var(--primary);
      color: var(--dark-bg);
      font-weight: bold;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 16px rgba(0,0,0,0.3);
    }
    /* Gradiente de fondo sutil con redes de vóley */
    body::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0; bottom: 0;
      background: radial-gradient(circle at top left, rgba(255,140,0,0.2), transparent 70%),
                  url('images/volley-bg-pattern.png');
      background-size: cover;
      opacity: 0.2;
      z-index: -1;
    }
  </style>
</head>
<body>
  <audio id="bgMusic" src="musica/music.mp3" loop autoplay></audio>
  <div class="cover">
    <div class="images-container">
      <img src="img/voleyka.png" alt="Vóley" class="cover-img">
      <img src="img/voleycrepe.png" alt="Vóley" class="cover-img">
    </div>
    <h1>¡Bienvenido al Quiz de Vóley!</h1>
    <button class="btn" onclick="location.href='informacion.jsp'">Comenzar</button>
  </div>
</body>
</html>

