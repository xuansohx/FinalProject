<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
<script src="js/map-custom.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<script>
	function joinCheck(obj) {
		/* var email = obj.CUSTOMER_EMAIL.value; */
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if (!obj.userid.value || obj.userid.value.trim().length == 0) {
			alert("아이디가 입력되지 않았습니다.");
			obj.userid.value = "";
			obj.userid.focus();
			return false;
		}
		//아이디 길이 체크
		if(obj.userid.value.length<4 || obj.userid.value.length>12){
			alert("아이디를 4~12자까지 입력해주세요.")
            obj.userid.focus();
            obj.userid.select();
            return false;
		
		}
		//아이디 유효성 검사 (영문소문자, 숫자만 허용)
        for (i = 0; i < obj.userid.value.length; i++) {
            ch = obj.userid.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                alert("아이디는 대소문자, 숫자만 입력가능합니다.")
                obj.userid.focus()
                obj.userid.select()
                return false;
            }
        }
		//아이디에 공백 사용하지 않기
        if (obj.userid.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.")
            obj.userid.focus()
            obj.userid.select()
            return false;
        }
		
		
		if (!obj.pwd.value
				|| obj.pwd.value.trim().length == 0) {
			alert("비밀번호가 입력되지 않았습니다.");
			obj.pwd.value = "";
			obj.pwd.focus();
			return false;
		}
		
		 if (obj.pwd.value == obj.userid.value) {
	            alert("아이디와 비밀번호가 같습니다.")
	            obj.pwd.focus()
	            return false;
	        }
		 
		 if (obj.pwd.value.length < 4 || obj.pwd.value.length >12) {
	            alert("비밀번호를 4~12자까지 입력해주세요.")
	            obj.pwd.focus()
	            obj.pwd.select()
	            return false;
	        }
		 
		if (!obj.name.value || obj.name.value.trim().length == 0) {
			alert("이름이 입력되지 않았습니다.");
			obj.name.value = "";
			obj.name.focus();
			return false;
		}
		if(obj.name.value.length<2){
	            alert("이름을 2자 이상 입력해주십시오.")
	            obj.name.focus()
	            return false;
	     }
		if (!obj.pnumber.value
				|| obj.pnumber.value.trim().length == 0) {
			alert("번호가 입력되지 않았습니다.");
			obj.pnumber.value = "";
			obj.pnumber.focus();
			return false;
		}
	}

	$(document).ready(function() {
		$('input[name="pwd2"]').keyup(function() {
			var pw = $('input[name="pwd"]').val();
			var pw2 = $('input[name="pwd2"]').val();
			if(pw != pw2){
			 $('.same').html('<span style="color:red">비밀번호가 맞지 않아요</span>');
			 $('input[name="registerok"]').attr('disabled','disabled');
			 return false;
				
			}else if(pw == pw2){
				$('.same').html('<span style="color:blue">비밀번호가 맞습니다.</span>');
				$('input[name="registerok"]').removeAttr('disabled');
				return false;
			}
			
		});
		$('input[name="registerok"]').click(function() {
			alert("회원가입이 완료 되었습니다.(환영합니다!)")
		});
		$('input[name="idceck"]').click(function() {
			var userid = $('input[name="userid"]').val();
			$.ajax({
				url:"usercheckId.mc",
				data:{'userid':userid},
				method:"POST",
				success:function(result){
					if(result == '1'){
						alert("아이디 중복입니다.");
						$('input[name="registerok"]').attr('disabled','disabled');
						$('.idsame').html('<span style="color:red">아이디 중복입니다.</span>');
						return false;
					}else if(result == '0'){
						if( userid.length > 4 ){
						alert("사용 가능한 아이디 입니다.");
						$('input[name="registerok"]').removeAttr('disabled');
						$('.idsame').html('<span style="color:red"></span>');
						return false;
						}
						else if(userid.length <4 || userid.length >12){
							alert("아이디를 4~12자까지 입력해주세요.");
						}
					}
				}
			});
		});
	});
</script>
<title>Contact</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->


<style>
@import
	url('https://fonts.googleapis.com/css?family=Lalezar|Noto+Sans+KR&display=swap')
	;

#page_title {
	font-family: 'Lalezar', cursive;
	text-align: center;
}
</style>

</head>
<body class="animsition">


	<!-- Content page -->
	<section class="bg0  p-b-116">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5"></h3>
			</div>
			<div class="flex-w flex-tr">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">

					<h1 id="page_title">
						REGISTER<br>
					</h1>
					<!--  -->
					<!--  -->
					<!--  -->
					<form action="userregister.mc" method="POST"
						onsubmit="return joinCheck(this)">

						<!--챦쩔쩍챙혬혻챌혬짹챦쩔쩍, 챦쩔쩍챙혺쩐챦쩔쩍챙혛혮챔쨍째챘혥혡챙혘혝, 채쨘혣챙혝짹챘혘쩌,email-->
						<div class="col-sm-6 p-b-5 m-lr-auto ">
							<label class="stext-102 cl3" for="id">ID</label> <input
								class="size-111 bor8 stext-102 cl2 p-lr-20" id="id" type="text"
								name="userid"> <input type="button" name="idceck"
								value="중복확인" /> &nbsp;&nbsp; <span class="idsame"></span>
						</div>

						<div class="col-sm-6 p-b-5 m-lr-auto ">
							<label class="stext-102 cl3" for="pwd">PASSWORD</label> <input
								class="size-111 bor8 stext-102 cl2 p-lr-20" id="pw"
								type="password" name="pwd">
						</div>

						<div class="col-sm-6 p-b-5 m-lr-auto ">
							<label class="stext-102 cl3" for="pwd">PASSWORD CHECK</label> <input
								class="size-111 bor8 stext-102 cl2 p-lr-20"
								style="background-color: #A9A9F5" id="pwCheck"
								onchange="isSame()" type="password" name="pwd2">&nbsp;&nbsp;
							<span class="same"></span>
						</div>


						<div class="col-sm-6 p-b-5 m-lr-auto ">
							<label class="stext-102 cl3" for="name">NAME</label> <input
								class="size-111 bor8 stext-102 cl2 p-lr-20" id="name"
								type="text" name="name">
						</div>

						<div class="col-sm-6 p-b-5 m-lr-auto ">
							<label class="stext-102 cl3" for="name">PHONE</label> <input
								class="size-111 bor8 stext-102 cl2 p-lr-20" id="phone"
								type="text" name="pnumber">
						</div>

						<label class="stext-102 cl3"></label> <input type="submit"
							name="registerok"
							class="flex-c-m m-lr-auto stext-101 cl0 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
							style="width: 300px; height: 50px" value="REGISTER">


					</form>
				</div>
			</div>
		</div>
	</section>


</body>
</html>