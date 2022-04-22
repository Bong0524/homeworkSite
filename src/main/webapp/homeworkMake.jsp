<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<style>
#questTitle{
	width: 40%; 
	background: none; 
	font-size: 25px; 
	font-weight: bold; 
	border: none; 
	outline: none; 
	border-bottom: 1px solid white;
	color: white;
}
.selectText, .questText{
	border: none; 
	outline: none; 
	border-bottom: 1px solid #ccc;
	font-size: 20px;
	vertical-align: middle;
	width: 100%;
	resize: none;
	font-family: auto;
}
.selectText::-webkit-scrollbar, questText::-webkit-scrollbar{ 
	display:none;
}
.selectLabel{
	width: 50%;
	display: flex;
}	
.check:checked + label, .check:checked + label .selectText{
	color: red;
}
</style>

<h1 id="innerTitle" class="brown"><input type="text" id="questTitle" placeholder="숙제의 제목을 입력해주세요." ></h1>
<div id="questBox" style="overflow: overlay">
	<div id="makeQuestBtnBox" style="order: 1;">
		<select name="king" id="questKind">
			<option value=five>오지선다형</option>
			<option value="four">다답형</option>
			<option value="short">단답형</option>
			<option value="long">서술형</option>
		</select>
		<button onclick="makeQuest()" style="order: 1;">문제추가</button>
	</div>
	<button class="bottomBtn" onclick="makeHomework()">숙제등록</button>
</div>
<script type="text/javascript">
$("#subjectBookMark").css("display","none");
var i=1;
function makeQuest(){
	if($("#questKind").val() == "five"){
		$("#questBox").append("<div style='display: flex; flex-wrap: wrap;' class='questBox"+i+" five quest'>");
			$(".questBox"+i+"").append("<div style='display: flex; width: 100%;' class='quest"+i+"'>");
				$(".quest"+i+"").append("<span style='width: 30px;'>"+i+".</span>");
				$(".quest"+i+"").append("<textarea name='"+i+"selectText' class = 'questText' rows='1'></textarea>");
			$(".questBox"+i+"").append("<div class='questImageBox'></div>");
			$(".questBox"+i+"").append("<div class='questSelect"+i+"' style='display: flex; flex-wrap: wrap; margin: 10px auto; width: 95%;'>");
				$(".questSelect"+i+"").append("<input type='radio' value='1' name='"+i+"' id='"+i+"-1' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-1'>①<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
				$(".questSelect"+i+"").append("<input type='radio' value='2' name='"+i+"' id='"+i+"-2' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-2'>②<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
				$(".questSelect"+i+"").append("<input type='radio' value='3' name='"+i+"' id='"+i+"-3' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-3'>③<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
				$(".questSelect"+i+"").append("<input type='radio' value='4' name='"+i+"' id='"+i+"-4' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-4'>④<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
				$(".questSelect"+i+"").append("<input type='radio' value='5' name='"+i+"' id='"+i+"-5' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-5'>⑤<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
	}else if($("#questKind").val() == "four"){
		$("#questBox").append("<div style='display: flex; flex-wrap: wrap;' class='questBox"+i+" four quest'>");
			$(".questBox"+i+"").append("<div style='display: flex; width: 100%;' class='quest"+i+"'>");
				$(".quest"+i+"").append("<span style='width: 30px;'>"+i+".</span>");
				$(".quest"+i+"").append("<textarea name='"+i+"selectText' class = 'questText' rows='1'></textarea>");
			$(".questBox"+i+"").append("<div class='questImageBox'></div>");
			$(".questBox"+i+"").append("<div class='questSelect"+i+"' style='display: flex; flex-wrap: wrap; margin: 10px auto; width: 95%; border: 1px solid black; padding: 5px;'>");
				$(".questSelect"+i+"").append("<input type='checkbox' value='ㄱ' name='"+i+"' id='"+i+"-1' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-1'>ㄱ.<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
				$(".questSelect"+i+"").append("<input type='checkbox' value='ㄴ' name='"+i+"' id='"+i+"-2' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-2'>ㄴ.<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
				$(".questSelect"+i+"").append("<input type='checkbox' value='ㄷ' name='"+i+"' id='"+i+"-3' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-3'>ㄷ.<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
				$(".questSelect"+i+"").append("<input type='checkbox' value='ㄹ' name='"+i+"' id='"+i+"-4' class='check'>");
				$(".questSelect"+i+"").append("<label class='selectLabel' for='"+i+"-4'>ㄹ.<textarea name='"+i+"select' rows='1' class ='selectText'></textarea></label>");
	}else if($("#questKind").val() == "short"){
		$("#questBox").append("<div style='display: flex; flex-wrap: wrap;' class='questBox"+i+" short quest'>");
			$(".questBox"+i+"").append("<div style='display: flex; width: 100%;' class='quest"+i+"'>");
				$(".quest"+i+"").append("<span style='width: 30px;'>"+i+".</span>");
				$(".quest"+i+"").append("<textarea name='"+i+"selectText' class = 'questText' rows='1'></textarea>");
			$(".questBox"+i+"").append("<div class='questImageBox'></div>");
			$(".questBox"+i+"").append("<textarea name='"+i+"' rows='1' class ='selectText'></textarea>");
	}else if($("#questKind").val() == "long"){
		$("#questBox").append("<div style='display: flex; flex-wrap: wrap;' class='questBox"+i+" long quest'>");
			$(".questBox"+i+"").append("<div style='display: flex; width: 100%;' class='short quest"+i+"'>");
				$(".quest"+i+"").append("<span style='width: 30px;'>"+i+".</span>");
				$(".quest"+i+"").append("<textarea name='"+i+"selectText' class = 'questText make' rows='1'></textarea>");
			$(".questBox"+i+"").append("<div class='questImageBox'></div>");
			$(".questBox"+i+"").append("<textarea name='"+i+"' disabled='disabled'></textarea>");
	}
	$("textarea").on('keydown keyup', function() {
		$(this).css('height', 'auto' );
		$(this).css("height", ""+(($(this).prop('scrollHeight')+1+'px')+""))
		if($("#questBox").prop("scrollWidth") > 1010){
			$(".questBox"+(i-1)+"").remove();
			i--;
		}
	});
	if($("#questBox").prop("scrollWidth") > 1010){
		$(".questBox"+i+"").remove();
		return;
	}
	i++;
};
</script>
