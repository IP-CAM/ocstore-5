<?php
class ModelTotalYandexDeliveryTotal extends Model {

    public function getTotal(&$total_data, &$total, &$taxes) {
        if ((!empty($this->session->data['payment_method']['code']) && $this->session->data['payment_method']['code'] == 'yandex_delivery_payment')
            || (isset($this->request->post['payment_code']) && $this->request->post['payment_code'] == 'yandex_delivery_payment')) {
            if (isset($this->session->data["yd"]["cod"])) {

                $method_name = "";

                if (!empty($this->session->data['shipping_method'])) {
                    $shipping = explode('.', $this->session->data['shipping_method']['code']);
                    if ($shipping[0] == 'yandex_delivery' && (isset($this->session->data['yd'][$shipping[1]]['method']))) {
                        $method_name = $this->session->data['yd'][$shipping[1]]['method']['delivery']['name'];
                    }
                }

                $this->language->load('total/yandex_delivery');
                $service = $this->session->data["yd"]["cod"]["calculateRules"];
                $cost = -1;
                $cod_paid_by_shop = $this->config->get('yandex_delivery_cod_paid_shop') == 1;
                if ($cod_paid_by_shop)
                    $cost = 0;
                elseif ($service) {
                    $min = isset($service["min_cost"]) ? floatval($service["min_cost"]) : 0;
                    $max = isset($service["max_cost"]) ? floatval($service["max_cost"]) : PHP_INT_MAX;
                    $is_percent = $service["calculate_type"] == "PERCENT_CASH";
                    $val = floatval($service["service_value"]);
                    if (!$is_percent)
                        $cost = $val;
                    else {
                        $cost = round($total * $val, 1, PHP_ROUND_HALF_UP);
                        if ($cost < $min) $cost = $min;
                        if ($cost > $max) $cost = $max;
                    }
                }
                if ($cost >= 0) {

                    if (strpos(VERSION, '2.1.') === 0) {
                        $file = DIR_SYSTEM . 'library/yandexdelivery.php';
                        if (file_exists($file))
                            include_once($file);
                    }
                    else
                        $this->load->library('yandexdelivery');
                    $api = new YandexDelivery($this->registry);

                    $cost = $api->roundValue($api->convertToDefaultCurrency($cost));

                    $total_data[] = array(
                        'code'       => 'yandex_delivery_total',
                        'title'      => $this->language->get('text_yandex_delivery_cod') . $method_name,
                        'text'       => $this->currency->format($cost),
                        'value'      => $cost,
                        'sort_order' => $this->config->get('yandex_delivery_total_sort_order')
                    );

                    $total += $cost;
                }
            }
        }
    }
}
?>