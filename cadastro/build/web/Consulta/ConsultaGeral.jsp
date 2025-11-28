<%-- 
    Document   : ConsultaGeral
    Created on : 7 de set. de 2025, 15:51:38
    Author     : Carlos eduardo  rgm:11241104093
 * Ryan miranda  rgm:11241100686
 * Angelo andrade  rgm:
--%>

<%@page import="model.DAO.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cliente"%>
<%@page import="model.Cliente"%>
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
        
        
        <!<!-- sidebar -->
        <link rel="stylesheet" href="../resources/sidebars.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
          rel="stylesheet"
        />
        <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,0"
        />
        <link
          href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
          rel="stylesheet"
        />
        <script src="https://unpkg.com/akar-icons-fonts"></script>
        
    </head>
    <body>
        <!--sidebar-->
    
        <aside class="sidebar">
          <div class="left">
           <br>
            <button>
              <i class=" ai-home-alt1"></i>
            </button>


            <button>
              <a href="../"><i class="ai-link-out"></i></a>
            </button>

          </div>
          <div class="right">
            <h1>📋 Consulta</h1>
            <nav class="buttons">
              <button>
                 <a href="ConsultaGeral.jsp" class="fs-2 btn card-title"><i class="ai-dashboard"></i></a>
                <span>Geral</span>
              </button>

            </nav>
            <h2>🔎 Consulta Por: </h2>
            <nav class="buttons">
              <button>
                <a href="Cnome.jsp" class=" fs-2 btn card-title"><i class="ai-people-multiple"></i></a>
                <span>Nome</span>
              </button>
              <button>
                <a href="Cid.jsp" class="fs-2 btn card-title"><i class="ai-statistic-up"></i></a>
                <span>Id</span>
              </button>
            </nav>
          </div>
        </aside>
        <div style="margin-left:150px">
        <h2>Consulta de Clientes - Geral</h2>
  <div id="carouselClientes" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">

        <%
            ClienteDAO cliDAO = new ClienteDAO();
            List<Cliente> lst = cliDAO.consultaGeral();
            int index = 0;

            for (Cliente cli : lst) {
        %>

        <div class="carousel-item <%= (index == 0 ? "active" : "") %>">
            <div class='container mt-4'>
                <h3 class='mb-4'>Cliente #<%= cli.getId() %></h3>
                <div class='row g-3'>

                    <div class='col-md-6'>
                        <label><strong>Nome</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getNome() %>' disabled>
                    </div>

                    <div class='col-md-6'>
                        <label><strong>Sobrenome</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getSobrenome() %>' disabled>
                    </div>

                    <div class='col-md-12'>
                        <label><strong>E-mail Comercial</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getEmailComercial() %>' disabled>
                    </div>

                    <div class='col-md-12'>
                        <label><strong>Telefone Comercial</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getTelefoneComercial() %>' disabled>
                    </div>

                    <div class='col-md-6'>
                        <label><strong>Função / Cargo</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getFuncaoCargo() %>' disabled>
                    </div>

                    <div class='col-md-6'>
                        <label><strong>Departamento</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getAreaFuncionalDepartamento() %>' disabled>
                    </div>

                    <div class='col-md-4'>
                        <label><strong>Organização</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getNomeDeSuaOrganizacao() %>' disabled>
                    </div>

                    <div class='col-md-4'>
                        <label><strong>País / Região</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getPaisRegiao() %>' disabled>
                    </div>

                    <div class='col-md-4'>
                        <label><strong>CEP</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getCepCodigoPostal() %>' disabled>
                    </div>

                    <div class='col-md-12'>
                        <label><strong>Interesse</strong></label>
                        <input type='text' class='form-control' value='<%= cli.getInteressePrincipalProduto() %>' disabled>
                    </div>

                </div>
            </div>
        </div>

        <%
                index++;
            }
        %>

    </div>

    <!-- Botões de navegação -->
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselClientes" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>

    <button class="carousel-control-next" type="button" data-bs-target="#carouselClientes" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

        </div>
        <!<!---->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    </body>
</html>