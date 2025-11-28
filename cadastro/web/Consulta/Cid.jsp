<%@page import="model.Cliente"%>
<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Consulta por ID</title>
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
        <h2>Consulta de Cliente por ID</h2>

        <form method="post">
            <label>ID do Cliente:</label>
            <input type="number" name="id" required>
            <br><br>
            <button type="submit" class=" btn btn-primary">Consultar</button>
            <a href="ConsultaGeral.jsp" class=" btn btn-light">Retornar</a>
        </form>

        <%
            String paramId = request.getParameter("id");
            if (paramId != null) {
                try {
                    int id = Integer.parseInt(paramId);
                    ClienteDAO dao = new ClienteDAO();
                    Cliente cli = dao.consultaPorId(id);

                    if (cli != null) {
                            out.println("<div class='container mt-4'>");
                            out.println("<h3 class='mb-4'>Cliente #" + cli.getId() + "</h3>");

                            out.println("<div class='row g-3'>");

                            // Nome
                            out.println("<div class='col-md-6'>");
                            out.println("<label class='form-label'><strong>Nome</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getNome() + "' disabled>");
                            out.println("</div>");

                            // Sobrenome
                            out.println("<div class='col-md-6'>");
                            out.println("<label class='form-label'><strong>Sobrenome</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getSobrenome() + "' disabled>");
                            out.println("</div>");

                            // Email
                            out.println("<div class='col-md-12'>");
                            out.println("<label class='form-label'><strong>E-mail Comercial</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getEmailComercial() + "' disabled>");
                            out.println("</div>");

                            // Telefone
                            out.println("<div class='col-md-12'>");
                            out.println("<label class='form-label'><strong>Telefone Comercial</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getTelefoneComercial() + "' disabled>");
                            out.println("</div>");

                            // Função
                            out.println("<div class='col-md-6'>");
                            out.println("<label class='form-label'><strong>Função / Cargo</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getFuncaoCargo() + "' disabled>");
                            out.println("</div>");

                            // Departamento
                            out.println("<div class='col-md-6'>");
                            out.println("<label class='form-label'><strong>Departamento</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getAreaFuncionalDepartamento() + "' disabled>");
                            out.println("</div>");

                            // Organização
                            out.println("<div class='col-md-4'>");
                            out.println("<label class='form-label'><strong>Organização</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getNomeDeSuaOrganizacao() + "' disabled>");
                            out.println("</div>");

                            // País
                            out.println("<div class='col-md-4'>");
                            out.println("<label class='form-label'><strong>País / Região</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getPaisRegiao() + "' disabled>");
                            out.println("</div>");

                            // CEP
                            out.println("<div class='col-md-4'>");
                            out.println("<label class='form-label'><strong>CEP</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getCepCodigoPostal() + "' disabled>");
                            out.println("</div>");

                            // Interesse
                            out.println("<div class='col-md-12'>");
                            out.println("<label class='form-label'><strong>Interesse</strong></label>");
                            out.println("<input type='text' class='form-control' value='" + cli.getInteressePrincipalProduto() + "' disabled>");
                            out.println("</div>");

                            out.println("</div>"); 
                            out.println("</div><br><br>");
                    } else {
                        out.println("<br><div class=''>Nenhum cliente encontrado com esse ID</div>");
                    }

                } catch (NumberFormatException e) {
                    out.println("<br><div class=''>ID inválido</div>");
                }
            }
        %>
        
        </div>
    </body>
</html>