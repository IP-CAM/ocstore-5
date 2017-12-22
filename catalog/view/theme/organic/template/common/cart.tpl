<div id="cart">
   <span class="v-total">
    <?php if ($count > 0) { ?>
    <span class="count"><?php echo $count; ?><?php echo $count; ?></span>
    <?php } ?>
  </span>
    <div class="total-price-head">
        <?php foreach ($products as $product) { ?>

        <?php if ($count > 0) { ?>
        <b class="add-price"><?php echo $product['total']; ?></b>
        <?php } else { ?>

        <?php } ?>


        <?php } ?>

    </div>
</div>
