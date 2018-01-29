<?php
class YDIntegrationModel extends Model {

    public function getOrderProducts($order_id) {
        $query = $this->db->query("SELECT op.quantity as order_quantity, op.price as order_price, op.name as order_name, p.* FROM " . DB_PREFIX . "order_product op LEFT JOIN " .DB_PREFIX ."product p ON p.product_id = op.product_id WHERE op.order_id = '" . (int)$order_id . "'");

        return $query->rows;
    }

    public function updateYandexOrder($data) {

        $query = $this->db->query("DESC ".DB_PREFIX."yandex_delivery order_shipment_type");
        $order_shipment_type_exist = ($query->num_rows);
        if (!$order_shipment_type_exist) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "yandex_delivery` ADD COLUMN `order_shipment_type` varchar(16) AFTER `geo_id`");
        }


        $res = $this->db->query("SELECT * FROM ".DB_PREFIX."yandex_delivery WHERE order_id = '".$this->db->escape($data['order_id'])."'");
        if (!$res->num_rows) {
            $this->db->query("INSERT INTO ".DB_PREFIX."yandex_delivery SET order_id = '".$this->db->escape($data['order_id'])."', yandex_order_id='".$this->db->escape($data['yandex_order_id'])."', delivery='".$this->db->escape($data['delivery'])."', direction='".$this->db->escape($data['direction'])."', tariff='".$this->db->escape($data['tariff'])."', pvz='".$this->db->escape($data['pvz'])."', `interval`='".$this->db->escape($data['interval'])."', dim='".$this->db->escape($data['dim'])."', weight='".$this->db->escape($data['weight'])."', geo_id='".$this->db->escape($data['geo_id'])."', assessed_value='".$this->db->escape($data['assessed_value'])."', order_shipment_type='".$this->db->escape($data['order_shipment_type'])."'");
        }
        else {
            $this->db->query("UPDATE ".DB_PREFIX."yandex_delivery SET yandex_order_id='".$this->db->escape($data['yandex_order_id'])."', delivery='".$this->db->escape($data['delivery'])."', direction='".$this->db->escape($data['direction'])."', tariff='".$this->db->escape($data['tariff'])."', pvz='".$this->db->escape($data['pvz'])."', `interval`='".$this->db->escape($data['interval'])."', dim='".$this->db->escape($data['dim'])."', weight='".$this->db->escape($data['weight'])."', geo_id='".$this->db->escape($data['geo_id'])."', assessed_value='".$this->db->escape($data['assessed_value'])."' WHERE order_id = '".(int)$data['order_id']."'");
        }
        if (isset($data['data']))
            $this->updateYandexOrderData($data['order_id'], $data);
    }
    public function updateYandexOrderData($order_id, $data) {
        $this->db->query("UPDATE ".DB_PREFIX."yandex_delivery SET data='".$this->db->escape(serialize($data))."' WHERE order_id = '".(int)$order_id."'");
    }

    public function getOrderTotals($order_id) {
        $order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "'");
        return $order_total_query->rows;
    }

    public function deleteYandexOrder($order_id) {
        $this->db->query("DELETE FROM ".DB_PREFIX."yandex_delivery WHERE order_id = '".(int)$order_id."'");
    }

    public function getYandexOrder($order_id) {
        $res = $this->db->query("SELECT * FROM ".DB_PREFIX."yandex_delivery WHERE order_id = '".(int)$order_id."'");
        return ($res->num_rows) ? $res->row : null;

    }
}
class ModelExtensionModuleYDIntegration extends YDIntegrationModel {
}
class ModelModuleYDIntegration extends YDIntegrationModel {
}
