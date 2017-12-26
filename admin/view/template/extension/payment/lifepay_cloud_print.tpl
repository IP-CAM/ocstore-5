<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-lifepay-cloud-print" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>

    <div class="container-fluid">

        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Settings</h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-lifepay-cloud-print" class="form-horizontal">


                    <!-- LIFE PAY фискализация: Включено/Выключено-->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_lifepay_status; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="lifepay_status" class="form-control">
                                <option value="1" <?php echo $lifepay_status == 1 ? 'selected="selected"' : ''; ?>><?php echo $status_enabled; ?></option>
                                <option value="0" <?php echo $lifepay_status == 0 ? 'selected="selected"' : ''; ?>><?php echo $status_disabled; ?></option>
                            </select>
                        </div>
                    </div>

                    <!-- LIFE PAY фискализация тестовый режим: Включено/Выключено-->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_lifepay_testmode; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="lifepay_test" class="form-control">
                                <option value="1" <?php echo $lifepay_test == 1 ? 'selected="selected"' : ''; ?>><?php echo $status_enabled; ?></option>
                                <option value="0" <?php echo $lifepay_test == 0 ? 'selected="selected"' : ''; ?>><?php echo $status_disabled; ?></option>
                            </select>
                        </div>
                    </div>

                    <!-- LIFE PAY логин -->
                    <div class="form-group required">
                        <label class="col-sm-3 control-label" for="">
                            <?php echo $entry_lifepay_login; ?>
                        </label>
                        <div class="col-sm-9">
                            <input type="text" name="lifepay_login" value="<?php echo $lifepay_login; ?>" class="form-control" />
                            <?php if ($error_login) { ?>
                            <div class="text-danger"><?php echo $error_login; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <!-- LIFE PAY API ключ -->
                    <div class="form-group required">
                        <label class="col-sm-3 control-label" for="">
                            <?php echo $entry_lifepay_api_key; ?>
                        </label>
                        <div class="col-sm-9">
                            <input type="text" name="lifepay_api_key" value="<?php echo $lifepay_api_key; ?>" class="form-control" />
                            <?php if ($error_api_key) { ?>
                            <div class="text-danger"><?php echo $error_api_key; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <!-- LIFE PAY Режим печати/отправки чека -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_lifepay_mode; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="lifepay_mode" class="form-control">
                                <option value="print" <?php echo $lifepay_mode == 'print' ? 'selected="selected"' : ''; ?>>распечатать чек (по умолчанию)</option>
                                <option value="email" <?php echo $lifepay_mode == 'email' ? 'selected="selected"' : ''; ?>>отправить электронный чек по email и/или смс</option>
                                <option value="print_email" <?php echo $lifepay_mode == 'print_email' ? 'selected="selected"' : ''; ?>>распечатать чек и отправить по email и/или смс</option>
                            </select>
                        </div>
                    </div>

                    <!-- LIFE PAY Серийный номер принтера, на котором надо распечатать фискальный чек -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="">
                            <span data-toggle="tooltip" title="" data-original-title="<?php echo $entry_lifepay_target_serial_help; ?>"><?php echo $entry_lifepay_target_serial; ?></span>
                        </label>

                        <div class="col-sm-9">
                            <input type="text" name="lifepay_target_serial" value="<?php echo $lifepay_target_serial; ?>" class="form-control" />
                        </div>
                    </div>



                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>