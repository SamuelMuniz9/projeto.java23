<%@page import="model.DAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Deletar Cliente</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles.css">
</head>
<body>
    <div class="container">
        <!-- Título -->
        <h2>Deletar Cliente</h2>

        <!-- Formulário -->
        <form method="post" class="form-atualizar">
            <div class="form-group">
                <label for="id">ID do Cliente a deletar:</label>
                <input type="number" id="id" name="id" placeholder="Digite o ID do cliente" required>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn danger">Deletar</button>
            </div>
        </form>

        <!-- Mensagem de status -->
        <div class="status-message">
            <%
                String paramId = request.getParameter("id");
                if (paramId != null) {
                    try {
                        int id = Integer.parseInt(paramId);
                        ClienteDAO dao = new ClienteDAO();
                        if (dao.deletar(id)) {
                            out.println("<p class='success'>✅ Cliente deletado com sucesso!</p>");
                        } else {
                            out.println("<p class='error'>❌ Nenhum cliente encontrado com esse ID.</p>");
                        }
                    } catch (NumberFormatException e) {
                        out.println("<p class='error'>⚠️ ID inválido.</p>");
                    } catch (Exception e) {
                        out.println("<p class='error'>Erro: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
