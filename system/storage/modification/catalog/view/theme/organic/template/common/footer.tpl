
<div class="footer_bg">

			<?php if (isset ($ya_metrika_active) && $ya_metrika_active){ ?>
				<?php echo $yandex_metrika; ?>
				<script type="text/javascript">
					var old_addCart = cart.add;
					cart.add = function (product_id, quantity)
					{
						var params_cart = new Array();
						params_cart['name'] = 'product id = '+product_id;
						params_cart['quantity'] = quantity;
						params_cart['price'] = 0;
						old_addCart(product_id, quantity);
						metrikaReach('metrikaCart', params_cart);
					}

					$('#button-cart').on('click', function() {
						var params_cart = new Array();
						params_cart['name'] = 'product id = '+ $('#product input[name="product_id"]').val();
						params_cart['quantity'] = $('#product input[name="quantity"]').val();
						params_cart['price'] = 0;
						metrikaReach('metrikaCart', params_cart);
					});

					function metrikaReach(goal_name, params) {
					for (var i in window) {
						if (/^yaCounter\d+/.test(i)) {
							window[i].reachGoal(goal_name, params);
						}
					}
				}
				</script>
			<?php } ?>
  <footer>
    <?php if ($categories) { ?>



      <?php foreach ($categories as $category) { ?>
      <?php if ($category['children']) { ?>
      <div class="footer-list-bottom-block">
        <div class="footer-list-bottom-block-title"><?php echo $category['name']; ?></div>


        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
        <ul>
          <?php foreach ($children as $child) { ?>
          <li>

            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>

      </div>
      <?php } else { ?>

      <?php } ?>
      <?php } ?>




    <?php } ?>
    <div id="test-modal" class="white-popup mfp-with-anim mfp-hide">
      <form id="form_footer">
        <div class="form-modal-title">заказать обратный звонок</div>
        <input type="text" name="name" placeholder="Ваше имя" class="modal-input">
        <input type="text" name="phone" placeholder="Телефон" required class="modal-input">
        <input type="submit" value="Отправить" class="modal-submit">
        <p class="pol">
          <input type="checkbox" required>
          Нажимая кнопку отправить или заказать Вы соглашаетесь с нашей <a href="https://omega3.su/pravila-konfidencialnosti" target="_blank">Политикой конфиденциальности</a>
        </p>
      </form>
    </div>
    <ul class="pravila">
      <li><a href="https://omega3.su/pravila-konfidencialnosti">Политика конфиденциальности</a></li>
      <li><a href="https://omega3.su/uslovija-vozvrata">Условия возврата</a></li>
      <li><a href="https://omega3.su/uslovija-oferti">Условия оферты</a></li>
      <li><a href="https://omega3.su/rekviziti">Реквизиты</a></li>
    </ul>
    <div class="copyright">© 2017. ОрганикГолд. Все права защищены</div>
  </footer>
</div>
</div>
<div id="menu">
  <ul>
    <li><a href="/">Главная</a></li>
    <li>
      <a href="https://omega3.su/katalog/">Каталог</a>
    </li>
    <li><a href="https://omega3.su/optovikam">Оптовикам</a></li>
      <li><a href="https://omega3.su/nashe-proizvodstvo">Наше производство</a></li>
      <li><a href="https://omega3.su/index.php?route=information/certificates">Сертификаты</a></li>
      <li><a href="https://omega3.su/delivery-pay">Оплата / Доставка</a></li>
      <li><a href="https://omega3.su/contact-us/">Контакты</a></li>
      <li><a href="<?php echo $account; ?>">Личный кабинет</a></li>
  </ul>
  <div class="close">×</div>
</div>
<!-- Yandex.Metrika counter -->
<script>
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter46499280 = new Ya.Metrika({
                    id:46499280,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/46499280" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
</body></html>