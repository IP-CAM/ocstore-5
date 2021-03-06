<?php
// Heading
$_['heading_title']      = 'Интеграция с сервисом Яндекс.Доставка (версия 3.2.7)';

// Text
$_['text_module']      = 'Модули';
$_['text_success']       = 'Настройки модуля обновлены!';
$_['text_create_order_manual']       = 'Менеджер будет создавать заказ самостоятельно';
$_['text_create_order_auto']       = 'Автоматически, когда статус заказа будет равен:';
$_['text_address_one_line'] = 'Поле "Улица" заполняется строкой "Адрес 1" (улица, номер дома и т.д), далее оператор разбивает это по полям самостоятельно';
$_['text_address_simple'] = 'С помощью Simple были сделаны новые поля объекта <i>"адрес"</i> для улицы, номера дома, квартиры и т.д - брать значения оттуда';
$_['text_address_simple2'] = '<p>Новые адресные поля размещены на странице заказа в блоке :</p>';
$_['text_block_payment'] = 'Адрес оплаты';
$_['text_block_shipment'] = 'Адрес доставки';
$_['text_field_street'] = 'Улица';
$_['text_field_house'] = 'Номер дома';
$_['text_field_housing'] = 'Корпус';
$_['text_field_build'] = 'Строение';
$_['text_field_flat'] = 'Квартира/офис';
$_['text_header_yd'] = 'Поле Яндекс.Доставки';
$_['text_header_simple'] = 'Имя поля в Simple';
$_['text_article_fields'] = 'id;model;sku;upc;ean;jan;isbn;mpn';

// Entry
$_['entry_create_order_mode']       = 'В какой момент создавать заказ в службе Яндекс.Доставка:';
$_['entry_status']       = 'Статус:';
$_['entry_api'] = 'Введите идентификаторы магазина и склада по умолчанию, которые будут использоваться при автоматическом создании заказа.<br><br>Их можно получить на <a href="https://delivery.yandex.ru/integration" target="_blank">этой странице</a>, нажав на ссылку "API-ключи -> Получить".';
$_['entry_api_hint1'] = 'Значение id склада по умолчанию из списка складов warehouses, например - 7658:<br>';
$_['entry_api_hint2'] = 'Значение id из списка реквизитов requisites, например - 1642:<br>';
$_['entry_address_input_mode'] = 'Режим заполнения адресных полей';
$_['entry_middle_name'] = 'Поле "Отчество" заполнять из следующего поля модуля Simple:';
$_['entry_product_article'] = 'Артикул товара заполнять следующим полем таблицы "Товар":';

// Error
$_['error_permission']   = 'У Вас нет прав для управления этим модулем!';
$_['error_no_api_data'] = 'Не указаны ключи API сервиса! Зайдите в настройки модуля Яндекс.Доставка и введите ключи доступа.';
?>