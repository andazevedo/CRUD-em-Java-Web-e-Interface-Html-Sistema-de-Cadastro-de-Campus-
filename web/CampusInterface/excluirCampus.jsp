<%@page import="dao.CampusDAO"%>
<%@page import="model.CampusDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aviso</title>
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
            }, 3000); 
        </script>
    </head>
    <body>
        <% 
            try {
                CampusDTO campusDTO = new CampusDTO();
                campusDTO.setId(Integer.parseInt(request.getParameter("id")));
                
                CampusDAO campusDao = new CampusDAO();
                campusDao.excluir(campusDTO);
            %>
            <div class="message">
                Exclusão realizada com sucesso!
            </div>
        <% 
            } catch (Exception e) {
        %>
            <div class="message error-message">
                Ocorreu um erro ao excluir o campus.
            </div>
        <% 
                e.printStackTrace();
            }
        %>
    </body>
</html>
