<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Quiz de Vóley</title>
  <style>
    body {
      margin: 0; padding: 0;
      font-family: 'Segoe UI', sans-serif;
      background: #121212; color: #eee;
      display: flex; justify-content: center; align-items: flex-start;
      min-height: 100vh;
    }
    .container {
      background: #1e1e1e;
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.5);
      width: 90%;
      max-width: 800px;
    }
    h1 {
      color: #ff8c00;
      text-align: center;
      margin-bottom: 20px;
    }
    .question {
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 1px solid #333;
    }
    .feedback {
      margin-top: 10px;
      padding: 10px;
      border-radius: 6px;
    }
    .correct {
      background-color: #4caf50;
    }
    .wrong {
      background-color: #f44336;
    }
    label {
      display: block;
      margin-top: 5px;
    }
    .btn-submit {
      display: block;
      margin: 30px auto 0;
      padding: 12px 25px;
      background: #ff8c00;
      color: #121212;
      font-weight: bold;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Quiz de Vóley</h1>
    <%
      class Q {
        String type, text;
        List<String> opts;
        Object answer;

        Q(String t, String tx, Object a, String... o) {
          type = t;
          text = tx;
          answer = a;
          opts = Arrays.asList(o);
        }
      }

      List<Q> questions = new ArrayList<>();
      questions.add(new Q("tf","El voleibol se juega con dos equipos de seis jugadores.", true));
      questions.add(new Q("mc","¿Cuántos toques puede dar un equipo antes de pasar el balón?", 1, "2","3","4","5"));
      questions.add(new Q("tf","El remate en vóley también se llama \"spike\".", true));
      questions.add(new Q("mc","¿A qué altura está la red en categoría femenina?", 0, "2.24 m","2.43 m","2.10 m","2.30 m"));
      questions.add(new Q("tf","Los sets se juegan a 25 puntos con ventaja de 2.", true));
      questions.add(new Q("mc","¿Cuántos puntos tiene el quinto set?", 0, "15","21","11","10"));
      questions.add(new Q("tf","Una rotación ocurre cuando recuperas el saque.", true));
      questions.add(new Q("mc","¿Cuál de estas acciones NO está permitida?", 0, "Sujetar el balón","Golpear con la mano","Bloquear","Sacar"));
      questions.add(new Q("tf","El bloqueo no cuenta como toque.", false));
      questions.add(new Q("mc","¿Cuántos segundos tienes para sacar?", 1, "5","8","10","12"));
      questions.add(new Q("tf","Las posiciones en cancha van del 1 al 8.", false));
      questions.add(new Q("mc","¿Cómo se llama el pase con los dedos?", 2, "Voleo","Remate","Colocación","Recepción"));
      questions.add(new Q("tf","El saque inicia cada punto.", true));
      questions.add(new Q("mc","¿Cuántos jugadores en cancha por equipo?", 1, "5","6","7","8"));
      questions.add(new Q("tf","El balón debe ser lanzado para pasarlo.", false));

      boolean submitted = request.getParameter("submitted") != null;

      if (!submitted) {
    %>
    <form method="post">
      <% for (int i = 0; i < questions.size(); i++) {
           Q q = questions.get(i);
      %>
        <div class="question">
          <strong><%= (i+1) %>. <%= q.text %></strong><br/>
          <% if ("tf".equals(q.type)) { %>
            <label><input type="radio" name="q<%=i%>" value="true"/> Verdadero</label>
            <label><input type="radio" name="q<%=i%>" value="false"/> Falso</label>
          <% } else { %>
            <% for (int j = 0; j < q.opts.size(); j++) { %>
              <label>
                <input type="radio" name="q<%=i%>" value="<%=j%>"/> <%= q.opts.get(j) %>
              </label>
            <% } %>
          <% } %>
        </div>
      <% } %>
      <input type="hidden" name="submitted" value="true"/>
      <button type="submit" class="btn-submit">Enviar respuestas</button>
    </form>
    <%
      } else {
        int score = 0;
        for (int i = 0; i < questions.size(); i++) {
          Q q = questions.get(i);
          String user = request.getParameter("q"+i);
          out.println("<div class='question'><strong>"+(i+1)+". "+q.text+"</strong><br/>");
          boolean correct = false;
          String correctText = "";

          if (user != null) {
            if ("tf".equals(q.type)) {
              boolean ans = Boolean.parseBoolean(user);
              correct = ans == (Boolean)q.answer;
              correctText = ((Boolean)q.answer) ? "Verdadero" : "Falso";
            } else {
              int ans = Integer.parseInt(user);
              correct = ans == (Integer)q.answer;
              correctText = q.opts.get((Integer)q.answer);
            }
          }

          if (correct) {
            score++;
            out.println("<div class='feedback correct'>¡Correcto!</div>");
          } else {
            out.println("<div class='feedback wrong'>Incorrecto. La respuesta correcta es: " + correctText + "</div>");
          }
          out.println("</div>");
        }

        out.println("<div style='text-align:center; margin-top:30px; font-size:1.3rem;'>");
        out.println("<strong>Puntaje final: " + score + " / " + questions.size() + "</strong>");
        out.println("</div>");
        out.println("<form method='get'><button class='btn-submit'>Volver a intentar</button></form>");
      }
    %>
  </div>
</body>
</html>
