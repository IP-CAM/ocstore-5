<?php
class ControllerCheckoutYandexDelivery extends Controller {
    public function index() {}

    public function select_pvz_ex() {
        $this->session->data['yd']['pvz_selected'] = 0;
        //$this->session->data['yd']['kd_selected'] = '';
        $complex_id = isset($this->request->get['pvz_id']) ? $this->request->get['pvz_id'] : 0;
        $parts = explode('-', $complex_id);
        if (count($parts) == 3) {
            $pvz_id = $parts[2];
            $tariff_id = $parts[0];
            $delivery_id = $parts[1];

            if ($tariff_id && $delivery_id) {
                if ($pvz_id && array_key_exists($pvz_id, $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvzs'])) {
                    $this->session->data['yd']['pvz_selected'] = $complex_id;
                    $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvz'] = $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvzs'][$pvz_id];
                }
            }
            else
                $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvz'] = null;
        }
        echo $complex_id;
    }

    public function select_kd_ex() {
        //$this->session->data['yd']['pvz_selected'] = 0;
        $this->session->data['yd']['kd_selected'] = '';
        $complex_id = isset($this->request->get['pvz_id']) ? $this->request->get['pvz_id'] : 0;
        $parts = explode('-', $complex_id);
        if (count($parts) == 2) {
            $tariff_id = $parts[0];
            $delivery_id = $parts[1];
            if ($tariff_id && $delivery_id) {
                $this->session->data['yd']['kd_selected'] = $complex_id;
            }
        }
        echo $complex_id;
    }
/*
    public function select_pvz() {
        $pvz_id = isset($this->request->get['pvz_id']) ? (int)$this->request->get['pvz_id'] : 0;
        $tariff_id = isset($this->request->get['tariff_id']) ? $this->request->get['tariff_id'] : 0;
        $delivery_id = isset($this->request->get['delivery_id']) ? $this->request->get['delivery_id'] : 0;
        if ($tariff_id && $delivery_id) {
            if ($pvz_id && array_key_exists($pvz_id, $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvzs']))
                $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvz'] = $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvzs'][$pvz_id];
            else
                $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvz'] = null;
            echo $tariff_id.'-'.$delivery_id.'-'.$pvz_id;
        }
    }

    public function fastorder_fix() {
        $json  = array();
        $payment_method = isset($this->request->post['payment_method']) ? $this->request->post['payment_method'] : false;
        if ($payment_method) {
            if (isset($this->session->data['payment_methods'][$payment_method]))
                $this->session->data['payment_method'] = $payment_method = $this->session->data['payment_methods'][$payment_method];
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
*/

    public function select_pvz() {
        $pvz_id = isset($this->request->get['pvz_id']) ? (int)$this->request->get['pvz_id'] : 0;
        $tariff_id = isset($this->request->get['tariff_id']) ? $this->request->get['tariff_id'] : 0;
        $delivery_id = isset($this->request->get['delivery_id']) ? $this->request->get['delivery_id'] : 0;
        if ($tariff_id && $delivery_id) {
            if ($pvz_id && array_key_exists($pvz_id, $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvzs'])) {
                $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvz'] = $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvzs'][$pvz_id];
//echo $tariff_id.'_'.$delivery_id.'*';
//var_dump($this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvz']);
}
            else {
                $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvz'] = null;
//echo 'fail';
}
            echo $tariff_id.'-'.$delivery_id.'-'.$pvz_id;
        }
    }

    public function getAdditionalPvzInfo() {
        $info = 'EMPTY_NO_DATA';
        $pvz_id = isset($this->request->get['pvz_id']) ? (int)$this->request->get['pvz_id'] : 0;
        $tariff_id = isset($this->request->get['tariff_id']) ? $this->request->get['tariff_id'] : 0;
        $delivery_id = isset($this->request->get['delivery_id']) ? $this->request->get['delivery_id'] : 0;
        if ($tariff_id && $delivery_id) {
            if ($pvz_id && array_key_exists($pvz_id, $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvzs'])) {
                $pvz = $this->session->data['yd'][$tariff_id.'_'.$delivery_id]['pvzs'][$pvz_id];
                if (isset($pvz['address']) && isset( $pvz['address']['comment']) && $pvz['address']['comment'] != "") {
                    $img_url = count($pvz['photos']) ? $pvz['photos'][0]['link'] : 'catalog/view/javascript/yandex_delivery/image/no_pvz_image.jpg';
                    $info = '<div class="yd-additional-info-block"><h4>'.$pvz['name'].'</h4><h5>'.$pvz['full_address'].'</h5><img class="yd-additional-info-image" src="'.$img_url.'"/><hr><div class="yd-additional-info-description"><span>'.$pvz['address']['comment'].'</span></div></div>';
                }
            }
        }
        $this->response->setOutput($info);
    }

    public function getMapData() {
        $json = array();
        $pvz_id = isset($this->request->get['pvz']) ? (int)$this->request->get['pvz'] : 0;
        $complex_id = isset($this->request->get['delivery']) ? $this->request->get['delivery'] : 0;
        if ($complex_id == "0") $complex_id = "0_0";
        $delivery = explode('_', $complex_id);

        if (isset($this->session->data['yd']['map'])) {
            $points = $this->session->data['yd']['map'];

            $om = array();

            $om['type'] = 'FeatureCollection';
            $features = array();
            $position = false;

            $filter = array();

            $show_only_selected_method_pvz = ($this->config->get('yandex_delivery_only_selected_method_pvz') == 1 && $complex_id != "0_0") ;

            $standard_delivery = array();

            foreach($points as $point) {
                if ($pvz_id && $point['id'] == $delivery[0].'-'.$delivery[1].'-'.$pvz_id) {
                    $position['location'] = $point["gps"];
                    $position['zoom'] = 15;
                }
                $delivery_id = (int)$point['delivery'];
                if (!in_array($delivery_id, $filter))
                    $filter[] = $delivery_id;

                $feature = array();
                $feature['type'] = 'Feature';
                $feature['id'] = $point["id"];
                $geometry = array();
                $geometry['type'] = 'Point';
                $geometry['coordinates'] = $point["gps"];
                $feature['geometry'] = $geometry;
                $properties = array();
                $properties['pvz_id'] = $point['id'];
                $properties['delivery'] = $delivery_id;
                $properties['pvz_name'] = $point['name'];
                $properties['full_address'] = $point['full_address'];
                $properties['wt'] = $point['wt'];
                $properties['phone'] = $point['phone'];
                $properties["has_payment_card"] = $point["has_payment_card"];
                $properties["has_payment_cash"] = $point["has_payment_cash"];
                $properties["has_payment_prepaid"] = $point["has_payment_prepaid"];
                $properties["comment"] = $point["comment"];
                $properties["class"] = $point["delivery_class_name"];

                $feature['properties'] = $properties;
                $options = array();

                $offset = 'islands#blueDotIcon';

                if ($point["delivery_name"] == "Strizh") {
                    $offset = 'islands#darkGreenDotIcon';
                }
                elseif ($point["delivery_name"] == "PickPoint") {
                    $offset = 'islands#darkOrangeDotIcon';
                }
                elseif ($point["delivery_name"] == "PEK") {
                    $offset = 'islands#violetDotIcon';
                }
                elseif ($point["delivery_name"] == "DPD") {
                    $offset = 'islands#redDotIcon';
                }
                elseif ($point["delivery_name"] == "Boxberry") {
                    $offset = 'islands#pinkDotIcon';
                }
                elseif ($point["delivery_name"] == "Axiomus") {
                    $offset = 'islands#darkBlueDotIcon';
                }
                elseif ($point["delivery_name"] == "CDEK") {
                    $offset = 'islands#darkBlueDotIcon';
                }
                elseif ($point["delivery_name"] == "InPost") {
                    $offset = 'islands#violetDotIcon';
                }
                elseif ($point["delivery_name"] == "Post" || $point["delivery_name"] == "Post_Online") {
                    $offset = 'islands#brownDotIcon';
                }
                elseif (strtoupper($point["delivery_name"]) == "SPSR") {
                    $offset = 'islands#darkOrangeDotIcon';
                }
                elseif (strtoupper($point["delivery_name"]) == "CCCB") {
                    $offset = 'islands#darkOrangeDotIcon';
                }
                elseif ($point["delivery_name"] == "MaxiPost") {
                    $offset = 'islands#greenDotIcon';
                }

                $standard_delivery[$delivery_id] = $point["delivery_name"];

                $options['preset'] = $offset;

                $feature['options'] = $options;

                $features[] = $feature;
            }

            $filter_html = "";
            foreach ($filter as $item) {
                $checked = (!$show_only_selected_method_pvz || $item == $delivery[1]) ? "checked" : "";
                $icon_file_name = array_key_exists($item, $standard_delivery) ? $standard_delivery[$item] : 'Self';
                $path = 'view/javascript/yandex_delivery/image/svg/'.$icon_file_name.'.svg';
                if (!file_exists(DIR_APPLICATION.$path))
                    $icon_file_name = 'Self';
                $filter_html .= '<div><label><input class="filter-delivery" type="checkbox" '.$checked.' value="'.$item.'" onclick="onFilterChange(); return true;"/><div class="yandex_filter_icon"><img src="catalog/view/javascript/yandex_delivery/image/svg/'.$icon_file_name.'.svg'.'"/></div></label></div>';
            }

            $om['features'] = $features;
            $json['om'] = $om;
            $json['position'] = $position;
            $json['filter'] = $filter_html;
        }

        $this->response->addHeader('Content-Type: application/json; charset=utf-8');
        $this->response->setOutput(json_encode($json));

    }
}
?>