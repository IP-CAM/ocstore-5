<h2><?php echo $heading_title_lk; ?></h2>
<?php if ($error) { ?>
<div class="text-danger" id="yderror"><span><?php echo $error; ?></span></div>
<?php } else { ?>
<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <td class="text-left"><?php echo $column_time; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($history as $item) { ?>
        <tr>
            <td class="text-left"><?php echo $item['time']; ?></td>
            <td class="text-left"><?php echo $item['status']; ?></td>
        </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
<div class="item text-left">
    <span><strong><?php echo $text_address; ?>:</strong> <?php echo $address; ?></span>
</div>
<div class="item text-left">
    <span><strong><?php echo $text_delivery_est; ?>:</strong> <?php echo $est; ?></span>
</div>
<?php } ?>