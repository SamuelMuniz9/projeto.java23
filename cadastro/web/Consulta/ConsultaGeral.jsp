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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="" />
        
        
        <!<!-- Link para funcionamento do frontend -->

        <link rel="stylesheet" href="../resources/styles.css">
        <link rel="stylesheet" href="../resources/reset.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link
          rel="canonical"
          href="https://getbootstrap.com/docs/5.3/examples/sidebars/"
        />
        <script src="../JS/color-modes.js"></script>
        <link href="../resources/bootstrap.min.css" rel="stylesheet" /> 
        <meta name="theme-color" content="#712cf9" />
        <link href="../resources/reset.css" rel="stylesheet" />
        <link href="../resources/estoque.css" rel="stylesheet" />
        
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
        out.println("<div class='fs-3 card-title cliente-card'><br>");
        out.println("<h3 class= 'fs-3 card-title' >Cliente #" + cli.getId() + "</h3>");
        out.println("<ul>");
        out.println("<li class= 'fs-5 card-title'><strong>Nome:</strong> " + cli.getNome() + " " + cli.getSobrenome() + "</li>");
        out.println("<li class= 'fs-5 card-title'><strong>E-mail:</strong> " + cli.getEmailComercial() + "</li>");
        out.println("<li class= 'fs-5 card-title'><strong>Telefone:</strong> " + cli.getTelefoneComercial() + "</li>");
        out.println("<li class= 'fs-5 card-title'><strong>Função/Cargo:</strong> " + cli.getFuncaoCargo() + "</li>");
        out.println("<li class= 'fs-5 card-title'><strong>Departamento:</strong> " + cli.getAreaFuncionalDepartamento() + "</li>");
        out.println("<li class= 'fs-5 card-title'><strong>Organização:</strong> " + cli.getNomeDeSuaOrganizacao() + "</li>");
        out.println("<li class= 'fs-5 card-title'><strong>País/Região:</strong> " + cli.getPaisRegiao() + "</li>");
        out.println("<li class= 'fs-5 card-title'><strong>CEP:</strong> " + cli.getCepCodigoPostal() + "</li>");
        out.println("<li class= 'fs-5 card-title'><strong>Interesse:</strong> " + cli.getInteressePrincipalProduto() + "</li>");
        out.println("</ul>");
        out.println("</div>");

    n_reg++;
            }
                        
        %>
        
      <p><a href="../" class="card-title btn btn-light">Retornar</a></p>

    </body>
</html>