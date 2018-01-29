<?php echo $header; ?><?php include 'yandex_delivery_header.tpl' ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-yandex_delivery" class="form-horizontal">
    <table class="form table table-bordered">
        <colgroup>
            <col span="1" style="width: 25%;">
            <col span="1" style="width: 75%;">
        </colgroup>
        <tr>
            <td><?php echo $entry_order_status; ?></td>
            <td><select name="yandex_delivery_payment_order_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $yandex_delivery_payment_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
            </select></td>
        </tr>
        <tr>
            <td><?php echo $entry_use_total; ?></td>
            <td><?php echo $entry_total_from_hint; ?><input type="text" name="yandex_delivery_payment_total_from" value="<?php echo $yandex_delivery_payment_total_from; ?>" /><?php echo $entry_total_to_hint; ?><input type="text" name="yandex_delivery_payment_total_to" value="<?php echo $yandex_delivery_payment_total_to; ?>" /></td>
        </tr>

        <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="yandex_delivery_payment_status">
                <?php if ($yandex_delivery_payment_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
            </select></td>
        </tr>
        <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="yandex_delivery_payment_sort_order" value="<?php echo $yandex_delivery_payment_sort_order; ?>" size="1" /></td>
        </tr>
    </table>
</form>
<?php include 'yandex_delivery_footer.tpl' ?>
<?php echo $footer; ?>