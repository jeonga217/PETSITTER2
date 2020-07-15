<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function() {

		$(function() {
			$('textarea.texts').keyup(function() {
				bytesHandler(this, "character");
			});
			$('textarea.texts1').keyup(function() {
				bytesHandler(this, "special");
			});
			$('input.name').keyup(function() {
				bytesHandler(this, "name");
			});
		});

		function getTextLength(str) {
			var len = 0;

			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length == 6) {
					len++;
				}
				len++;
			}
			return len;
		}

		function bytesHandler(obj, k) {
			var text = $(obj).val();
			if (k == "character") {
				if (getTextLength(text) > 3000) {
					alert("반려견 성격에서 3000글자를 넘었습니다 내용을 줄여 주세요");
					return false;
				} else {
					$('label.bytes1').text(getTextLength(text));
				}

			} else if (k == "special") {
				if (getTextLength(text) > 3000) {
					alert("특이사항에서 3000글자를 넘었습니다 내용을 줄여 주세요");
					return false;
				} else {
					$('label.bytes2').text(getTextLength(text));
				}

			} else if (k == "name") {
				if (getTextLength(text) > 300) {
					alert("이름에서 300글자를 넘었습니다 내용을 줄여 주세요");
					var name = $("#name").val("");
					return false;
				} else {
					$('label.bytes3').text(getTextLength(text));
				}

			}

		}
	})
</script>
<body>
	<div class="d-block d-md-flex listing-horizontal">
		<div class="lh-content">

			<div class="border p-3 rounded mb-2">
				<div>펫 소개</div>
				<div style="position: relative; float: left;">
					<img src="/upload/${modresult.pet_photo}"
						style="width: 500px; height: 300px;">
				</div>
				<form action="/mypage/resultmodfiy" method="post" enctype="multipart/form-data">
					<input type="hidden" name="petseq" value="${modresult.petseq}">
					<div class="form-group">
					<input type="hidden" value="${modresult.petseq}">
						펫 이름 <input type="text" name="pet_name" class="form-control name"
							value="${modresult.pet_name}" aria-describedby="emailHelp">
						글자수 제한 : <label class="bytes3">0</label>/300
						<div class="form-group">
							<label for="exampleFormControlFile1">파일업로드</label> <input
								type="file" class="form-control-file"
								accept="image/gif,image/jpeg,image/png"name="img">
						</div>
						성별
						<div class="select-wrap">
							<span class="icon"><span class="icon-keyboard_arrow_down"></span></span>
							<select class="form-control" name="pet_gender">
								<option value="F">수컷</option>
								<option value="M">암컷</option>
							</select>
						</div>
						중성화 여부
						<div class="select-wrap">
							<span class="icon"><span class="icon-keyboard_arrow_down"></span></span>
							<select class="form-control" name="pet_ox">
								<option value="y">유</option>
								<option value="n">무</option>
							</select>
						</div>
						펫 나이 <input type="text" name="pet_age" class="form-control"
							value="${modresult.pet_age}" aria-describedby="emailHelp">
						견종
						<div class="select-wrap">
							<span class="icon"><span class="icon-keyboard_arrow_down"></span></span>
							<select class="form-control" name="pet_sort">
								<option value="dog">개</option>
								<option value="cat">고양이</option>
							</select>
						</div>
						펫 크기
						<div class="select-wrap">
							<span class="icon"><span class="icon-keyboard_arrow_down"></span></span>
							<select class="form-control" name="pet_type">
								<option value="소">소</option>
								<option value="중">중</option>
								<option value="대">대</option>
							</select>
						</div>


						동거여부
						<div class="select-wrap">
							<span class="icon"><span class="icon-keyboard_arrow_down"></span></span>
							<select class="form-control" name="pet_family">
								<option value="y">유</option>
								<option value="n">무</option>
							</select>
						</div>

						종류(개인지 고양이 인지)
						<div class="select-wrap">
							<span class="icon"><span class="icon-keyboard_arrow_down"></span></span>
							<select class="form-control" name="pet_animal">
								<option value="dog">개</option>
								<option value="cat">고양이</option>
							</select>
						</div>

						<div class="form-group">
							반려견 성격
							<textarea class="form-control texts" rows="3" name="pet_character"
								style="resize: none; height: 300px;">${modresult.pet_character}</textarea>
						</div>
						글자수 제한 : <label class="bytes1">0</label>/3000
						<div class="form-group">
							특이사항
							<textarea class="form-control texts1" rows="3" name="pet_details"
								style="resize: none; height: 300px;">${modresult.pet_details}</textarea>
						</div>
						글자수 제한 : <label class="bytes2">0</label>/3000
					</div>
					<button type="submit" class="btn btn-primary">수정완료</button>
				</form>

			</div>


		</div>

	</div>

	</div>
</body>
</html>