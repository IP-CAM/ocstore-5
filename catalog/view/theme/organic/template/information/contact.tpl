<?php echo $header; ?>
<div class="contacts-bg"></div>
<div class="contacts-wrap clearfix">
  <div class="contacts-text">
    <div class="contacts-left-title">контакты</div>
    <div class="contacts-left-block inline-popups">
      <div class="contacts-left-block-title">Телефон</div>
      <div class="contacts-left-block-phone"><?php echo $telephone; ?></div>
      <a href="#test-modal" class="contacts-left-block-link popup-modal" data-effect="mfp-3d-unfold">заказать обратный звонок</a>
    </div>
    <div class="contacts-left-block">
      <div class="contacts-left-block-title">E-mail</div>
      <a href="mailto:info@omega3.su" class="contacts-left-block-mail">info@omega3.su</a>
    </div>
    <div class="contacts-left-block">
      <div class="contacts-left-block-title">Офис продаж</div>
      <p><?php echo $address; ?> <br>
        <?php echo $open; ?>
      </p>
    </div>
   
  </div>
  <div id="map"></div>
</div>
<div class="clearfix"></div>
<?php echo $footer; ?>
