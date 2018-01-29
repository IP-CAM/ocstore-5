<?php if ($old) { ?>
<div class="buttons">
    <div class="right">
        <a id="yd_confirm" class="button"><span><?php echo $button_confirm; ?></span></a>
    </div>
</div>
<?php } else { ?>
<div class="buttons">
    <div class="pull-right">
        <input type="button" value="<?php echo $button_confirm; ?>" id="yd_confirm" class="btn btn-primary" />
    </div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('#yd_confirm').click(function() {
	$.ajax({
		type: 'GET',
		url: 'index.php?route=<?php echo $route; ?>/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>