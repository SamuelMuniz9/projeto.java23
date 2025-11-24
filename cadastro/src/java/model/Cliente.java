/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Carlos eduardo  rgm:11241104093
 * Ryan miranda  rgm:11241100686
 * Angelo andrade  rgm:
 */
public class Cliente {
    
private int id;
    private String nome;
    private String sobrenome;
    private String emailComercial;
    private String telefoneComercial;
    private String funcaoCargo;
    private String areaFuncionalDepartamento;
    private String nomeDeSuaOrganizacao;
    private String paisRegiao;
    private String cepCodigoPostal;
    private String interessePrincipalProduto;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getEmailComercial() {
        return emailComercial;
    }

    public void setEmailComercial(String emailComercial) {
        this.emailComercial = emailComercial;
    }

    public String getTelefoneComercial() {
        return telefoneComercial;
    }

    public void setTelefoneComercial(String telefoneComercial) {
        this.telefoneComercial = telefoneComercial;
    }

    public String getFuncaoCargo() {
        return funcaoCargo;
    }

    public void setFuncaoCargo(String funcaoCargo) {
        this.funcaoCargo = funcaoCargo;
    }

    public String getAreaFuncionalDepartamento() {
        return areaFuncionalDepartamento;
    }

    public void setAreaFuncionalDepartamento(String areaFuncionalDepartamento) {
        this.areaFuncionalDepartamento = areaFuncionalDepartamento;
    }

    public String getNomeDeSuaOrganizacao() {
        return nomeDeSuaOrganizacao;
    }

    public void setNomeDeSuaOrganizacao(String nomeDeSuaOrganizacao) {
        this.nomeDeSuaOrganizacao = nomeDeSuaOrganizacao;
    }

    public String getPaisRegiao() {
        return paisRegiao;
    }

    public void setPaisRegiao(String paisRegiao) {
        this.paisRegiao = paisRegiao;
    }

    public String getCepCodigoPostal() {
        return cepCodigoPostal;
    }

    public void setCepCodigoPostal(String cepCodigoPostal) {
        this.cepCodigoPostal = cepCodigoPostal;
    }

    public String getInteressePrincipalProduto() {
        return interessePrincipalProduto;
    }

    public void setInteressePrincipalProduto(String interessePrincipalProduto) {
        this.interessePrincipalProduto = interessePrincipalProduto;
    }
}