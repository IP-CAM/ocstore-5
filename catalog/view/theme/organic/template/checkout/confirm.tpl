<div class="v-cart-total">
  <?php if (!isset($redirect)) { ?>
  <div class="v-cart-total-title">Ващ заказ</div>
  <?php foreach ($products as $product) { ?>
  <div class="v-cart-total-info">
    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
    <?php foreach ($product['option'] as $option) { ?>
    <br />
    &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
    <?php } ?>
    <?php if($product['recurring']) { ?>
    <br />
    <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
    <?php } ?>,
    <?php echo $product['quantity']; ?>шт,
    <?php echo $product['total']; ?>


  </div>
  <?php } ?>
  <?php foreach ($totals as $total) { ?>
  <div class="v-cart-total-title"><?php echo $total['title']; ?></div>
  <div class="v-cart-total-info"><?php echo $total['text']; ?></div>
  <?php } ?>
  <?php echo $payment; ?>
  <?php } else { ?>
  <script type="text/javascript"><!--
      location = '<?php echo $redirect; ?>';
      //--></script>
  <?php } ?>

</div>
