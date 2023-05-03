<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer class="footer">
	<div class="container-fluid">
		<div class="row text-muted">
			<div class="col-6 text-start">
				<p class="mb-0">
					<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>Green</strong></a> &copy;
				</p>
			</div>

		</div>
	</div>
</footer>
</div>
</div>

<script src="/static/js/app.js"></script>



<script>
	document.addEventListener("DOMContentLoaded", function() {
		var date = new Date();
		var defaultDate = date.getUTCFullYear() + "-"
				+ (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
		document.getElementById("datetimepicker-dashboard").flatpickr({
			inline : true,
			prevArrow : "<span title=\"Previous month\">&laquo;</span>",
			nextArrow : "<span title=\"Next month\">&raquo;</span>",
			defaultDate : defaultDate
		});
	});
</script>

</body>

</html>