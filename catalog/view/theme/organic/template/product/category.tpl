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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($thumb || $description) { ?>
      <div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <hr>
      <?php } ?>
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>

      <div class="catalog-page-wrap clearfix">
        <div class="collection-slider">
          <?php foreach ($products as $product) { ?>
          <div class="catalog-block">
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
              <a href="javascript:void(0);" class="add-to-basket" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">добавить в корзину</a>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>

      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
