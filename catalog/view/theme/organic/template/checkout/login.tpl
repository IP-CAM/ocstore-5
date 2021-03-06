<div class="row">
  <div class="col-sm-6">
    <h2><?php echo $text_new_customer; ?></h2>
    <p><?php echo $text_checkout; ?></p>
    <div class="radio">
      <label>
        <?php if ($account == 'register') { ?>
        <input type="radio" name="account" value="register"/>
        <?php } else { ?>
        <input type="radio" name="account" value="register" />
        <?php } ?>
        <?php echo $text_register; ?></label>
    </div>
    <?php if ($checkout_guest) { ?>
    <div class="radio">
      <label>
        <?php if ($account == 'guest') { ?>
        <input type="radio" name="account" value="guest" checked="checked" />
        <?php } else { ?>
        <input type="radio" name="account" value="guest" checked="checked"/>
        <?php } ?>
        <?php echo $text_guest; ?></label>
    </div>
    <?php } ?>
    <p><?php echo $text_register_account; ?></p>
    <input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary button-orange" />
  </div>
  <div class="col-sm-6">
    <h2><?php echo $text_returning_customer; ?></h2>
    <p><?php echo $text_i_am_returning_customer; ?></p>
    <div class="form-group">

      <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control input-main-site" />
    </div>
    <div class="form-group">

      <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control input-main-site" />
      <p><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></p></div>
    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary button-orange" />
  </div>
</div>
<script language="Javascript" type="text/javascript">
    $(document).ready(function(){
        $('#button-account').trigger('click');
    });
</script>