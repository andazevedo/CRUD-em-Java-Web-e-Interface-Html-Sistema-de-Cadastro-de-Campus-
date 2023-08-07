<%@page import="model.CampusDTO"%>
<%@page import="dao.CampusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta charset="UTF-8">
    <style>
        /* Global styles */
        body {
          background-image: url('https://wallpapercave.com/wp/qNAWsis.jpg');
          background-repeat: no-repeat;
          background-size: cover;
          display: flex;
          justify-content: center;
          align-items: center;
          min-height: 100vh;
        }
        
        /* Success and error message styles */
        .message {
          background-color: #32CD32;
          color: #ffffff;
          padding: 10px;
          border-radius: 5px;
          text-align: center;
        }
        
        .error-message {
          background-color: #ff4d4d;
        }
    </style>
    <script>
        setTimeout(function() {
            window.location.href = "listarCampus.jsp";
        }, 2000); // 2 seconds
    </script>
</head>
<body>
    <% 
        try {
            CampusDTO campus = new CampusDTO();
            campus.setCodigo(Integer.parseInt(request.getParameter("codigo")));
            campus.setCidade(request.getParameter("cidade"));
            campus.setCoordenador(request.getParameter("coordenador"));
            campus.setDiretor(request.getParameter("diretor"));
            campus.setSecretario(request.getParameter("secretario"));
            
            CampusDAO campusDao = new CampusDAO();
            campusDao.inserir(campus);
            
            
        %>
        <div class="message">
            Inserção realizada com sucesso!
        </div>
    <% 
        } catch (Exception e) {
            // Exibir uma mensagem de erro
    %>
        <div class="message error-message">
            Ocorreu um erro ao inserir o campus.
        </div>
    <% 
            e.printStackTrace();
        }
    %>
    
    
</body>
</html>
