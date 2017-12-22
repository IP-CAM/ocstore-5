<div class="row">
  <div class="collection-wrap">
  <div class="collection-title"><?php echo $heading_title; ?></div>
    <div class="collection-slider clearfix">
        <?php foreach ($products as $product) { ?>

          <div class="collection-blocks">
            <div class="collection-blocks-inside">
              <div class="product-thumb transition">
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                <div class="caption">
                  <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                  <p><?php echo $product['description']; ?></p>
                  <?php if ($product['rating']) { ?>
                  <div class="rating">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($product['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                  <?php if ($product['price']) { ?>
                  <p class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                    <?php } ?>
                    <?php if ($product['tax']) { ?>
                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                    <?php } ?>
                  </p>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div class="collection-blocks-outside clearfix">
                <div class="button-fav">
                  <a href="" class="add-fav" data-toggle="tooltip" title="<?php echo $button_wishlist; ?> "onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></a>
                </div>
                <a href="" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="add-to-basket">добавить в корзину</a>
              </div>
          </div>

        <?php } ?>
    </div>
  </div>
</div>
