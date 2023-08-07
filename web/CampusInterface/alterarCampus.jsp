<%-- 
    Document   : alterarCampus
    Created on : 7 de jul. de 2023, 07:07:46
    Author     : and
--%>

<%@page import="dao.CampusDAO"%>
<%@page import="model.CampusDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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
        }, 3000); // 3 seconds
    </script>
</head>
<body>
    <% 
        try {
            CampusDTO campusDTO = new CampusDTO();
            String idStr = request.getParameter("id");
            String codigoStr = request.getParameter("codigo");
            String cidade = request.getParameter("cidade");
            String coordenador = request.getParameter("coordenador");
            String diretor = request.getParameter("diretor");
            String secretario = request.getParameter("secretario");
            
            if (idStr.isEmpty() || codigoStr.isEmpty() || cidade.isEmpty() || coordenador.isEmpty() || diretor.isEmpty() || secretario.isEmpty()) {
    %>
            <div class="message error-message">
                Ocorreu um erro ao atualizar o campus. Todos os campos devem ser preenchidos.
            </div>
    <%    
            } else {
                int id = Integer.parseInt(idStr);
                int codigo = Integer.parseInt(codigoStr);
                campusDTO.setId(id);
                campusDTO.setCodigo(codigo);
                campusDTO.setCidade(cidade);
                campusDTO.setCoordenador(coordenador);
                campusDTO.setDiretor(diretor);
                campusDTO.setSecretario(secretario);
                
                CampusDAO campusDao = new CampusDAO();
                campusDao.atualizar(campusDTO);
    %>
            <div class="message">
                Atualização realizada com sucesso!
            </div>
    <% 
            }
        } catch (Exception e) {
            // Exibir uma mensagem de erro
    %>
        <div class="message error-message">
            Ocorreu um erro ao atualizar o campus.
        </div>
    <% 
            e.printStackTrace();
        }
    %>
</body>
</html>
