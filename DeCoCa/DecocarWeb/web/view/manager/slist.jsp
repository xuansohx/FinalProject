<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<style>

.column-4 {
	padding: 10px;
}
</style>


<!-- a 링크 속성 없애기 -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Lalezar|Noto+Sans+KR&display=swap');

a:link {
	color: inherit;
	text-decoration: none;
}

a:visited {
	color: inherit;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}

#page_title {
	font-family: 'Lalezar', cursive;
	text-align: center;
}
</style>

<title>Schedule List[admin]</title>
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
</head>

<body class="animsition">

	<h1 id="page_title">
		Reservation List<br>
	</h1>
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="m-l-25 m-r--38 m-lr-0-xl">
				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart">
						<tr class="table_head">
							<th class="column-1">CALID</th>
							<th class="column-2">CARID</th>
							<th class="column-3">SERVICE</th>
							<th class="column-4">USERID</th>
							<th class="column-5">DATE</th>
							<th class="column-6">STIME</th>
							<th class="column-7">ETIME</th>
							<th class="column-8">SADDRESS</th>
							<th class="column-9">EADDRESS</th>
						</tr>

						<c:forEach var="s" items="${slist }">
							<tr class="table_row">
								<td class="column-1"><a
									href="schedetailM.mc?calid=${s.calid }">${s.calid }</a></td>
								<td class="column-2"><a
									href="schedetailM.mc?calid=${s.calid }">${s.carid }</a></td>

								<c:choose>
									<c:when test="${s.sStyle == 1 }">
										<td class="column-3"><a
											href="schedetailM.mc?calid=${s.calid }">스마트택시</a></td>
									</c:when>

									<c:when test="${s.sStyle == 2 }">
										<td class="column-3"><a
											href="schedetailM.mc?calid=${s.calid }">픽업</a></td>
									</c:when>

									<c:when test="${s.sStyle == 3 }">
										<td class="column-3"><a
											href="schedetailM.mc?calid=${s.calid }">퀵</a></td>
									</c:when>
								</c:choose>

								<td class="column-4"><a
									href="schedetailM.mc?calid=${s.calid }">${s.userid }</a></td>
								<td class="column-5"><a
									href="schedetailM.mc?calid=${s.calid }">${s.calDate }</a></td>
								<td class="column-6"><a
									href="schedetailM.mc?calid=${s.calid }">${s.sTime }</a></td>
								<td class="column-7"><a
									href="schedetailM.mc?calid=${s.calid }">${s.eTime }</a></td>
								<td class="column-8"><a
									href="schedetailM.mc?calid=${s.calid }">${s.sAddress }</a></td>
								<td class="column-9"><a
									href="schedetailM.mc?calid=${s.calid }">${s.eAddress }</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</form>
  
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
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>