<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> <span>-</span></li><?php } else { ?>
    <li><?php echo $breadcrumb['text']; ?></li><?php } ?>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> content-cart"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <div class="row">
            <div class="col-sm-6" style="padding-left: 0;margin-bottom: 10px;">

          <div class="form-group required">

            <div class="col-sm-10">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>*" id="input-password" class="form-control input-main-site" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
          </div>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>*" id="input-confirm" class="form-control input-main-site" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default button-orange button-green"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary button-orange" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>