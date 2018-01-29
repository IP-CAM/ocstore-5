<?php
class YandexDeliveryTotal220 extends Model {

    public function getTotal($total) {
        if ((!empty($this->session->data['payment_method']['code']) && $this->session->data['payment_method']['code'] == 'yandex_delivery_payment')
            || (isset($this->request->post['payment_code']) && $this->request->post['payment_code'] == 'yandex_delivery_payment')) {
            if (isset($this->session->data["yd"]["cod"])) {

                $method_name = "";

                if (!empty($this->session->data['shipping_method'])) {
                    $shipping = explode('.', $this->session->data['shipping_method']['code']);
                    $key = $shipping[0] == 'yandex_delivery' ? preg_replace('/[a-zA-Z]+_/', '', $shipping[1]) : $shipping[1];

                    if ($key == 'PICKUP') {
                        $point = $this->session->data['yd']['pvz_selected'];
                        if (!empty($point)) {
                            $points = explode('-', $point);
                            $key = $points[0].'_'.$points[1];
                        }
                    }
                    if ($key == 'TODOOR') {
                        $point = $this->session->data['yd']['kd_selected'];
                        if (!empty($point))
                            $key = str_replace('-', '_', $point);
                    }

                    $key = str_replace('-', '_', $key);
                    if ($shipping[0] == 'yandex_delivery' && (isset($this->session->data['yd'][$key]['method']))) {
                        $method_name = $this->session->data['yd'][$key]['method']['delivery']['name'];
                    }
                }
                $ov = explode('.', VERSION);
                $opencartVersion = floatval($ov[0].$ov[1].$ov[2].'.'.(isset($ov[3]) ? $ov[3] : 0));
                if ($opencartVersion < 230)
                    $this->language->load('total/yandex_delivery');
                else
                    $this->language->load('extension/total/yandex_delivery');
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
                        $this->load->library('yandexdelivery');
                        $api = new YandexDelivery($this->registry);

                        $sub = $api->convertCurrencyToRub($total['total']);

                        $sub_cost = $sub * $val;
                        $cost = $sub_cost + ($sub_cost * $val);
                        if ($cost < $min) $cost = $min;
                        if ($cost > $max) $cost = $max;
                    }
                }

                if ($cost >= 0) {

                    $this->load->library('yandexdelivery');
                    $api = new YandexDelivery($this->registry);

                    $cost = $api->roundValue($api->convertToDefaultCurrency($cost));

                    $total['totals'][] = array(
                        'code'       => 'yandex_delivery_total220',
                        'title'      => $this->language->get('text_yandex_delivery_cod') . $method_name,
                        'value'      => $cost,
                        'sort_order' => $this->config->get('yandex_delivery_total220_sort_order')
                    );

                    $total['total'] += $cost;
                }
            }
        }
    }
}
class ModelExtensionTotalYandexDeliveryTotal220 extends YandexDeliveryTotal220 {
}
class ModelTotalYandexDeliveryTotal220 extends YandexDeliveryTotal220 {
}
?>