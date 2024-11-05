package model.dao;

import model.Socio;
import util.ConectaDB;
import java.sql.*;

public class SocioDAO {
    //Atributos
    
    //Métodos
    
    public boolean insSocio(Socio p_socio) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();         
            String sql = "Insert INTO socio(Nome, Data_nasc, Cpf, Telefone, Email, Senha, Plano) VALUES ('" + p_socio.getNome() +"', '" + p_socio.getData_nasc() +"', '" + p_socio.getCpf() + "','" + p_socio.getTelefone() + "','" + p_socio.getEmail() + "','" + p_socio.getSenha() + "','" + p_socio.getPlano() + "')";
            stmt.executeUpdate(sql);
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }
    
}
