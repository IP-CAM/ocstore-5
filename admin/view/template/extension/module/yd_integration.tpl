<?php echo $header; ?><?php include 'yd_integration_header.tpl' ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-yandex_delivery_integration" class="form-horizontal">
    <table class="form table table-bordered">
        <colgroup>
            <col span="1" style="width: 25%;">
            <col span="1" style="width: 75%;">
        </colgroup>
        <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="yd_integration_status">
                    <?php if ($yd_integration_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                </select></td>
        </tr>
        <tr>
            <td rowspan="2"><?php echo $entry_api; ?></td>
            <td><?php echo $entry_api_hint1; ?><input type="text" name="yd_integration_default_warehouse" value="<?php echo $yd_integration_default_warehouse; ?>" /></td>
        </tr>
        <tr>
            <td><?php echo $entry_api_hint2; ?><input type="text" name="yd_integration_default_requisite" value="<?php echo $yd_integration_default_requisite; ?>" /></td>
        </tr>
        <tr>
            <td><?php echo $entry_create_order_mode; ?></td>
            <td>
                <label>
                    <input type="radio" name="yd_integration_create_order_mode" value="1" <?php echo $yd_integration_create_order_mode ? 'checked="checked"' : '' ?>><?php echo $text_create_order_auto; ?>
                    <select name="yd_integration_order_status_id">
                        <?php foreach ($order_statuses as $order_status) { ?>
                        <?php if ($order_status['order_status_id'] == $yd_integration_order_status_id) { ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </label>
                <br>
                <label>
                    <input type="radio" name="yd_integration_create_order_mode" value="0" <?php echo !$yd_integration_create_order_mode ? 'checked="checked"' : '' ?>><?php echo $text_create_order_manual; ?>
                </label>
            </td>
        </tr>
        <tr>
            <td><?php echo $entry_address_input_mode; ?></td>
            <td>
                <label>
                    <input onchange="on_address_mode_changed();" type="radio" name="yd_integration_address_input_mode" value="0" <?php echo !$yd_integration_address_input_mode ? 'checked="checked"' : '' ?>><?php echo $text_address_one_line; ?>
                </label>
                <br>
                <label>
                    <input onchange="on_address_mode_changed();" type="radio" name="yd_integration_address_input_mode" value="1" <?php echo $yd_integration_address_input_mode ? 'checked="checked"' : '' ?>><?php echo $text_address_simple; ?>
                </label>
                <div id="address_simple">
                    <div style="margin-left: 40px; margin-top: 10px;">
                        <?php echo $text_address_simple2; ?>
                        <label>
                            <input type="radio" name="yd_integration_address_prefix_block" value="0" <?php echo !$yd_integration_address_prefix_block ? 'checked="checked"' : '' ?>><?php echo $text_block_shipment; ?>
                        </label>
                        <br>
                        <label>
                            <input type="radio" name="yd_integration_address_prefix_block" value="1" <?php echo $yd_integration_address_prefix_block ? 'checked="checked"' : '' ?>><?php echo $text_block_payment; ?>
                        </label>
                    </div>
                    <table class="form table table-bordered" style="margin: 12px; margin-left: 40px;">
                        <tr>
                            <td><strong><?php echo $text_header_yd; ?></strong></td>
                            <td><strong><?php echo $text_header_simple; ?></strong></td>
                        </tr>
                        <tr>
                            <td><?php echo $text_field_street; ?></td>
                            <td><input type="text" name="yd_integration_field_name_street" value="<?php echo $yd_integration_field_name_street; ?>" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $text_field_house; ?></td>
                            <td><input type="text" name="yd_integration_field_name_house" value="<?php echo $yd_integration_field_name_house; ?>" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $text_field_housing; ?></td>
                            <td><input type="text" name="yd_integration_field_name_housing" value="<?php echo $yd_integration_field_name_housing; ?>" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $text_field_build; ?></td>
                            <td><input type="text" name="yd_integration_field_name_build" value="<?php echo $yd_integration_field_name_build; ?>" /></td>
                        </tr>
                        <tr>
                            <td><?php echo $text_field_flat; ?></td>
                            <td><input type="text" name="yd_integration_field_name_flat" value="<?php echo $yd_integration_field_name_flat; ?>" /></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td><?php echo $entry_middle_name; ?></td>
            <td><input type="text" name="yd_integration_field_name_middle" value="<?php echo $yd_integration_field_name_middle; ?>" /></td>
        </tr>
        <tr>
            <td><?php echo $entry_product_article; ?></td>
            <td>
                <select name="yd_integration_article_field" id="yd-integration-article-field">
                    <?php foreach ($article_fields as $article_field) { ?>
                    <?php if ($article_field == $yd_integration_article_field) { ?>
                    <option value="<?php echo $article_field; ?>" selected="selected"><?php echo $article_field; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $article_field; ?>"><?php echo $article_field; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript"><!--

    $(function() {
        on_address_mode_changed();
    });
    function on_address_mode_changed() {
        if ($('input[name=yd_integration_address_input_mode]:checked').val() == 0) $('#address_simple').hide(); else $('#address_simple').show();
    }
    //--></script>
<?php include 'yd_integration_footer.tpl' ?>
<?php echo $footer; ?>