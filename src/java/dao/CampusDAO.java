package dao;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CampusDTO;

public class CampusDAO {
    private Connection connection;
    
    public CampusDAO() {
        try {
            // Carrega a classe do driver do MySQL
            Class.forName("com.mysql.jdbc.Driver");
        
            // Configuração da URL do banco de dados, nome de usuário e senha
            String DATABASE_URL = "jdbc:mysql://localhost:3306/programacao2";
            String usuario = "root";
            String senha = "";
            
            // Cria a conexão com o banco de dados
            this.connection = DriverManager.getConnection(DATABASE_URL + "?useUnicode=true&characterEncoding=UTF-8", usuario, senha);
        } catch (ClassNotFoundException 
                | SQLException ex) {
            Logger.getLogger(CampusDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("erro ao conectar: " + ex);
        }
    }
    
    public ArrayList<CampusDTO> listar() {
        // Consulta SQL para selecionar todos os registros da tabela campus
        String sql = "SELECT * FROM campus";
        
        // Cria uma lista para armazenar os objetos Campus
        ArrayList<CampusDTO> retorno = new ArrayList<>();
        
        try {
            // Prepara a declaração SQL
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            // Executa a consulta e obtém o resultado
            ResultSet resultado = stmt.executeQuery();
            
            System.out.println(resultado);
            
            while (resultado.next()) {
                // Cria um objeto Campus
                CampusDTO campus = new CampusDTO();
                
                // Preenche os atributos do objeto com os valores do resultado
                campus.setId(resultado.getInt("id"));
                campus.setCodigo(resultado.getInt("codigo"));
                campus.setCidade(resultado.getString("cidade"));
                campus.setCoordenador(resultado.getString("coordenador"));
                campus.setDiretor(resultado.getString("diretor"));
                 campus.setSecretario(resultado.getString("secretario"));
                
                // Adiciona o objeto Campus à lista de retorno
                retorno.add(campus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CampusDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // Retorna a lista de objetos Campus
        return retorno;
    }
    
    public boolean inserir(CampusDTO campus) {
        // Consulta SQL para inserir um novo registro na tabela campus
        String sql = "INSERT INTO campus (codigo, cidade, coordenador, diretor, secretario) VALUES (?, ?, ?, ?, ?)";
        
        try {
            // Prepara a declaração SQL
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            // Define os valores dos parâmetros da consulta
            stmt.setInt(1, campus.getCodigo());
            stmt.setString(2, campus.getCidade());
            stmt.setString(3, campus.getCoordenador());
            stmt.setString(4, campus.getDiretor());
            stmt.setString(5, campus.getSecretario());
            
            // Executa a consulta
            stmt.executeUpdate();
            stmt.close();
            
            // Retorna true para indicar que a inserção foi bem-sucedida
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir DAO");
            Logger.getLogger(CampusDAO.class.getName()).log(Level.SEVERE, null, ex);
            // Retorna false em caso de erro
            return false;
        }
    }
    
    public boolean atualizar(CampusDTO campus) {
        // Consulta SQL para atualizar um registro na tabela campus
        String sql = "UPDATE campus SET codigo=?, cidade=?, coordenador=?, diretor=?, secretario=? WHERE id=?";
        
        try {
            // Prepara a declaração SQL
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            // Define os valores dos parâmetros da consulta
            stmt.setInt(1, campus.getCodigo());
            stmt.setString(2, campus.getCidade());
            stmt.setString(3, campus.getCoordenador());
            stmt.setString(4, campus.getDiretor());
            stmt.setString(5, campus.getSecretario());
            stmt.setInt(6, campus.getId());
            
            // Executa a consulta
            stmt.executeUpdate();
            
            // Retorna true para indicar que a atualização foi bem-sucedida
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CampusDAO.class.getName()).log(Level.SEVERE, null, ex);
            // Retorna false em caso de erro
            return false;
        }
    }
    
    public boolean excluir(CampusDTO campusDTO) {
        // Consulta SQL para excluir um registro da tabela campus
        String sql = "DELETE FROM campus WHERE id=?";
        
        try {
            // Prepara a declaração SQL
            PreparedStatement stmt = connection.prepareStatement(sql);
            
            // Define o valor do parâmetro da consulta
            stmt.setInt(1, campusDTO.getId());
            
            // Executa a consulta
            stmt.execute();
            stmt.close();
            
            
            // Retorna true para indicar que a exclusão foi bem-sucedida
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CampusDAO.class.getName()).log(Level.SEVERE, null, ex);
            // Retorna false em caso de erro
            return false;
        }
    }
}
