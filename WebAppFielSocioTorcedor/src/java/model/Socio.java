package model;

public class Socio {
    //Atributos
    private String Nome;
    private String Data_nasc;
    private String Cpf;
    private String Telefone;
    private String Email;
    private String Senha;
    private String Plano; //'1 - Minha Vida | 2 - Minha Historia | 3 - Meu Amor'
    
    //Métodos:
    
    //Getters
    
    public String getNome() {
        return Nome;
    }

    public String getData_nasc() {
        return Data_nasc;
    }

    public String getCpf() {
        return Cpf;
    }

    public String getTelefone() {
        return Telefone;
    }

    public String getEmail() {
        return Email;
    }

    public String getSenha() {
        return Senha;
    }

    public String getPlano() {
        return Plano;
    }
    
    //Setters

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public void setData_nasc(String Data_nasc) {
        this.Data_nasc = Data_nasc;
    }

    public void setCpf(String Cpf) {
        this.Cpf = Cpf;
    }

    public void setTelefone(String Telefone) {
        this.Telefone = Telefone;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setSenha(String Senha) {
        this.Senha = Senha;
    }

    public void setPlano(String Plano) {
        this.Plano = Plano;
    }
    
    
}
