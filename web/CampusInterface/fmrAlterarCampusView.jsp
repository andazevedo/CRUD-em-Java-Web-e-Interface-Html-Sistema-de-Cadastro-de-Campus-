<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
  
        body {
          background-color: #0a192f;
          background-image: url('https://wallpapercave.com/wp/qNAWsis.jpg');
          background-repeat: no-repeat;
          background-size: cover;
          background-position: center;
          color: #ffffff;
          font-family: Arial, sans-serif;
          margin: 0;
          padding: 0;
        }

      
        form {
          max-width: 500px;
          margin: 50px auto;
          padding: 20px;
          background-color: transparent;
          border-radius: 10px;
          box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
          
        }

        label {
          display: block;
          margin-bottom: 10px;
          font-size: 16px;
          color: #ffffff;
        }

        input[type="text"] {
          width: 100%;
          padding: 10px;
          border: none;
          border-radius: 5px;
          background-color: rgba(30, 48, 76, 0.5);
          color: #ffffff;
          font-size: 16px;
          margin-bottom: 20px;
        }

        input[type="submit"] {
          width: 50%;
          padding: 10px;
          border: none;
          border-radius: 5px;
          background-color: #d7a100;
          color: #ffffff;
          font-size: 16px;
          cursor: pointer;
          transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
          background-color: #f0c200;
        }
    </style>
</head>
<body>
  <form action="alterarCampus.jsp" method="POST">
      <h1> ATUALIZAR INFORMAÇÕES </h1>
    <label for="id">Id:</label>
    <input type="text" id="id" name="id" value="<%=request.getParameter("id")%>">

    <label for="codigo">Código:</label>
    <input type="text" id="codigo" name="codigo" value="<%=request.getParameter("codigo")%>">

    <label for="cidade">Cidade:</label>
    <input type="text" id="cidade" name="cidade" value="<%=request.getParameter("cidade")%>">

    <label for="coordenador">Coordenador:</label>
    <input type="text" id="coordenador" name="coordenador" value="<%=request.getParameter("coordenador")%>">

    <label for="diretor">Diretor:</label>
    <input type="text" id="diretor" name="diretor" value="<%=request.getParameter("diretor")%>">

    <label for="secretario">Secretário:</label>
    <input type="text" id="secretario" name="secretario" value="<%=request.getParameter("secretario")%>">

    <input type="submit" value="Alterar">
  </form>
</body>
</html>
