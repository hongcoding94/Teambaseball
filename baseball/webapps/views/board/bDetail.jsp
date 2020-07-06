<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.board.model.vo.*,
    com.boardcomment.model.vo.*, java.util.*"%>
<%
	Board b = (Board)request.getAttribute("board");
	ArrayList<BComment> bclist = 
			(ArrayList<BComment>)request.getAttribute("bclist"); 
%>
  
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootsdivapcdn.com/bootsdivap/4.5.0/css/bootsdivap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <script src="/baseball/resources/js/jquery-2.2.4.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm">
<title>야구야 놀자!</title>    
<style>
button {
   	background : lightgray;
 	border : 1px solid black;
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 30px;
    }

.replyArea {
		width:800px;
		margin-left:auto;
		margin-right:auto;
		padding-bottom : 5px;
	}
.replyArea textArea {
		border-radius: 10px;
		resize: none;
	}    
 
</style>


</head>

          <%@ include file="../common/header.jsp" %>   
          <% if(m != null) { %>
	<br>
            <h2 class="col" style="text-align:center">응원 게시판내용</h2>

         <aside class="col-1"></aside>
     	
     	 <div class="row">
        
         <aside class="col-3"></aside>
           
         <section class="col-6">
			<div class="row">
            	<div class="col" style="align:center">
                   <div class="row">
                       <div class="col" style="font-size: medium;">
                           <b>제목 :</b>
                              <span>
                               <%= b.getBtitle() %>
                              </span>
                        </div>
                    </div>
                    <br style="margin-top: -1%;" />

                    <div>
                         <div class="row">
                             <div class="col-5" style="font-size: medium;">
                                 <b>작성자 :</b>
                                     <span readonly="readonly"><%= b.getBwriter() %>
                                      </span>
                               </div>
                              
                             <div class="col-4" style="font-size: medium;">
                                 <b>작성일 :</b>
                                    <span>
                                      <%= b.getBdate() %>  
                                     </span>
                             </div>
                             <div class="col-3" style="font-size: medium;">
                                  <b>조회수 :</b>
                                     <span>
                                        <%= b.getBcount()%>
                                     </span>
                              </div>
                          <br style="margin-top: -1%;" />
  
                          <textarea class="col-12 border" 
                               style="width: 100%; height:500px; resize:none;" ><%= b.getBcontent()%>   
                            </textarea>
                        </div>
               		</div>
			 </div>
			 </div>
        </section>
            <aside class="col-3"></aside>
        </div>

        <div class="row">
            <aside class="col-3"></aside>
            <section class="col-6   ">

                <div style="margin: auto;" align="center" >
                    <br />

					 <% if( m != null && m.getUserid().equals(b.getBwriter())) { %>
                    <button class="btn" onclick="location.href='bUpView.cb?bno=<%=b.getBno()%>'">수정하기</button>
                    &nbsp;&nbsp;&nbsp;&nbsp; 
                   <% } %>
                    <button class="btn" onclick="location.href='selectList.cb'">돌아가기</button>
                    </div>
            </section>
            <aside class="col-1 "></aside>
        </div>
            <div id="disqus_thread"></div>
   
		
		<div class="replyArea">
			<div class="replyWriteArea">
				<form action="/baseball/bcInsert.do" method="post">
					<input type="hidden" name="bcwriter" value="<%=m.getUserid()%>"/>
					<input type="hidden" name="bno" value="<%=b.getBno() %>" />
					<input type="hidden" name="refbcno" value="0" />
					<input type="hidden" name="bclevel" value="1" />
					
					<table align="center">
						<tr>
							<td>댓글 작성</td>
							<td><textArea rows="3" cols="80" id="replyContent" name="replyContent"></textArea></td>
							<td><button type="submit" id="addReply">댓글 등록</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="replySelectArea"> <!-- 게시글의 댓글 목록 구현부 -->
			<% if( bclist.size() != 0) { %>
				<% for(BComment bco : bclist) { %>		
				<%-- 댓글 목록이 있다면 --%>		
				
				<table id="replySelectTable"
	      	 style="margin-left : <%= (bco.getBclevel()-1) * 15 %>px;
	      	 		width : <%= 800 - ((bco.getBclevel()-1) * 15)%>px;"
	      	 class="replyList<%=bco.getBclevel()%>">
		  		<tr>
		  			<td rowspan="2"> </td>
					<td><b><%= bco.getBcwriter() %></b></td>
					<td><%= bco.getBcdate() %></td>
					<td align="center">
 					<%if(m.getUserid().equals(bco.getBcwriter())) { %>
						<input type="hidden" name="bcno" value="<%=bco.getBcno()%>"/>
							  
						<button type="button" class="updateBtn" 
							onclick="updateReply(this);">수정하기</button>
							
						<button type="button" class="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none;" >수정완료</button> &nbsp;&nbsp;
							
						<button type="button" class="deleteBtn"
							onclick="deleteReply(this);">삭제하기</button>
							
					<% } else if( bco.getBclevel() < 3) { %>
						<input type="hidden" name="bcwriter" value="<%=m.getUserid()%>"/>
						<input type="hidden" name="refbcno" value="<%= bco.getBcno() %>" />
						<input type="hidden" name="bclevel" value="<%=bco.getBclevel() %>" />
						<button type="button" class="insertBtn" 
							 onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
							 
						<button type="button" class="insertConfirm"
							onclick="reConfirm(this);"
							style="display:none;" >댓글 추가 완료</button> 
							
					<% } else {%>
						<span> 마지막 레벨입니다.</span>
					<% } %>
					</td>
				</tr>
				<tr class="comment replyList<%=bco.getBclevel()%>">
					<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="105" rows="3"
					 readonly="readonly"><%= bco.getBccontent() %></textarea>
					</td>
				</tr>
			</table>
			
			
				
			<% } } else { %>
				<%-- 댓글 목록이 없다면 --%>
				
				<p>
					현재 등록된 댓글의 내용이 없습니다. <br>
					첫 댓글의 주인공이 되어 보세요!
				</p>
			<% } %>				
			</div>
		</div>
            
            
	<script>
	function updateReply(obj) {
		// 현재 위치와 가장 근접한 textarea 접근하기
		$(obj).parent().parent().next().find('textarea')
		.removeAttr('readonly');
		
		// 수정 완료 버튼을 화면 보이게 하기
		$(obj).siblings('.updateConfirm').css('display','inline');
		
		// 수정하기 버튼 숨기기
		$(obj).css('display', 'none');
	}
	
	function updateConfirm(obj) {
		// 댓글의 내용 가져오기
		var content
		  = $(obj).parent().parent().next().find('textarea').val();
		
		// 댓글의 번호 가져오기
		var cno = $(obj).siblings('input').val();
		
		// 게시글 번호 가져오기
		var bno = '<%=b.getBno()%>';
		
		location.href="/baseball/updateComment.bo?"
				 +"cno="+cno+"&bno="+bno+"&content="+content;
	}
	
	function deleteReply(obj) {
		// 댓글의 번호 가져오기
		var cno = $(obj).siblings('input').val();
		
		// 게시글 번호 가져오기
		var bno = '<%=b.getBno()%>';
		
		location.href="/myWeb/deleteComment.bo"
		+"?cno="+cno+"&bno="+bno;
	}
	
	function reComment(obj){
		// 추가 완료 버튼을 화면 보이게 하기
		$(obj).siblings('.insertConfirm').css('display','inline');
		
		// 클릭한 버튼 숨기기
		$(obj).css('display', 'none');
		
		// 내용 입력 공간 만들기
		var htmlForm = 
			'<tr class="comment"><td></td>'
				+'<td colspan="3" style="background : transparent;">'
					+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
				+ '</td>'
			+ '</tr>';
		
		$(obj).parents('table').append(htmlForm);
		
	}
	
	function reConfirm(obj) {
		// 댓글의 내용 가져오기
		
		// 참조할 댓글의 번호 가져오기
		var refcno = $(obj).siblings('input[name="refbcno"]').val();
		var level = Number($(obj).siblings('input[name="bclevel"]').val()) + 1;
		
		// console.log(refcno + " : " + level);
		
		// 게시글 번호 가져오기
		var bno = '<%=b.getBno()%>';
		
		var parent = $(obj).parent();
		var grandparent = parent.parent();
		var siblingsTR = grandparent.siblings().last();
		
		var content = siblingsTR.find('textarea').val();
		
		// console.log(parent.html());
		// console.log(grandparent.html());
		// console.log(siblingsTR.html());
		
		// console.log(content);

		// writer, replyContent
		// bno, refcno, clevel
		
		location.href='/baseball/bcInsert.do'
		           + '?writer=<%= m.getUserid() %>' 
		           + '&replyContent=' + content
		           + '&bno=' + bno
		           + '&refbcno=' + refbcno
		           + '&bclevel=' + level;
	}
	</script>

	<% } else {
		request.setAttribute("msg", "회원만 가능한 서비스 입니다.");
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	}
	%>

    <br />
    <br />
    <br />
    <br />
      <%@ include file="../common/footer.jsp" %>   


</html>