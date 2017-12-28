<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="yandex-verification" content="950b5e514b4280fd" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
    <link href="catalog/view/theme/organic/stylesheet/main.min.css" rel="stylesheet">
    <script src="catalog/view/theme/organic/js/main.min.js"></script>
    <script src="catalog/view/theme/organic/js/jquery.sticky-sidebar.min.js"></script>
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU"></script>
    <script src="catalog/view/theme/organic/js/script.js"></script>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<!-- HEADER -->
  <header>
    <div class="logo">
            <a href="/">
          <img src="<?php echo $logo; ?>" alt="Органик-Голд">
            </a>
    </div>
    <ul class="top-menu">
      <li><a href="/">Главная</a></li>
      <li class="top-menu-toggle">
                <a href="https://omega3.su/katalog/" class="top-menu-toggle-link">Каталог</a>
                <ul class="submenu">
                    <li><a href="https://omega3.su/katalog/sostav-1">Состав №1</a></li>
                    <li><a href="https://omega3.su/katalog/sostav-2">Состав №2</a></li>
                    <li><a href="https://omega3.su/katalog/sostav-3">Состав №3</a></li>
                    <li><a href="https://omega3.su/katalog/sostav-4">Состав №4</a></li>
                    <li><a href="https://omega3.su/katalog/sostav-5">Состав №5</a></li>
                    <li><a href="https://omega3.su/katalog/sostav-6">Состав №6</a></li>
                    <li><a href="https://omega3.su/katalog/sostav-7">Состав №7</a></li>
                    <li><a href="https://omega3.su/katalog/sostav-8">Состав №8</a></li>
                </ul>
            </li>
      <li><a href="https://omega3.su/optovikam">Оптовикам</a></li>
      <li><a href="https://omega3.su/nashe-proizvodstvo">Наше производство</a></li>
      <li><a href="https://omega3.su/index.php?route=information/certificates">Сертификаты</a></li>
      <li><a href="https://omega3.su/delivery-pay">Оплата / Доставка</a></li>
      <li><a href="https://omega3.su/contact-us/">Контакты</a></li>
    </ul>
        <div class="toggle_menu">
            <a href="#menu" id="toggle" class=""><span></span></a>
        </div>
    <div class="basket">
      <a href="<?php echo $shopping_cart; ?>" class="total-items"><?php echo $cart; ?></a>
      <a href="<?php echo $wishlist; ?>" class="favorite" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i><span><?php echo $text_wishlist; ?></span></i></a>

    </div>
  </header>
<div id="test-modal1" class="white-popup mfp-with-anim mfp-hide">
    <?php echo $quicksignup; ?>
</div>
    <div class="mt"></div>
<!-- END HEADER -->
<!-- LEFT MENU -->
    <div class="left-menu-wrapper clearfix">
        <div class="toggle-category">
            <span class="desc-mobile"><i></i></span>
            <ul>


                <li>
        <span>
            <i class="icon-left1"></i>
        </span>

                </li>
                <li>
        <span>
            <i class="icon-left1"></i>
        </span>


                </li>
                <li>
        <span>
            <i class="icon-left1"></i>
        </span>


                </li>
                <li>
        <span>
            <i class="icon-left1"></i>
        </span>


                </li>
                <li>
        <span>
            <i class="icon-left1"></i>
        </span>


                </li>
            </ul>
        </div>
        <?php if ($categories) { ?>

        <div class="v-hide-m">
        <ul class="main-r-menu">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li>
<span>
                    <i class="icon-left1"></i>
    <?php echo $category['name']; ?>
</span>
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <ul>
                <?php foreach ($children as $child) { ?>
                    <li>

                        <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                    </li>
                <?php } ?>
                </ul>
            <?php } ?>

            </li>
        <?php } else { ?>

        <?php } ?>
        <?php } ?>
        </ul>
        <div class="close">x</div>
        </div>

    <?php } ?>
        <div class="contacts-left-wrap">
            <div class="contacts-left-block inline-popups" style="margin-top: 35px;">
                <?php if (!$logged) { ?>
                <div class="buttons-left-sidebar">
                <a href="#test-modal1" class="btn btn-primary button-orange popup-modal btn-log"
                data-effect="mfp-3d-unfold">вход</a>
                <a href="#test-modal1" class="btn btn-primary button-orange button-green popup-modal btn-reg"
                data-effect="mfp-3d-unfold">регистрация</a>
                </div>
                <?php } else { ?>
                Имя

                <?php }?>

            <div class="contacts-left-title" style="margin: 20px 0;">контакты</div>

                <div class="contacts-left-block-phone"><?php echo $telephone; ?></div>
                <a href="#test-modal" class="contacts-left-block-link popup-modal" data-effect="mfp-3d-unfold">заказать обратный звонок</a>
            </div>
            <div class="contacts-left-block" style="margin-top: 20px;">
                <div class="contacts-left-block-title">E-mail</div>
                <a href="mailto:<?php echo $email; ?>" class="contacts-left-block-mail"><?php echo $email; ?></a>                
            </div>
            <div class="contacts-left-block" style="margin-top: 20px;">
                <div class="contacts-left-block-title">Мы в соц. сетях</div>
<!--noindex-->	
	<div class="social-wrap">
		<a href="https://www.facebook.com/groups/1288952877853649/" class="facebook" target="_blank" rel="nofollow"></a>
		<a href="https://www.instagram.com/organicgoldofficial/" class="instagram" target="_blank" rel="nofollow"></a>
		<a href="https://www.youtube.com/c/OrganicGold" class="youtube" target="_blank" rel="nofollow"></a>
		<a href="https://twitter.com/Organic_Goldoff" class="twitter" target="_blank" rel="nofollow"></a>
		<a href="https://ok.ru/group/58286108966963" class="odnoklasniki" target="_blank" rel="nofollow"></a>
	</div>
<!--/noindex-->
            </div>
        </div>
    </div>
<!-- END LEFT MENU -->
<div class="main-slider-wrap">