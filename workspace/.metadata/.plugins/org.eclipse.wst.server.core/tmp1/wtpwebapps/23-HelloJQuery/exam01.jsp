<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
   /* jQuery 사용법 2 */
    $(function(){
        var h1 = document.getElementById("hello");
        h1.innerHTML = "Hello jQeury";
    });

   
/* jQuery 사용법 1 
       function hello(){
    	var h1 = document.getElementById("hello"); //아이디로 태그를 얻어옴
    	h1.innerHTML = "Hello jQeury";
    }
*/    
    
    // javascript의 onload 이벤트와 같은 효과 
    jQeury(hello);
    
    
/*    window.onload = function(){ //onload : 브라우저가 모든 태그를 인식한다음 호출되어지는 이벤트 속성
    	hello();
    }
*/
</script>
</head>
<body>
<h1 id="hello">Hello</h1>
</body>
</html>