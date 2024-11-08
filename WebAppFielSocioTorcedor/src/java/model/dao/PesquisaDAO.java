/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.Pesquisa;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import util.ConectaDbSocio;
/**
 *
 * @author alunocmc
 */
public class PesquisaDAO {
   //Atributos
    // Sem atributos
    
    //Métodos
   public boolean insPesq(Pesquisa p_pesq) throws ClassNotFoundException {
        //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDbSocio.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();        
                        
            String sql = "INSERT INTO Pesquisa(dt_pesq, nome, email, q1, q2, q3, q4) VALUES ('" + p_pesq.getDt_pesq()+
                                                                                    "','" + p_pesq.getNome()+
                                                                                    "', '" + p_pesq.getEmail() + 
                                                                                    "'," + p_pesq.getQ1()+ 
                                                                                    "," + p_pesq.getQ2()+ 
                                                                                    "," + p_pesq.getQ3()+ 
                                                                                    "," + p_pesq.getQ4() + ")";
                         
            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
                        
            conexao.close();
            return true;
        }catch(SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return false;
        }                 
    }  
    
   public Pesquisa consPesqReg(Pesquisa pesquisa) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDbSocio.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from Pesquisa where Nome = '" + pesquisa.getNome() + "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {   
                pesquisa.setId(Integer.parseInt(rs.getString("Id")));  
                pesquisa.setNome(rs.getString("Nome"));  
                pesquisa.setEmail(rs.getString("Email"));                
                pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                pesquisa.setDt_pesq(rs.getString("Dt_pesq"));  
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return pesquisa;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }   

   public Pesquisa consPesqRegId(Pesquisa pesquisa) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDbSocio.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from Pesquisa where Email = '" + pesquisa.getEmail()+ "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                pesquisa.setId(Integer.parseInt(rs.getString("Id")));  
                pesquisa.setNome(rs.getString("Nome"));  
                pesquisa.setEmail(rs.getString("Email"));                
                pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                pesquisa.setDt_pesq(rs.getString("Dt_pesq"));  
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return pesquisa;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    } 
    
   public List consPesqLista() throws ClassNotFoundException{
    //Connectar
        List lista = new ArrayList(); // Minha Lista
        Connection conexao = null;
        try{
            conexao = ConectaDbSocio.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from pesquisa";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                Pesquisa pesquisa = new Pesquisa();
                pesquisa.setId(Integer.parseInt(rs.getString("pkid")));  
                pesquisa.setNome(rs.getString("nome"));  
                pesquisa.setEmail(rs.getString("email"));                
                pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                pesquisa.setDt_pesq(rs.getString("dt_pesq")); 
                lista.add(pesquisa);
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }   
   
   public boolean exPesqId(Pesquisa pesquisa) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDbSocio.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "DELETE from pesquisa where pkid = " + pesquisa.getId();
            stmt.executeUpdate(sql);            
            conexao.close();            
            return true;
            
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    } 
   
}
