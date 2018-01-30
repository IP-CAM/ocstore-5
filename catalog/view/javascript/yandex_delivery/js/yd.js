var dialog_bootstrap = '<div class="modal fade" id="yd-sel-dlg" tabindex="-1" role="dialog"><div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Закрыть"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">Выбор пункта выдачи заказа</h4></div><div class="modal-body"><div class="container-fluid"><div class="row"><div class="col-md-3" style="height: auto;" id="filter_content"></div><div class="col-md-9"><div id="map" style="height:500px;"></div></div></div></div></div></div></div></div>';

var dialog_query_ui = '<div id="yd-sel-dlg" title="Выбор пункта выдачи заказа" style="background: white; width:100%; height:100%;"><div style="float: left; width: 15%; height: 100%;" id="left-pane"><div id="filter_content"></div></div><div id="map" style="overflow: hidden;width:85%; height:100%;"></div></div>';

function reloadSimple() {
    if(typeof reloadAll=="function"){
        reloadAll()
    }
    else if(typeof simplecheckout_reload=="function")
        simplecheckout_reload("yd");
}

function onFilterChange() {
    var allVals = [];
    $('.filter-delivery:checked').each(function() {
        allVals.push('(properties.delivery == "'+$(this).val()+'")');
    });
    if (allVals.length)
        objectManager.setFilter(allVals.join("||"));
    else
        objectManager.setFilter('properties.delivery == 0');
}

function select_yd_pvz(complex_id, pvz_id) {

    bootstrap_enabled = (typeof $().modal == 'function');

    $('html, body').css("cursor", "wait");
    $('#yd-sel-dlg').remove();
    var window_w = $(window).width();
    var window_h = window.innerHeight;
    var h = Math.max(window_h * 3 / 4, 480) | 0;
    var w = Math.max(window_w * 3 / 4, 640) | 0;

    if (bootstrap_enabled) {
        $("body").append(dialog_bootstrap);
        $("#map").css("height", h);
    }
    else {
        var dlg = $(dialog_query_ui);
        dlg.dialog({
            autoOpen: false,
            resize: function(event, ui) {
                if (ydMap !== undefined)
                    ydMap.container.fitToViewport();
            },
            height: h,
            width: w,
            modal: false
        });
    }

    var ydMap;
    ymaps.ready(init_yd);

    function init_yd() {
        ydMap = new ymaps.Map("map", {
            center: [55.76, 37.64],
            controls: ['zoomControl', 'searchControl'],
            zoom: 9
        });
        objectManager = new ymaps.ObjectManager({
            clusterize: false,
            clusterHasBalloon: false
        });
        BalloonContentLayout = ymaps.templateLayoutFactory.createClass('<div style="border-radius: 15px 50px; border: 1px solid #f2f2f2; line-height: 170%; margin: 15px; padding: 25px;"><div class="yandex_map_icon"><img src="catalog/view/javascript/yandex_delivery/image/svg/{{properties.class}}.svg"/></div>' + '<h4><strong class="b-strong">{{properties.pvz_name}}</strong></h4>' + 'Оплата: <span style="color: #808080">[if properties.has_payment_cash]наличные;[else][endif]' + '[if properties.has_payment_card] пластиковые карты;[else][endif]' + '[if properties.has_payment_prepaid] предоплаченные заказы;[else][endif]' + '</span><br><br>{{properties.full_address}}<br />' + '{{properties.phone}}<br />Часы работы: ' + '{{properties.wt}}<br /><br />' + '<button style="float: right; margin-top: -16px;" id="ok-button" data-pvz-id="{{properties.pvz_id}}"> Выбрать </button>' + '</div>', {
            build: function() {
                BalloonContentLayout.superclass.build.call(this);
                $('#ok-button').bind('click', this.onOkClick);
            },
            clear: function() {
                $('#ok-button').unbind('click', this.onOkClick);
                BalloonContentLayout.superclass.clear.call(this);
            },
            onOkClick: function() {
                if (bootstrap_enabled)
                    $('#yd-sel-dlg').modal('hide');
                else
                    $('#yd-sel-dlg').dialog('close');
                var pvzId = $('#ok-button').attr('data-pvz-id');
                ydMap.destroy();
                var delivery = pvzId.split('-');
                var selex = $('.yandex-delivery-pickup-method');
                if (selex.length) {
                    selex.val(pvzId).trigger('change');
                    $('#yandex_delivery\\.PICKUP').prop('checked', true);
                }
                else {
                    var selector = $('#pvz-select-'+delivery[0]+'-'+delivery[1]);
                    if (selector.length) selector.val(delivery[2]).change(); else {
                        $('input[name="shipping_method"]').val(['yandex_delivery.PICKUP_'+delivery[0]+'_'+delivery[1]]).trigger('change');
                    }
                }
            }
        });

        objectManager.objects.options.set({
            balloonContentLayout: BalloonContentLayout
        });

        ydMap.geoObjects.add(objectManager);

        $.ajax({
            url: 'index.php?route=checkout/yandex_delivery/getMapData',
            data : {delivery: complex_id, pvz: pvz_id},
            dataType: 'json'
        }).done(function(data) {
            objectManager.add(data.om);
            $('#filter_content').html(data.filter);
            onFilterChange();
            bound_size = false;
            if (data.position)
                ydMap.setCenter(data.position.location, data.position.zoom);

            if (bootstrap_enabled) {
                $('#yd-sel-dlg').modal('show');
            }
            else {
                $('#yd-sel-dlg').dialog("open");
            }
            if (!bound_size) {
                bound_size = $('#yd-sel-dlg').height();
                var cz = ymaps.util.bounds.getCenterAndZoom(objectManager.getBounds(), [bound_size, bound_size]);
                ydMap.setCenter(cz.center, cz.zoom);
            }
            $('html, body').css("cursor", "auto");
        });
    }
}