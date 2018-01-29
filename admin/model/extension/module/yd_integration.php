<?php
class YDIntegrationModel extends Model {

    public function checkAndCreateTableIfNeeded() {

        $res = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "yandex_delivery'");
        if (!$res->num_rows) {
            $this->db->query("
				CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "yandex_delivery` (
				  `order_id` int(11) NOT NULL,
				  `yandex_order_id` int(11) DEFAULT 0,
				  `geo_id` int(11) DEFAULT 0,
				  `order_shipment_type` varchar(16),
				  `delivery` int(11),
				  `direction` int(11),
				  `tariff` int(11),
				  `pvz` int(11) DEFAULT 0,
				  `interval` int(11),
				  `weight` decimal(15,8),
				  `dim` varchar(162),
				  `assessed_value` decimal(15,2),
				  `data` text,
				  PRIMARY KEY (`order_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
			");
        }
    }

    public function insertModuleToLayout($layout, $position) {
        $this->load->model('setting/store');
        $this->load->model('design/layout');

        $stores = array(
            array(
                'store_id' => 0
            )
        );
        foreach ($stores as $store) {

            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE route LIKE '" . $this->db->escape($layout) . "' AND store_id = '" . (int)$store['store_id'] . "' ORDER BY route DESC LIMIT 1");

            if (!($query->num_rows && $query->row['layout_id'])) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "layout SET name = 'YD Info Module'");
                $layout_id = $this->db->getLastId();
                $this->db->query("INSERT INTO " . DB_PREFIX . "layout_route SET layout_id = '".(int)$layout_id . "', store_id = '". (int)$store['store_id']."', route = '".$layout."'");
            }
            else
                $layout_id = $query->row['layout_id'];

            $query_module = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_module WHERE layout_id = '" . (int)$layout_id . "' AND code = 'yd_integration'");

            if (!$query_module->num_rows) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = 'yd_integration', position = '" . $this->db->escape($position) . "', sort_order = ''");
            }

        }
    }

}
class ModelExtensionModuleYDIntegration extends YDIntegrationModel {
}
class ModelModuleYDIntegration extends YDIntegrationModel {
}