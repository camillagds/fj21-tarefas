<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>..:: Tarefas ::.</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<link type="text/css" href="resources/css/tarefas.css" rel="stylesheet">
</head>
<body>
	<script type="text/javascript">
		function finalizaAgora(id) {
			$.post("finalizaTarefa", {'id' : id}, 
					function(resposta){
						$("#tarefa_"+id).html(resposta);
					}
			);
		}
	</script>
	<script type="text/javascript">
		function removeAgora(id) {
			$.post("removeTarefa", {'id' : id}, 
					function(){
						$("#tarefa_"+id).parents("tr").hide();
					}
			);
		}
	</script>
	<a href="novaTarefa">Criar nova tarefa</a>
	<br />
	<br />

	<table border="1px">
		<tr bgcolor="#ffb7bb">
			<th>Id</th>
			<th>Descrição</th>
			<th>Finalização</th>
			<th>Data de Finalização</th>
			<th/>
			<th/>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr id="tarefa_${tarefa.id}">
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td><a href="#"
						onclick="finalizaAgora(${tarefa.id})">Finalizar</a></td>
				</c:if>
				<c:if test="${tarefa.finalizado eq true}">
					<td>Finalizado</td>
				</c:if>
				<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
						pattern="dd/MM/yyyy" /></td>
				<td><a href="#"
						onclick="removeAgora(${tarefa.id})">Remover</a>
				<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a>
			</tr>
		</c:forEach>
	</table>
</body>
</html>