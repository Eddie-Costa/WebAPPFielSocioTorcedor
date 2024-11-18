package model.dao;

import model.PesquisaSatisfacao;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import util.ConectaDbSocio;

public class PesquisaSatisfacaoDAO {
    //Atributos

     //Métodos
    public boolean insPesq(PesquisaSatisfacao p_pesq) throws ClassNotFoundException {
         //Connectar
         Connection conexao = null;
         try{
             conexao = ConectaDbSocio.conectar(); // Abre a conexão
             Statement stmt = conexao.createStatement();        

             String sql = "INSERT INTO Pesquisa (Nome, Email, Dt, q1, q2, q3, q4) VALUES ('" + p_pesq.getNome()+
                                                                                         "','" + p_pesq.getEmail()+
                                                                                         "', '" + p_pesq.getDt()+ 
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

    public PesquisaSatisfacao consPesqReg(PesquisaSatisfacao pesquisa) throws ClassNotFoundException{
     //Connectar
         Connection conexao = null;
         try{
             conexao = ConectaDbSocio.conectar(); // Abre a conexão
             Statement stmt = conexao.createStatement();                                   

             String sql = "SELECT * from Pesquisa where Nome = '" + pesquisa.getNome() + "'";
             ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select

             int n_reg = 0;
             while (rs.next()) {  
                 pesquisa.setProtocolo(Integer.parseInt(rs.getString("Protocolo")));  
                 pesquisa.setNome(rs.getString("Nome"));  
                 pesquisa.setEmail(rs.getString("Email"));  
                 pesquisa.setDt(rs.getString("Dt")); 
                 pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                 pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                 pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                 pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
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

    public PesquisaSatisfacao consPesqEmail(PesquisaSatisfacao pesquisa) throws ClassNotFoundException{
     //Connectar
         Connection conexao = null;
         try{
             conexao = ConectaDbSocio.conectar(); // Abre a conexão
             Statement stmt = conexao.createStatement();                                   

             String sql = "SELECT * from Pesquisa where Email = '" +pesquisa.getEmail()+ "' ";
             ResultSet rs = stmt.executeQuery(sql);

             int n_reg = 0;
             while (rs.next()) {                 
                 pesquisa.setProtocolo(Integer.parseInt(rs.getString("Protocolo")));  
                 pesquisa.setNome(rs.getString("Nome"));  
                 pesquisa.setEmail(rs.getString("Email"));                
                 pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                 pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                 pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                 pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                 pesquisa.setDt(rs.getString("Dt"));  
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
                 PesquisaSatisfacao pesquisa = new PesquisaSatisfacao();
                 pesquisa.setProtocolo(Integer.parseInt(rs.getString("pkid")));  
                 pesquisa.setNome(rs.getString("nome"));  
                 pesquisa.setEmail(rs.getString("email"));                
                 pesquisa.setQ1( Integer.parseInt(rs.getString("q1")));                
                 pesquisa.setQ2( Integer.parseInt(rs.getString("q2")));                
                 pesquisa.setQ3( Integer.parseInt(rs.getString("q3")));                
                 pesquisa.setQ4( Integer.parseInt(rs.getString("q4"))); 
                 pesquisa.setDt(rs.getString("dt_pesq")); 
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

    public boolean exPesqId(PesquisaSatisfacao pesquisa) throws ClassNotFoundException{
     //Connectar
         Connection conexao = null;
         try{
             conexao = ConectaDbSocio.conectar(); // Abre a conexão
             Statement stmt = conexao.createStatement();                                   

             String sql = "DELETE from Pesquisa where Protocolo = " + pesquisa.getProtocolo();
             stmt.executeUpdate(sql);            
             conexao.close();            
             return true;

         }catch(SQLException ex){
             System.out.println("Erro:" + ex);
             return false;
         }
     } 

    public boolean altPesq(PesquisaSatisfacao p_pesq) throws ClassNotFoundException {
         //Connectar
         Connection conexao = null;
         try{
             conexao = ConectaDbSocio.conectar(); // Abre a conexão
             Statement stmt = conexao.createStatement();                     
             String sql = "UPDATE pesquisa SET dt='" + p_pesq.getDt()+ "'" +
                                                     ", Nome='" + p_pesq.getNome()+ "'" +
                                                     ", Email='" + p_pesq.getEmail() + "'" +
                                                     ", q1=" + p_pesq.getQ1()+ 
                                                     ", q2=" + p_pesq.getQ2()+ 
                                                     ", q3=" + p_pesq.getQ3()+ 
                                                     ", q4=" + p_pesq.getQ4() + " WHERE Protocolo = " + p_pesq.getProtocolo();

             stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update

             conexao.close();
             return true;
         }catch(SQLException ex){
             System.out.println(" Exception: " + ex.toString());
             return false;
         }                 
     } 

}
