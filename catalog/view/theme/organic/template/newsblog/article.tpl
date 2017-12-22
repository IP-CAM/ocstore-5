<?php echo $header; ?>

<?php if ($thumb || $images) { ?>

<?php if ($thumb) { ?>
<div class="page-inside-bg" style="background: url('<?php echo $original; ?>')no-repeat center;"></div>
<?php } ?>
<?php if ($images) { ?>
<?php foreach ($images as $image) { ?>
<?php } ?>
<?php } ?>

<?php } ?>

<div class="contacts-wrap cont_wrap clearfix">
  <ul class="breadcrumbs">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> <span>-</span></li><?php } else { ?>
    <li><?php echo $breadcrumb['text']; ?></li><?php } ?>
    <?php } ?>
  </ul>
  <div class="page-inside-content">
    <h1><?php echo $heading_title; ?></h1>
    <div class="page-inside-tags">
      <?php if ($tags) { ?>
      <div class="page-inside-tag clearfix">
        <span><?php echo $text_tags; ?></span>
        <ul>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>

        <li><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
        <?php } else { ?>
        <li><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
        </ul>
        <?php } ?>
      
        <?php } ?>
      </div>
      <?php } ?>
    </div>
    <div class="page-inside-text">
      <?php echo $description; ?>
      <?php if ($attributes) { ?>
      <div class="page-inside-atributes">
          <ul>
              <?php foreach ($attributes as $attribute_group) { ?>
                  <?php foreach ($attribute_group['attribute'] as $attribute_item) { ?>
                  <li class="clearfix">
                      <span><?php echo $attribute_item['name'];?></span>
              <div class="atributes-text"><?php echo $attribute_item['text'];?></div>
               </li>
                  <?php } ?>
              <?php } ?>
              
           
          </ul>
      </div>
      <?php } ?>
    </div>
  </div>
    <div class="page-inside-sidebar">
        <div class="catalog-page-wrap clearfix">
            <div class="collection-slider">
                <?php if ($products) { ?>
                <h2>Cопутствующие товары</h2>

                <?php $i = 0; ?>
                <?php foreach ($products as $product) { ?>

                <div class="catalog-block">
                    <div class="collection-blocks-inside">
                        <a href="<?php echo $product['href']; ?>" class="open-modal"></a>
                        <div class="clearfix"></div>
                        <img src="<?php echo $product['thumb']; ?>"
                             alt="<?php echo $product['name']; ?>"
                             title="<?php echo $product['name']; ?>"
                             class="img-responsive"/>

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
                                <h4 class="l-info"><span><?php echo $product['name']; ?></span></h4>&nbsp;
                                <?php echo $product['weight']; ?> мл
                                <?php if ($product['price']) { ?>
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
                                <?php } ?>
                            </div>

                        </div>
                    </div>
                    <div class="collection-blocks-outside clearfix">
                        <div class="button-fav">
                            <a href="javascript:void(0);" class="add-fav" data-toggle="tooltip"
                               title="<?php echo $button_wishlist; ?>"
                               onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></a>
                        </div>
                        <a href="javascript:void(0);" class="add-to-basket"
                           onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">добавить
                            в корзину</a>
                    </div>
                </div>


                <?php $i++; ?>
                <?php } ?>

                <?php } ?>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>