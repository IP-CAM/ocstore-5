<?php echo $header; ?><?php include 'yandex_delivery_header.tpl' ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-yandex_delivery" class="form-horizontal">
        <table class="form table table-bordered">
            <tr>
                <td><?php echo $text_license_name; ?></td>
                <td><input onchange="gen_license_id(); return false;" type="text" name="yandex_delivery_license_name" id="license_name" value="<?php echo $yandex_delivery_license_name; ?>"></td>
            </tr>
            <tr>
                <td><?php echo $text_license_id; ?></td>
                <td><input id="license_id" type="text" style="width: 650px;" onclick="this.setSelectionRange(0, this.value.length);" readonly name="yandex_delivery_license_id"><br><?php echo $text_license_id_hint; ?></td>
            </tr>
            <tr>
                <td><?php echo $text_license_info; ?></td>
                <td><textarea id="license_info" style="width: 650px;" rows="1" name="yandex_delivery_license_info"><?php echo $yandex_delivery_license_info; ?></textarea><br><?php echo $text_license_info_hint; ?></td>
            </tr>
            <tr style="height: 40px;"></tr>
            <tr><td colspan="2"><?php echo $entry_api_hint; ?></td><tr></tr>
            <tr>
                <td><?php echo $entry_api1; ?></td>
                <td><textarea id="api1" style="width: 650px;" rows="7" name="yandex_delivery_api1"><?php echo $yandex_delivery_api1; ?></textarea></td>
            </tr>
            <tr>
                <td rowspan="2"><?php echo $entry_api2; ?></td>
                <td>client_id:<br><input type="text" name="yandex_delivery_client_id" value="<?php echo $yandex_delivery_client_id; ?>" /></td>
            </tr>
            <tr>
                <td>sender_id:<br><input type="text" name="yandex_delivery_sender_id" value="<?php echo $yandex_delivery_sender_id; ?>" /></td>
            </tr>
            <tr style="height: 40px;"></tr>
            <tr>
                <td><?php echo $entry_source_city; ?></td>
                <td><input type="text" name="yandex_delivery_source_city" value="<?php echo $yandex_delivery_source_city; ?>" /></td>
            </tr>
            <tr>
                <td><?php echo $entry_cost; ?></td>
                <td><input type="text" name="yandex_delivery_rate_value" id="yandex_delivery-rate-value" value="<?php echo $yandex_delivery_rate_value; ?>" />
                    <select name="yandex_delivery_rate_option" id="yandex_delivery-rate-option">
                        <option value="0" <?php if ($yandex_delivery_rate_option == 0) echo 'selected="selected"'; ?>><?php echo $text_add_cost_type_fixed; ?></option>
                        <option value="1" <?php if ($yandex_delivery_rate_option == 1) echo 'selected="selected"'; ?>><?php echo $text_add_cost_type_percent; ?></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_assessed_cost; ?></td>
                <td><input type="text" name="yandex_delivery_assessed_value" id="yandex_delivery-assessed-value" value="<?php echo $yandex_delivery_assessed_value; ?>" />
                    <select name="yandex_delivery_assessed_option" id="yandex_delivery-assessed-option">
                        <option value="0" <?php if ($yandex_delivery_assessed_option == 0) echo 'selected="selected"'; ?>><?php echo $text_assessed_cost_type_fixed; ?></option>
                        <option value="1" <?php if ($yandex_delivery_assessed_option == 1) echo 'selected="selected"'; ?>><?php echo $text_assessed_cost_type_percent; ?></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_allow_exclude_assessed_cost; ?></td>
                <td>
                    <label><input type="radio" onchange="check_fields_visibility();" name="yandex_delivery_allow_exclude_assessed_cost" value="1" <?php echo $yandex_delivery_allow_exclude_assessed_cost ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" onchange="check_fields_visibility();" name="yandex_delivery_allow_exclude_assessed_cost" value="0" <?php echo !$yandex_delivery_allow_exclude_assessed_cost ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr class="assessed_cost_simple">
                <td><?php echo $entry_exclude_assessed_cost_simple_field; ?></td>
                <td><input type="text" name="yandex_delivery_exclude_assessed_cost_simple_field" value="<?php echo $yandex_delivery_exclude_assessed_cost_simple_field; ?>" /></td>
            </tr>
            <tr>
                <td><?php echo $entry_package_weight; ?></td>
                <td><input type="text" name="yandex_delivery_package_weight" value="<?php echo $yandex_delivery_package_weight; ?>" /></td>
            </tr>
            <tr>
                <td><?php echo $entry_package_size; ?></td>
                <td>
                    <table id="package_size_table">
                        <tr>
                            <td>
                                <label><input type="radio" name="yandex_delivery_package_size_calc_type" value="0" <?php echo $yandex_delivery_package_size_calc_type == 0 ? 'checked="checked"' : '' ?>><?php echo $entry_package_size_auto; ?></label>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label><input type="radio" name="yandex_delivery_package_size_calc_type" value="1" <?php echo $yandex_delivery_package_size_calc_type == 1 ? 'checked="checked"' : '' ?>><?php echo $entry_package_size_manual; ?></label>
                            </td>
                            <td>
                                <input name="yandex_delivery_package_width" style="width: 50px;" value="<?php echo $yandex_delivery_package_width; ?>" type="text"><?php echo $entry_package_width; ?><input name="yandex_delivery_package_height" style="width: 50px;" value="<?php echo $yandex_delivery_package_height; ?>" type="text"><?php echo $entry_package_height; ?><input name="yandex_delivery_package_depth" style="width: 50px;" value="<?php echo $yandex_delivery_package_depth; ?>" type="text"><?php echo $entry_package_depth; ?>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_default_weight; ?></td>
                <td>
                    <table id="package_weight_table">
                        <tr>
                            <td>
                                <label><input type="radio" name="yandex_delivery_package_weight_calc_type" value="0" <?php echo $yandex_delivery_package_weight_calc_type == 0 ? 'checked="checked"' : '' ?>><?php echo $entry_package_weight_auto; ?></label>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label><input type="radio" name="yandex_delivery_package_weight_calc_type" value="1" <?php echo $yandex_delivery_package_weight_calc_type == 1 ? 'checked="checked"' : '' ?>><?php echo $entry_package_weight_manual; ?></label>
                            </td>
                            <td>
                                <input name="yandex_delivery_package_default_weight" style="width: 50px;" value="<?php echo $yandex_delivery_package_default_weight; ?>" type="text">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_shipping_type; ?></td>
                <td>
                    <select name="yandex_delivery_shipping_type" id="yandex_delivery-shipping-type">
                        <option value="0" <?php if ($yandex_delivery_shipping_type == 0) echo 'selected="selected"'; ?>><?php echo $text_shipping_type_all; ?></option>
                        <option value="1" <?php if ($yandex_delivery_shipping_type == 1) echo 'selected="selected"'; ?>><?php echo $text_shipping_type_pickup; ?></option>
                        <option value="2" <?php if ($yandex_delivery_shipping_type == 2) echo 'selected="selected"'; ?>><?php echo $text_shipping_type_kd; ?></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_allow_cod; ?></td>
                <td><input type="checkbox" name="yandex_delivery_allow_cod" id="yandex_delivery-allow-cod" value="1" <?php if( $yandex_delivery_allow_cod == 1) { echo 'checked="checked"'; }?>/></td>
            </tr>
            <tr>
                <td><?php echo $entry_compact_mode; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_compact_mode" value="1" <?php echo $yandex_delivery_compact_mode ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_compact_mode" value="0" <?php echo !$yandex_delivery_compact_mode ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>

            <tr>
                <td><?php echo $entry_show_stub; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_show_stub" value="1" <?php echo $yandex_delivery_show_stub ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_show_stub" value="0" <?php echo !$yandex_delivery_show_stub ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_cod_paid_shop; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_cod_paid_shop" value="1" <?php echo $yandex_delivery_cod_paid_shop ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_cod_paid_shop" value="0" <?php echo !$yandex_delivery_cod_paid_shop ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr></tr>
            <tr>
                <td><?php echo $entry_select_link_position; ?></td>
                <td>
                    <select name="yandex_delivery_link_position">
                        <option value="0" <?php if ($yandex_delivery_link_position == 0) echo 'selected="selected"'; ?>><?php echo $item_after_description; ?></option>
                        <option value="1" <?php if ($yandex_delivery_link_position == 1) echo 'selected="selected"'; ?>><?php echo $item_after_select; ?></option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><?php echo $entry_show_icons; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_show_icons" value="1" <?php echo $yandex_delivery_show_icons ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_show_icons" value="0" <?php echo !$yandex_delivery_show_icons ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_show_icons_title; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_show_icons_title" value="1" <?php echo $yandex_delivery_show_icons_title ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_show_icons_title" value="0" <?php echo !$yandex_delivery_show_icons_title ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_show_days; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_show_days" value="1" <?php echo $yandex_delivery_show_days == 1 ? 'checked="checked"' : '' ?>>&nbsp;<?php echo $item_days; ?></label>&nbsp;&nbsp;
                    <label><input type="radio" name="yandex_delivery_show_days" value="2" <?php echo $yandex_delivery_show_days == 2 ? 'checked="checked"' : '' ?>>&nbsp;<?php echo $item_date; ?></label>&nbsp;&nbsp;
                    <label><input type="radio" name="yandex_delivery_show_days" value="0" <?php echo $yandex_delivery_show_days == 0 ? 'checked="checked"' : '' ?>>&nbsp;<?php echo $item_not_show; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_show_delivery_type; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_show_delivery_type" value="1" <?php echo $yandex_delivery_show_delivery_type ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_show_delivery_type" value="0" <?php echo !$yandex_delivery_show_delivery_type ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_bold_method; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_bold_method" value="1" <?php echo $yandex_delivery_bold_method ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_bold_method" value="0" <?php echo !$yandex_delivery_bold_method ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_sort_by_cost; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_sort_methods_by_cost" value="1" <?php echo $yandex_delivery_sort_methods_by_cost ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_sort_methods_by_cost" value="0" <?php echo !$yandex_delivery_sort_methods_by_cost ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_sort_by_method; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_sort_methods_by_method" value="1" <?php echo $yandex_delivery_sort_methods_by_method ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_sort_methods_by_method" value="0" <?php echo !$yandex_delivery_sort_methods_by_method ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_free_label; ?></td>
                <td>
                    <input type="checkbox" onchange="check_freeship_label_visibility();" name="yandex_delivery_free_label" id="yandex_delivery-free-label" value="1" <?php if( $yandex_delivery_free_label == 1) { echo 'checked="checked"'; }?>/>
                    <input type="text" name="yandex_delivery_freeship_text" id="input-freeship-text" value="<?php echo $yandex_delivery_freeship_text; ?>" />
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_post_variants; ?></td>
                <td>
                    <select name="yandex_delivery_post_variants" id="yandex_delivery-post-variants">
                        <option value="0" <?php if ($yandex_delivery_post_variants == 0) echo 'selected="selected"'; ?>><?php echo $text_shipping_post_as_is; ?></option>
                        <option value="1" <?php if ($yandex_delivery_post_variants == 1) echo 'selected="selected"'; ?>><?php echo $text_shipping_post_cheapest; ?></option>
                        <option value="2" <?php if ($yandex_delivery_post_variants == 2) echo 'selected="selected"'; ?>><?php echo $text_shipping_type_most_expensive; ?></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_sort_order_type; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_order_sort_type" value="1" <?php echo $yandex_delivery_order_sort_type ? 'checked="checked"' : '' ?>><?php echo $text_sort_type_warehouse; ?></label>
                    <label><input type="radio" name="yandex_delivery_order_sort_type" value="0" <?php echo !$yandex_delivery_order_sort_type ? 'checked="checked"' : '' ?>><?php echo $text_sort_type_direct; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_only_selected_method_pvz; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_only_selected_method_pvz" value="1" <?php echo $yandex_delivery_only_selected_method_pvz ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_only_selected_method_pvz" value="0" <?php echo !$yandex_delivery_only_selected_method_pvz ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr style="height: 40px;"></tr>
            <tr>
                <td><?php echo $entry_tax_class; ?></td>
                <td><select name="yandex_delivery_tax_class_id">
                    <option value="0"><?php echo $text_none; ?></option>
                    <?php foreach ($tax_classes as $tax_class) { ?>
                    <?php if ($tax_class['tax_class_id'] == $yandex_delivery_tax_class_id) { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select></td>
            </tr>
            <tr>
                <td><?php echo $entry_status; ?></td>
                <td><select name="yandex_delivery_status">
                    <?php if ($yandex_delivery_status) { ?>
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
                <td><input type="text" name="yandex_delivery_sort_order" value="<?php echo $yandex_delivery_sort_order; ?>" size="1" /></td>
            </tr>
            <tr>
                <td><?php echo $entry_debug_mode; ?></td>
                <td>
                    <label><input type="radio" name="yandex_delivery_debug_mode" value="1" <?php echo $yandex_delivery_debug_mode ? 'checked="checked"' : '' ?>><?php echo $text_yes; ?></label>
                    <label><input type="radio" name="yandex_delivery_debug_mode" value="0" <?php echo !$yandex_delivery_debug_mode ? 'checked="checked"' : '' ?>><?php echo $text_no; ?></label>
                </td>
            </tr>
            <tr>
                <td><?php echo $button_clear_cache; ?></td>
                <td><input type="button" value="<?php echo $button_clear_cache; ?>" onclick="$.post('index.php?route=<?php echo $route; ?>/clear_cache&token=<?php echo $token; ?>');" /></td>
            </tr>
        </table>
</form>
<script type="text/javascript"><!--
$(function() {
    gen_license_id();
    check_fields_visibility();
    check_freeship_label_visibility();
});
function check_freeship_label_visibility() {
    if ($('input[name=yandex_delivery_free_label]').prop('checked')) $('#input-freeship-text').show(); else $('#input-freeship-text').hide();
}
function check_fields_visibility() {
    if ($('input[name=yandex_delivery_allow_exclude_assessed_cost]:checked').val() == 0) $('.assessed_cost_simple').hide(); else $('.assessed_cost_simple').show();
}
function gen_license_id() {
    $.ajax({
        type:  'POST',
        cache:  false ,
        dataType: 'json',
        url:  'index.php?route=<?php echo $route; ?>/license&token=<?php echo $token; ?>',
        data:  { 'license_name' : $("#license_name").val()},
        success: function(json) {
            $("#license_id").val(json.id);
            $("#license_name").val(json.name);
        }
    });
}
//--></script>
<?php include 'yandex_delivery_footer.tpl' ?>
<?php echo $footer; ?>