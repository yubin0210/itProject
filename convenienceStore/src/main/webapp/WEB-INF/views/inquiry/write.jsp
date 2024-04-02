<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
.container {
    max-width: 800px;
    background-color: #f4f4f4;
    padding: 20px;
    border-radius: 8px; 
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin: auto;
}

form p {
    margin-bottom: 15px; 
}

form input[type="text"] {
    width: 100%; 
    padding: 10px; 
    border: 1px solid #ccc; 
    border-radius: 4px; 
    box-sizing: border-box;
}

form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc; 
    border-radius: 4px; 
    box-sizing: border-box;
    resize: none;
}

form input[type="submit"] {
    width: 100%; 
    padding: 10px;
    background-color: #007bff; 
    color: white; 
    border: none; 
    border-radius: 4px; 
    cursor: pointer; 
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}

</style>

<div class="container">
    <form method="POST">
        <p><input type="text" name="title" placeholder="제목" required autofocus></p>
        <p><textarea name="answer" placeholder="답변" required rows="5"></textarea></p>
        <p><input type="submit" value="완료"></p>
    </form>
</div>


</body>
</html>