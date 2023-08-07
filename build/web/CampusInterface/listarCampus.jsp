<%@page import="model.CampusDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CampusDAO"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta charset="UTF-8">
    <style>
        /* Global styles */
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
          display: flex;
          align-items: center;
          justify-content: center; /* Centralizar horizontalmente */
        }

        /* Form styles */
        form {
          max-width: fit-content;
          padding: 40px;
          background-color: rgba(0, 0, 0, 0.5);
          box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.1);
          border-radius: 10px;
          margin-top: 180px;
          position: relative;
        }

        /* Table styles */
        table {
          width: 100%;
          border-collapse: collapse;
          margin-top: 20px;
        }

        th, td {
          padding: 10px;
          text-align: left;
          word-wrap: break-word;
        }

        th {
          color: #ffffff;
          font-weight: bold;
          position: sticky;
          top: 0;
          z-index: 1;
          background-color: rgba(0, 0, 0, 0.5);
        }

        td {
          color: #ffffff;
        }
        
        /* Table container styles */
        .table-container {
          max-height: 400px;
          overflow-y: auto;
          max-width: 800px;
          scrollbar-width: thin;
          scrollbar-color: #02d3f0 #0a192f;
        }
        
        .table-container::-webkit-scrollbar {
          width: 8px;
        }

        .table-container::-webkit-scrollbar-thumb {
          background-color: #02d3f0;
          border-radius: 4px;
        }

        .table-container::-webkit-scrollbar-thumb:hover {
          background-color: #00a6c4;
        }

        .table-container::-webkit-scrollbar-track {
          background-color: #0a192f;
        }
        
        /* Button styles */
        .button {
          display: inline-block;
          padding: 8px 16px;
          border-radius: 4px;
          text-decoration: none;
          font-weight: bold;
          transition: background-color 0.3s ease;
          margin-right: 10px;
          margin-top: 20px;
          background-color: #00a6c4;
          color: #ffffff;
          word-wrap: break-word;
        }

        .button.edit {
          background-color: #f0c200;
          color: #000000;
        }

        .button.delete {
          background-color: #ff4d4d;
          color: #ffffff;
        }
       
    </style>
</head>
<body>
    <form>
        <div class="table-container">
            <h1 style="font-weight: bold; text-align: center;"> LISTAGEM DE CAMPUS </h1>      
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Código</th>
                        <th>Cidade</th>
                        <th>Coordenador</th>
                        <th>Diretor</th>
                        <th>Secretário</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                <%            
                try {
                    CampusDAO objCampusDAO = new CampusDAO();
                    ArrayList<CampusDTO> lista = objCampusDAO.listar();
                
                    for(int num = 0; num < lista.size(); num++) {
                        CampusDTO campus = lista.get(num);
                %>
                    <tr>
                        <td><%= campus.getId() %></td>
                        <td><%= campus.getCodigo() %></td>
                        <td><%= campus.getCidade() %></td>
                        <td><%= campus.getCoordenador() %></td>
                        <td><%= campus.getDiretor() %></td>
                        <td><%= campus.getSecretario() %></td>
                        <td>
                            <a class="button delete" href='fmrExcluirCampusView.jsp?id=<%= campus.getId() %>&codigo=<%= campus.getCodigo() %>&cidade=<%= campus.getCidade() %>&coordenador=<%= campus.getCoordenador() %>&diretor=<%= campus.getDiretor() %>&secretario=<%= campus.getSecretario() %>'>Excluir</a>
                            <a class="button edit" href='fmrAlterarCampusView.jsp?id=<%= campus.getId() %>&codigo=<%= campus.getCodigo() %>&cidade=<%= campus.getCidade() %>&coordenador=<%= campus.getCoordenador() %>&diretor=<%= campus.getDiretor() %>&secretario=<%= campus.getSecretario() %>'>Editar</a>
                        </td>
                    </tr>
                <%                
                    }
                } catch (Exception e) {
                    out.println("<p>Ocorreu um erro ao listar os campus.</p>");
                    e.printStackTrace();
                }
                %>
                </tbody>
            </table>
        </div>
          
        <button class="button" type="button" onclick="location.href='frmCampusView.html'">Cadastrar</button>
           
    </form>
</body>
</html>