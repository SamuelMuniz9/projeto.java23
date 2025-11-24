<%-- 
    Document   : ConsultaGeral
    Created on : 7 de set. de 2025, 15:51:38
    Author     : Carlos eduardo  rgm:11241104093
 * Ryan miranda  rgm:11241100686
 * Angelo andrade  rgm:
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cliente"%>
<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Consulta de Clientes - Geral</h2>
        <div class="consult">
        <%            
            ClienteDAO cliDAO = new ClienteDAO();
            List<Cliente> lst = new ArrayList();         
            lst = cliDAO.consultaGeral();

            int n_reg = 0;
    for (Cliente cli : lst) {
        out.println("<div class='cliente-card'><br>");
        out.println("<h3>Cliente #" + cli.getId() + "</h3>");
        out.println("<ul>");
        out.println("<li><strong>Nome:</strong> " + cli.getNome() + " " + cli.getSobrenome() + "</li>");
        out.println("<li><strong>E-mail:</strong> " + cli.getEmailComercial() + "</li>");
        out.println("<li><strong>Telefone:</strong> " + cli.getTelefoneComercial() + "</li>");
        out.println("<li><strong>Função/Cargo:</strong> " + cli.getFuncaoCargo() + "</li>");
        out.println("<li><strong>Departamento:</strong> " + cli.getAreaFuncionalDepartamento() + "</li>");
        out.println("<li><strong>Organização:</strong> " + cli.getNomeDeSuaOrganizacao() + "</li>");
        out.println("<li><strong>País/Região:</strong> " + cli.getPaisRegiao() + "</li>");
        out.println("<li><strong>CEP:</strong> " + cli.getCepCodigoPostal() + "</li>");
        out.println("<li><strong>Interesse:</strong> " + cli.getInteressePrincipalProduto() + "</li>");
        out.println("</ul>");
        out.println("</div>");

    n_reg++;
            }
                        
        %>
    </body>
</html>