<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumbs">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
        <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> <span>-</span></li><?php } else { ?>
        <li><?php echo $breadcrumb['text']; ?></li><?php } ?>
        <?php } ?>
    </ul>
    <div class="content-cart order-cart">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
                <div class="row"><?php echo $column_left; ?>
                <?php if ($column_left && $column_right) { ?>
                    <?php $class = 'col-sm-6'; ?>
                        <?php } elseif ($column_left || $column_right) { ?>
                            <?php $class = 'col-sm-9'; ?>
                                <?php } else { ?>
                                    <?php $class = 'col-sm-12'; ?>
                                        <?php } ?>
                                        <div id="content">
                                            <div class="page-inside-content" style="float: none;width: 100%;">
                                        <h1><?=$heading_title?></h1>
                                            </div>
                                        <div class="">
                                        <div class="checkout checkout-checkout">

                                        <?=$content_top; ?>

                                        <div class="payment">

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 payment-data">
                                        <?php if(!$c_logged) {?>
                                        <div id="login_warning" class='checkout-content note'>
                                            <?=$text_notlogged?>

                                        </div>

                                        <?php } ?>
                                        <div id="payment-address">
                                            <div class="checkout-content" style="overflow: hidden; display: block;">
                                                <div class="row login-block" style="padding: 20px 0;">
                                                    <div class="col-sm-6">
                                                        <div class="fields-group">
                                                            <input type="text" id="city-ch" name="city" value="<?php echo $city; ?>"
                                                                   class="form-control large-field input-main-site"
                                                                   placeholder="Город">
                                                            <span class="error"></span>
                                                        </div>
                                                        <div class="fields-group">
                                                            <select onChange="updateShipping(this)" name="shipping_method"
                                                                    id="shipping-method"
                                                                    class="form-control large-field input-main-site">
                                                                <?php foreach ($shippig_methods as $shipping_method) { ?>
                                                                <option

                                                                        value='{"title": "<?php echo $shipping_method['title'] ?>", "code": "<?php echo $shipping_method['value'] ?>", "comment":"", "shipping_method":"<?php echo $shipping_method['value'] ?>", "cost":"<?php echo $shipping_method['cost'] ?>","tax_class_id":""}'
                                                                        class="form-control large-field <?= substr($shipping_method['value'], strpos($shipping_method['value'], '.')+1 )?>"><?php echo $shipping_method['title'] ?></option>

                                                                <?php } ?>
                                                            </select>
                                                            <br>
                                                            <input type='hidden' name='delivery-type' value='delivery'/>
                                                            <input type="text" name="address_1" id="address_1"
                                                                   value="<?php echo $address_1 ?>"
                                                                   class="form-control large-field input-main-site"
                                                                   placeholder="Введите адрес(улица,дом,кв.)">
                                                            <span class="error"></span>

                                                        </div>
                                                        <div class="fields-group" style="">
                                                            <select id="payment_select" name="payment_method"
                                                                    class="form-control large-field input-main-site">
                                                                <?php foreach ($payment_methods as $payment_method) { ?>
                                                                <option
                                                                        value='{"title": "<?php echo $payment_method['title'] ?>", "code": "<?php echo $payment_method['code'] ?>"}'
                                                                        class="payment_method_value <?php echo $payment_method['code']?>"
                                                                        style=""><?php echo $payment_method['title'] ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>

                                                        <div class="fields-group">
                                                            <input type="text" id="comment_field"
                                                                   class="form-control large-field input-main-site-area"
                                                                   name="comment"
                                                                   value="<?php echo $comment ?>" placeholder="Коментарий:">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row login-block" style="padding: 10px 0;">
                                                    <div class="fields-group col-3">
                                                        <?php if($c_logged) {?>
                                                        <input type="text" class="form-control large-field input-main-site" id="firstname-ch" name="firstname"  value="<?php echo $c_name; ?>" readonly="true" />
                                                        <?php } else { ?>
                                                        <input type="text" id="firstname-ch" name="firstname" value=""
                                                               class="form-control large-field input-main-site"
                                                               placeholder="ФИО*">
                                                        <span class="error"></span>
                                                        <?php }?>
                                                    </div>
                                                    <div class="fields-group col-3">
                                                        <input type="tel" id="telephone-ch" name="telephone"
                                                               value="<?php echo $telephone; ?>"
                                                               class="form-control large-field input-main-site"
                                                               placeholder="Телефон:*">
                                                        <span class="error"></span>

                                                    </div>

                                                    <div class="fields-group col-3">
                                                        <input type="text" id="email-ch" name="email"
                                                               value="<?php echo $email; ?>"
                                                               class="form-control large-field input-main-site"
                                                               placeholder="E-mail">
                                                        <span class="error"></span>

                                                    </div>
                                                </div>
                                                <div class="row login-block" style="padding: 10px 0;">
                                                    <?php if ($modules) { ?>
                                                    <div>
                                                        <?php foreach ($modules as $module) { ?>
                                                        <?php echo $module; ?>
                                                        <?php } ?>
                                                    </div>
                                                    <?php } ?>
                                                    <div class="fields-group col-3">
                                                        <div class="v-cart-total">
                                                            <?php if (!isset($redirect)) { ?>
                                                            <?php foreach ($totals as $total) { ?>
                                                            <div class="v-cart-total-title" style="font-size: 20px;"><?php echo $total['title']; ?></div>
                                                            <div class="v-cart-total-info" style="border-bottom: none;font-size: 24px;"><?php echo $total['text']; ?></div>
                                                            <?php } ?>
                                                            <?php } else { ?>
                                                            <script type="text/javascript"><!--
                                                                location = '<?php echo $redirect; ?>';
                                                                //--></script>
                                                            <?php } ?>

                                                        </div>
                                                    </div>
                                            </div>
                                                                        </div>
                                        </div>
                                                                       </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 checkout-data">
                                                                        <div class="cart-info table-responsive">
                                                                            <div id="confirm">
                                                                        <div class="payment">
                                                                            <a href='index.php?route=checkout/cart' style="text-decoration: none;" class="pull-left">
                                                                                <div id="button-modify" class=" btn btn-lg btn-cancel button-orange button-green">
                                                                                    Назад
                                                                                </div>
                                                                            </a>
                                                                        <div id="ajax-button-confirm" class=" btn btn-lg btn-success button-orange pull-right">
                                                                        Купить
                                                                        </div>

                                                                        </div>

                                                                        </div>
 
                                                                                        </div>
                                                                                                                                                                                <div class="col-xs-12 checkout-subinfo">
                                                                                        <?=$content_bottom?>
                                                                                        </div>
                                                                                        </div>
                                                                                        </div>
                                                                                        </div>
                                                                                        <?php echo $column_right; ?></div>
                                                                                        </div>
    <div class="hiden_payment_info"  style="display:none;"></div>
</div>
    </div>
    <script type="text/javascript"><!--

function updateShipping(s) {
    shp = JSON.parse(s.value)
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: shp,
        dataType: 'json',
        beforeSend: function() {
            $('#shipping-method').addClass('loading');
		},
        success: function(json) {
            $('.alert, .text-danger').remove();

            //if (json['redirect']) {
            //    location = json['redirect'];
            //}
            if (json['error']) {
                if (json['error']['warning']) {
                 // Error ylanyrkkaan....
                 alert(json['error']['warning']);
                }
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/onepagecheckout/totals',
                    type: 'get',
                    success: function(json) {
                        $('#totals tbody').remove();
                        $('#totals').append('<tbody></tbody');
                        for (t in json['totals']) {
                            $('#totals tbody').append('<tr class="name subtotal"><td class="name subtotal"><strong>'+json['totals'][t]['title']+'</strong></td><td class="price">'+json['totals'][t]["text"]+'</td></tr>');
                            }
                    }
                    });
                // Update Totalsi!
            }
            $('#shipping-method').removeClass('loading');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
        }
        ); //ajax
}

$(document).ready(function () {

    $(' #LoginModal .submit-login-form ').on('click', function(){
        $.ajax({
                url: 'index.php?route=checkout/onepagecheckout/AjaxLogin',
                type: 'post',
                data: $('#LoginModal #input-email, #LoginModal #input-password '),
                dataType: 'json',
                beforeSend: function() {

                },
                success: function(json) {
                    console.log(json);
                   if(json.errors!=0){
                       if(typeof json.errors.warning!='undefined' && json.errors.warning!='')
                       $('#LoginModal .errors-block').html(json.errors.warning) ;
                       if(typeof json.errors.errors!='undefined'&& json.errors.errors!='')
                       $('#LoginModal .errors-block').append( '<br>' + json.errors.error ) ;
                   }
                   else if(json.errors==0){
                       $('#firstname-ch').prop('value',json.c_name);
                       $('#city-ch').prop('value',json.city);
                       $('#address_1').prop('value',json.address_1);
                       $('#email-ch').prop('value',json.email);
                       $('#telephone-ch').prop('value',json.telephone);
                       $('#LoginModal').modal('hide');
                       $('#login_warning').html('');
                   }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            }
        ); //ajax
        return false;
    });

            $('#ajax-button-confirm').on('click', function () {

$.ajax({
url: 'index.php?route=checkout/onepagecheckout',
type: 'post',
data: $('.checkout-checkout .payment-data input[type=\'text\'], .checkout-checkout .payment-data input[type=\'tel\'], .checkout-checkout .payment-data input[type=\'radio\']:checked, .checkout-checkout .payment-datainput input[type=\'checkbox\']:checked, .checkout-checkout .payment-data  select '),
dataType: 'json',
beforeSend: function () {
$('#ajax-button-confirm').addClass('preloader');

},
complete: function () {
$('#ajax-button-confirm').removeClass('preloader');

},
success: function (json) {
console.log(json);

if (json.error) {
if (json['error']['firstname']) {
$('#firstname-ch+.error').html(json['error']['firstname']);
}


if (json['error']['email']) {
    $('#email-ch+.error').html(json['error']['email']);
}

if (json['error']['telephone']) {
    $('#telephone-ch+.error').html(json['error']['telephone']);
}

if (json['error']['address_1']) {
    $('#address_1+.error').html(json['error']['address_1']);
}

if (json['error']['city']) {
    $('#city-ch+.error').html(json['error']['city']);
}
}

else if(json['cod']) {
    $.ajax({
        type: 'get',
        url: 'index.php?route=extension/payment/cod/confirm',
        cache: false,
        beforeSend: function() {
            $('#ajax-button-confirm').button('loading');
        },
        complete: function() {
            $('#ajax-button-confirm').button('reset');
        },
        success: function() {
            location = 'index.php?route=checkout/success';
        }
    });
}

else if(json['payment']) {
    $('.hiden_payment_info').html(json['payment']);
    console.log($('.hiden_payment_info a').attr('href'));
    location = $('.hiden_payment_info a').attr('href');
}
else {
    if (json.credit)
        credit_confirm('/index.php?route=checkout/part_payment_cart/getResult&from_privat24=true');
   /* else
        location = 'index.php?route=checkout/success'*/

}
},
error: function (xhr, ajaxOptions, thrownError) {
           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
       }
});


});


});
//--></script>

<?php echo $footer; ?>
