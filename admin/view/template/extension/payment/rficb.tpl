<?php
/**
* Модуль оплаты через ЗАО "РФИ БАНК" https://rficb.ru,
*/
?>
<?php echo $header; ?>  <?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-rficb" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="container-fluid">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
        </div>
        <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-rficb" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_rficb_name; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="rficb_name" value="<?php echo $rficb_name; ?>" id="input-rficb_name" class="form-control" />
                        <?php if (isset($_error['rficb_name'])) { ?>
                        <div class="text-danger"><?php echo $_error['rficb_secret']; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_status" id="input-status" class="form-control">
                            <?php if ($rficb_status) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <span class="col-sm-2 control-label" for="input-total"><?php echo $entry_rficb_callback; ?></span>
                    <div class="col-sm-10">
                        <?php echo HTTP_CATALOG.'index.php?route=extension/payment/rficb/callback'; ?> 
                    </div>
                </div>
                <div class="form-group">
                    <span class="col-sm-2 control-label" for="input-total"><?php echo $entry_rficb_success; ?></span>
                    <div class="col-sm-10">
                        <?php echo HTTP_CATALOG.'index.php?route=checkout/success'; ?>
                    </div>
                </div>
                <div class="form-group">
                    <span class="col-sm-2 control-label" for="input-total"><?php echo $entry_rficb_error; ?></span>
                    <div class="col-sm-10">
                        <?php echo HTTP_CATALOG.'index.php?route=extension/payment/rficb/error'; ?> 
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_rficb_secret; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="rficb_secret" value="<?php echo $rficb_secret; ?>" placeholder="<?php echo $entry_rficb_secret; ?>" id="input-rficb_secret" class="form-control" />
                        <?php if (isset($_error['rficb_secret'])) { ?>
                        <div class="text-danger"><?php echo $_error['rficb_secret']; ?></div>
                        <?php } ?>
                    </div>
                </div> 
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_rficb_key; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="rficb_key" value="<?php echo $rficb_key; ?>" placeholder="<?php echo $entry_rficb_key; ?>" id="input-rficb_key" class="form-control" />
                        <?php if (isset($_error['rficb_secret'])) { ?>
                        <div class="text-danger"><?php echo $_error['rficb_secret']; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_total; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="rficb_total" value="<?php echo $rficb_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_rficb_order_status_id; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_order_status_id" id="input-entry_rficb_order_status_id" class="form-control">
                            <?php foreach ($order_statuses as $order_status) { ?>
                            <?php if ($order_status['order_status_id'] == $rficb_order_status_id) { ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
                    <div class="col-sm-10">
                        <select name="cod_geo_zone_id" id="input-geo-zone" class="form-control">
                            <option value="0"><?php echo $text_all_zones; ?></option>
                            <?php foreach ($geo_zones as $geo_zone) { ?>
                            <?php if ($geo_zone['geo_zone_id'] == $cod_geo_zone_id) { ?>
                            <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rficb_commission"><?php echo $entry_rficb_commission; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_commission" id="input-rficb_commission" class="form-control">
                            <?php if ($rficb_commission) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rficb_payment_type"><?php echo $entry_rficb_payment_type; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_payment_type" id="input-rficb_payment_type" class="form-control">
                            <?php if ($rficb_payment_type) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rficb_payment_spg"><?php echo $entry_rficb_payment_spg; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_payment_spg" id="input-rficb_payment_spg" class="form-control">
                            <?php if ($rficb_payment_spg) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rficb_payment_spg"><?php echo $entry_rficb_payment_wm; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_payment_wm" id="input-rficb_payment_wm" class="form-control">
                            <?php if ($rficb_payment_wm) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rficb_payment_spg"><?php echo $entry_rficb_payment_ym; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_payment_ym" id="input-rficb_payment_ym" class="form-control">
                            <?php if ($rficb_payment_ym) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rficb_payment_mc"><?php echo $entry_rficb_payment_mc; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_payment_mc" id="input-rficb_payment_mc" class="form-control">
                            <?php if ($rficb_payment_mc) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rficb_payment_mc"><?php echo $entry_rficb_payment_qiwi; ?></label>
                    <div class="col-sm-10">
                        <select name="rficb_payment_qiwi" id="input-rficb_payment_qiwi" class="form-control">
                            <?php if ($rficb_payment_qiwi) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-rficb_sort_order"><?php echo $entry_rficb_sort_order; ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="rficb_sort_order" value="<?php echo $rficb_sort_order; ?>" id="input-rficb_sort_order" class="form-control" />
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<?php echo $footer; ?>
