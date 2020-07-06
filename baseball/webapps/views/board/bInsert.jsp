<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content ="width=device-width, initial-scale=1">
<script src="/baseball/resources/js/jquery-2.2.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
<meta charset="UTF-8">
    <style>
button {
   	background : lightgray;
 	border : 1px solid black;
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 30px;
 
</style>

<title>야구야 놀자!</title>

</head>

<%@ include file="../common/header.jsp" %>
	    <div class="outer">
            <br>
            <h2 align="center">응원 게시판 작성</h2>
            <br>
            <div class="tableArea">
                <form action="<%= request.getContextPath() %>/bInsert.cb" 
                      method="post" enctype="multipart/form-data">
                      <table  align="center">
                        <tr>
                            <td>제목 </td>
                            <td ><input type="text" size="50" name="title"></td>
                        </tr>
                        <tr><td><br><td></tr>
                        <tr>
                            <td>작성자 </td>
                            <td>
                            <input type="text" size ="10" name="userId" value="<%=m.getUserid() %>"readonly="readonly">
                            </td>
                        </tr>
                           <tr><td><br><td></tr>
                           <tr>
                            <td>팀명</td>
                            <td> 
                            <select name="teamname">
                           	 	<option value="SK 와이번스">SK 와이번스</option>
                          	  	<option value="한화 이글스">한화 이글스</option>
                           		<option value="두산 베어스">두산 베어스</option>
                            	<option value="롯데 자이언츠">롯데 자이언츠</option>
                            	<option value="키움 히어로즈">키움 히어로즈</option>
                            	<option value="KIA 타이거즈">KIA 타이거즈</option>
                       		 	<option value="LG 트윈스">LG 트윈스</option>
                       			<option value="삼성 라이온즈">삼성 라이온즈</option> 
                       		 	<option value="kt wiz">kt wiz</option>
                       		    <option value="NC 다이노스">NC 다이노스</option>
                       		    
                       		 </select>
                        </td>
                        </tr>
                           <tr><td><br><td></tr>
                        <tr>
                            <td>첨부파일 </td>
                            <td > 
                                <input type="file" name="file" id="file" />
                            </td>
                        </tr>
                           <tr><td><br><td></tr>
                        <tr>
                            <td>내용 </td>
                            <td>
                                <textarea name="content" cols="60" rows="20" style="resize:none;"></textarea>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div align="center">
                        <button type="submit">등록하기</button> &nbsp; &nbsp;
                         <button type="button" class="btn" onclick="location.href='selectList.cb'">돌아가기</button>
                    </div>
                </form>
            </div>
        </div>
        <br><br><br>
<%@ include file="../common/footer.jsp" %>
</html>