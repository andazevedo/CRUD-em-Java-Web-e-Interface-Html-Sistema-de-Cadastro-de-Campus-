/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mains;

import dao.CampusDAO;
import java.util.ArrayList;
import model.CampusDTO;

/**
 *
 * @author and
 */
public class Main {
 
   public static void main(String[] args) {
       
        CampusDAO campusDAO = new CampusDAO();
        ArrayList<CampusDTO> listaCampus = campusDAO.listar();
        
        for (CampusDTO campus : listaCampus) {
            System.out.println("Id: " + campus.getId());
            System.out.println("Código: " + campus.getCodigo());
            System.out.println("Cidade: " + campus.getCidade());
            System.out.println("Coordenador: " + campus.getCoordenador());
            System.out.println("Diretor: " + campus.getDiretor());
            System.out.println("Secretário: " + campus.getSecretario());
            System.out.println();
        }
       
    }
    
}
