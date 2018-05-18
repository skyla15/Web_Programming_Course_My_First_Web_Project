<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<head>

<body>
<!-- post방식을 통하여 num3_2.jsp로 값들을 넘겨줍니다 -->
<form action=num3_2.jsp method="post" name="main">

아이디 : <input type=text name="name_val">
<br>

회원님이 관심있는 스포츠를 선택하세요.
<br>
<!-- 문제 1번과 같이 hobby에 운동 종목들을 모아줍니다.-->
축구<input type="checkbox" name="hobby" value="축구">
농구<input type="checkbox" name="hobby" value="농구">
야구<input type="checkbox" name="hobby" value="야구">
배구<input type="checkbox" name="hobby" value="골프">
<br>
<input type="submit" value="확인"></input>
<!-- form tag를 초기화하기 위해 함수를 추가합니다.-->
<input type="reset" name="reset" value="취소" onClick="ClearFields();"></input>

</form>

<script>
$(function(){
    $("reset").click(function(){
        $("main").reset();
        //reset을 통해 form 태그를 초기화해줍니다.
    })
})
</script>


<!--여러개의 엘리먼트가 들어올 때 form을 이용 -->



</body>
</html>
