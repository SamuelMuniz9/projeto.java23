/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DAO;

import config.Conexao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Produtos;
/**
 *
 * @author gta98
 */
public class ProdutosDAO {
    public boolean inserir(Produtos p) {
        String sql = "INSERT INTO produtos (nome, categoria, preco_venda, preco_custo, unidade_medida) "
                + "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = Conexao.conecta();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, p.getNome());
            stmt.setString(2, p.getCategoria());
            stmt.setDouble(3, p.getPreco_venda());
            stmt.setDouble(4, p.getPreco_custo());
            stmt.setString(5, p.getUnidade_medida());
            
            stmt.execute();
            return true;
            
        } catch (SQLException e) {
            System.out.println("Erro ao inserir produto: " + e.getMessage());
            return false;
        }
    }
    
    public List<Produtos> listar() {
        List<Produtos> lista = new ArrayList<>();
        String sql = "SELECT * FROM produtos";
        
        try (Connection conn = Conexao.conecta();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Produtos p = new Produtos();
                p.setId_produto(rs.getInt("id_produto"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setPreco_venda(rs.getDouble("preco_venda"));
                p.setPreco_custo(rs.getDouble("preco_custo"));
                p.setUnidade_medida(rs.getString("unidade_medida"));
                
                lista.add(p);    
            }    
        } catch (SQLException e) {
            System.out.println("Erro ao listar produtos: " + e.getMessage());
        }

        return lista;
    }


public Produtos buscarPorId(int id) {
        String sql = "SELECT * FROM produtos WHERE id_produto = ?";
        Produtos p = null;

        try (Connection conn = Conexao.conecta();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                p = new Produtos();
                p.setId_produto(rs.getInt("id_produto"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setPreco_venda(rs.getDouble("preco_venda"));
                p.setPreco_custo(rs.getDouble("preco_custo"));
                p.setUnidade_medida(rs.getString("unidade_medida"));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar produto: " + e.getMessage());
        }

        return p;
    }


    public boolean atualizar(Produtos p) {
        String sql = "UPDATE produtos SET nome=?, categoria=?, preco_venda=?, preco_custo=?, unidade_medida=? "
                   + "WHERE id_produto=?";

        try (Connection conn = Conexao.conecta();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, p.getNome());
            stmt.setString(2, p.getCategoria());
            stmt.setDouble(3, p.getPreco_venda());
            stmt.setDouble(4, p.getPreco_custo());
            stmt.setString(5, p.getUnidade_medida());
            stmt.setInt(6, p.getId_produto());

            stmt.execute();
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar produto: " + e.getMessage());
            return false;
        }
    }

    public boolean excluir(int id) {
        String sql = "DELETE FROM produtos WHERE id_produto = ?";

        try (Connection conn = Conexao.conecta();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.execute();
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao excluir produto: " + e.getMessage());
            return false;
        }
    }
}    
