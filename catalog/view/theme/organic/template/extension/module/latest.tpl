<div class="row">
  <div class="collection-wrap collection-wrap-home">
    <div class="collection-title">золотая коллекция масел</div>
    <div class="collection-slider clearfix">
      <a href="https://omega3.su/katalog/" class="show_all">смотреть все</a>
      <div class="clearfix"></div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <?php foreach ($products as $product) { ?>
          <div class="swiper-slide">
            <div class="collection-blocks">
              <div class="collection-blocks-inside">
                <a href="<?php echo $product['href']; ?>" class="open-modal"></a>
                <div class="clearfix"></div>
                <div class="align-center">
                  <a href="<?php echo $product['href']; ?>" class="ln">
                    <img src="<?php echo $product['thumb']; ?>"
                         alt="<?php echo $product['name']; ?>"
                         title="<?php echo $product['name']; ?>"
                         class="img-responsive"/></a>
                </div>

                <div class="caption">
                  <div class="rating-stars">
                    <?php if ($product['rating']) { ?>

                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($product['rating'] < $i) { ?>
                    <a href="javascript:void(0);" class="grey-star"></a>
                    <?php } else { ?>
                    <a href="javascript:void(0);" class="golden-star"></a>
                    <?php } ?>
                    <?php } ?>

                    <?php } ?>
                  </div>
                  <div class="info-collection clearfix">
                    <a href="<?php echo $product['href']; ?>" class="ln pull-left">
                      <h4 class="l-info"><span><?php echo $product['name']; ?></span></h4></a>&nbsp;
                    <?php echo $product['weight']; ?> мл
                    <a href="<?php echo $product['href']; ?>" class="ln pull-right"><?php if ($product['price']) { ?>
                      <p class="r-info">
                        <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span> <span
                                class="price-old"><?php echo $product['price']; ?></span>
                        <?php } ?>
                        <?php if ($product['tax']) { ?>
                        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                        <?php } ?>
                      </p>
                    </a>
                    <?php } ?>
                  </div>

                </div>
              </div>
              <div class="collection-blocks-outside clearfix">
                <div class="button-fav">
                  <a href="javascript:void(0);" class="add-fav" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"
                     onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></a>
                </div>
                <a href="javascript:void(0);" class="add-to-basket" onclick="cart.add('<?php echo $product['product_id']; ?>');">добавить в корзину</a>
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
      <div class="swiper-button-next">&gt;</div>
      <div class="swiper-button-prev">&lt;</div>
    </div>
  </div>
</div>
