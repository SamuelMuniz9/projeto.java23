package model.DAO;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import config.Conexao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
/**
 *
 * @author icaro_
 */
public class ClienteDAO {
    
    private Connection conn;

    public ClienteDAO() {
        this.conn = Conexao.conecta();
        if (this.conn == null) {
            throw new RuntimeException("❌ Conexão com o banco não foi estabelecida!");
        }
    }

    public List<Cliente> consultaGeral() throws ClassNotFoundException {
    List<Cliente> list = new ArrayList<>();
    String sql = "SELECT * FROM clientes";


    try (Connection conn = Conexao.conecta();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            Cliente cli = new Cliente();
            cli.setId(rs.getInt("id_cliente"));
            cli.setNome(rs.getString("nome"));
            cli.setSobrenome(rs.getString("sobrenome"));
            cli.setEmailComercial(rs.getString("emailComercial"));
            cli.setTelefoneComercial(rs.getString("telefoneComercial"));
            cli.setFuncaoCargo(rs.getString("funcaoCargo"));
            cli.setAreaFuncionalDepartamento(rs.getString("areaFuncionalDepartamento"));
            cli.setNomeDeSuaOrganizacao(rs.getString("nomeDeSuaOrganizacao"));
            cli.setPaisRegiao(rs.getString("paisRegiao"));
            cli.setCepCodigoPostal(rs.getString("cepCodigoPostal"));
            cli.setInteressePrincipalProduto(rs.getString("interessePrincipalProduto"));
            list.add(cli);
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
      
    }

    return list;
    }

    
    public boolean cadastrar(Cliente cliente) throws ClassNotFoundException {
    // Conexão
    Connection conn = Conexao.conecta();
    if (conn == null) {
        throw new RuntimeException("❌ Conexão não estabelecida!");
    }

    String sql = "INSERT INTO clientes (" +
"    nome," +
"    sobrenome," +
"    emailComercial," +
"    telefoneComercial," +
"    funcaoCargo," +
"    areaFuncionalDepartamento," +
"    nomeDeSuaOrganizacao," +
"    paisRegiao," +
"    cepCodigoPostal," +
"    interessePrincipalProduto" +
") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


    try (PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, cliente.getNome());
        stmt.setString(2, cliente.getSobrenome());
        stmt.setString(3, cliente.getEmailComercial());
        stmt.setString(4, cliente.getTelefoneComercial());
        stmt.setString(5, cliente.getFuncaoCargo());
        stmt.setString(6, cliente.getAreaFuncionalDepartamento());
        stmt.setString(7, cliente.getNomeDeSuaOrganizacao());
        stmt.setString(8, cliente.getPaisRegiao());
        stmt.setString(9, cliente.getCepCodigoPostal());
        stmt.setString(10, cliente.getInteressePrincipalProduto());

        stmt.executeUpdate();
        System.out.println("✅ Registro incluído com sucesso!");

        return true;

    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    } finally {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
    public Cliente consultaPorId(int id) throws ClassNotFoundException {
    String sql = "SELECT * FROM clientes WHERE id_cliente = ?";

    try (Connection conn = Conexao.conecta();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, id);

        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                Cliente cli = new Cliente();
                cli.setId(rs.getInt("id_cliente"));
                cli.setNome(rs.getString("nome"));
                cli.setSobrenome(rs.getString("sobrenome"));
                cli.setEmailComercial(rs.getString("emailComercial"));
                cli.setTelefoneComercial(rs.getString("telefoneComercial"));
                cli.setFuncaoCargo(rs.getString("funcaoCargo"));
                cli.setAreaFuncionalDepartamento(rs.getString("areaFuncionalDepartamento"));
                cli.setNomeDeSuaOrganizacao(rs.getString("nomeDeSuaOrganizacao"));
                cli.setPaisRegiao(rs.getString("paisRegiao"));
                cli.setCepCodigoPostal(rs.getString("cepCodigoPostal"));
                cli.setInteressePrincipalProduto(rs.getString("interessePrincipalProduto"));
                return cli;
            }
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return null; // se não encontrar o ID
}


    // Consulta por Nome (retorna lista, pode haver múltiplos)
    
    public List<Cliente> consultaPorNome(String nome) throws ClassNotFoundException {
    List<Cliente> list = new ArrayList<>();
    String sql = "SELECT * FROM clientes WHERE nome LIKE ?";

    try (Connection conn = Conexao.conecta();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, "%" + nome + "%");

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setId(rs.getInt("id_cliente"));
                cli.setNome(rs.getString("nome"));
                cli.setSobrenome(rs.getString("sobrenome"));
                cli.setEmailComercial(rs.getString("emailComercial"));
                cli.setTelefoneComercial(rs.getString("telefoneComercial"));
                cli.setFuncaoCargo(rs.getString("funcaoCargo")); // corrigido
                cli.setAreaFuncionalDepartamento(rs.getString("areaFuncionalDepartamento")); // corrigido
                cli.setNomeDeSuaOrganizacao(rs.getString("nomeDeSuaOrganizacao")); // corrigido
                cli.setPaisRegiao(rs.getString("paisRegiao"));
                cli.setCepCodigoPostal(rs.getString("cepCodigoPostal")); // corrigido
                cli.setInteressePrincipalProduto(rs.getString("interessePrincipalProduto")); // corrigido

                list.add(cli);
            }
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return list;
}


        
        // UPDATE - Atualiza todos os campos de um cliente pelo ID
    public boolean atualizar(Cliente cliente) throws ClassNotFoundException {
    String sql = "UPDATE clientes SET "
            + "nome = ?, "
            + "sobrenome = ?, "
            + "emailComercial = ?, "
            + "telefoneComercial = ?, "
            + "funcaoCargo = ?, "
            + "areaFuncionalDepartamento = ?, "
            + "nomeDeSuaOrganizacao = ?, "
            + "paisRegiao = ?, "
            + "cepCodigoPostal = ?, "
            + "interessePrincipalProduto = ? "
            + "WHERE id_cliente = ?";

    try (Connection conn = Conexao.conecta();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, cliente.getNome());
        stmt.setString(2, cliente.getSobrenome());
        stmt.setString(3, cliente.getEmailComercial());
        stmt.setString(4, cliente.getTelefoneComercial());
        stmt.setString(5, cliente.getFuncaoCargo());
        stmt.setString(6, cliente.getAreaFuncionalDepartamento());
        stmt.setString(7, cliente.getNomeDeSuaOrganizacao());
        stmt.setString(8, cliente.getPaisRegiao());
        stmt.setString(9, cliente.getCepCodigoPostal());
        stmt.setString(10, cliente.getInteressePrincipalProduto());
        stmt.setInt(11, cliente.getId());

        return stmt.executeUpdate() > 0;

    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    }
}


    // DELETE - Deleta um cliente pelo ID
    public boolean deletar(int id) {
        String sql = "DELETE FROM clientes WHERE id_cliente = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int linhas = stmt.executeUpdate();
            return linhas > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
    



