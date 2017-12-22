<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="reviews-block clearfix">
  <div class="reviews-block-icon"></div>
  <div class="reviews-block-text">
    <div class="reviews-block-author">
      <?php echo $review['author']; ?>
      <div class="rating-stars">
        <?php for ($i = 1; $i <= 5; $i++) { ?>
        <?php if ($review['rating'] < $i) { ?>
        <a href="" class="grey-star"></a>
        <?php } else { ?>
        <a href="" class="golden-star"></a>
        <?php } ?>
        <?php } ?>
      </div>

    </div>
    <p><?php echo $review['text']; ?></p>
  </div>
</div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
