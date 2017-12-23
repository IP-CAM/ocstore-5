<div id="cart">
   <span class="v-total">
    <?php if ($count > 0) { ?>
    <span class="count"><?php echo $count; ?></span>
    <?php } ?>
  </span>
    <div class="total-price-head">
        <?php $sum_Head = 0;foreach ($totals as $total)  {
            if($total['title'] == 'Итого') continue;
            $int = str_replace('р.','',$total['text']);
            $int = trim(str_replace(' ','',$int));
            $sum_Head += $int;
        } ?>
        <b class="add-price" id="add-price-top"><?php echo $sum_Head; ?> р.</b>

    </div>
</div>
<script>
    function cartTotal(price) {
        var oldPrice = parseInt($('.total-price-head').text()) || 0;
        $('.total-price-head').text(oldPrice + parseInt(price) + " р.");
    }
</script>