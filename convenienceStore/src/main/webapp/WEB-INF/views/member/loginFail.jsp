<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>



<script>
   const cpath = '${cpath }'

      alert('아이디 또는 비밀번호가 일치하지 않습니다')
      location.href = cpath + '/member/login'
      
</script>


</body>
</html>