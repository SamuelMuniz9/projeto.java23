/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.*;
/**
 *
 * @author icaro_
 */
public class Conexao {
    
    
    private static final String URL = "jdbc:mysql://localhost:3306/cadastropessoal"; 
    private static final String USER = "root";  // seu usuário MySQL
    private static final String PASS = ""; // sua senha MySQL

    public static Connection conecta() {
        try {
            // Carregar driver do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Retorna a conexão válida
            return DriverManager.getConnection(URL, USER, PASS);

        } catch (ClassNotFoundException e) {
            System.out.println("⚠ Driver MySQL não encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("⚠ Erro ao conectar com o banco: " + e.getMessage());
        }

        return null; // se falhar, volta null (precisamos tratar no DAO)
    }
}
