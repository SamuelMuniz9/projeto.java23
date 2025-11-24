/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author gta98
 */
public class Produtos {
   private int id_produto;
   private String nome;
   private String categoria;
   private double preco_venda;
   private double preco_custo;
   private String unidade_medida;
   
   public int getId_produto() {
       return id_produto;
   }
   
   public void setId_produto(int id_produto) {
       this.id_produto = id_produto;
   }
   
   public String getNome() {
       return nome;
   }
   
   public void setNome(String nome) {
       this.nome = nome;
   }
   
   public String getCategoria() {
       return categoria;
   }
   
   public void setCategoria(String categoria) {
       this.categoria = categoria;
   }
   
   public double getPreco_venda() {
       return preco_venda;
   }
   
   public void setPreco_venda(double preco_venda) {
       this.preco_venda = preco_venda;
   }
   
   public double getPreco_custo() {
       return preco_custo;
   }
   
   public void setPreco_custo(double preco_custo) {
       this.preco_custo = preco_custo;
   }
   
   public String getUnidade_medida() {
       return unidade_medida;
   }
   
   public void setUnidade_medida(String unidade_medida) {
       this.unidade_medida = unidade_medida;
   }
}
