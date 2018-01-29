<?php
class YDIntegration extends Controller {

    private $error = array();
    private $_data = array();

    private $opencartVersion;

    public function __construct($registry) {
        parent::__construct($registry);
        $this->registry = $registry;
        $ov = explode('.', VERSION);
        $this->opencartVersion = floatval($ov[0].$ov[1].$ov[2].'.'.(isset($ov[3]) ? $ov[3] : 0));
    }

    private function getLink($url) {
        return ($this->opencartVersion < 220) ?
            $this->url->link($url, 'token=' . $this->session->data['token'], 'SSL') :
            $this->url->link($url, 'token=' . $this->session->data['token'], true);
    }

    private function getHomeLink() {
        if ($this->opencartVersion < 200) return $this->getLink('common/home'); else return $this->getLink('common/dashboard');
    }

    private function getModuleRoute() {
        return ($this->opencartVersion < 230) ? "module/yd_integration" : "extension/module/yd_integration";
    }

    private function getModulesRoute() {
        return ($this->opencartVersion < 230) ? "extension/module" : "extension/extension";
    }

    private function initField($field_name, $default_value = '') {
        if (isset($this->request->post[$field_name])) {
            $this->_data[$field_name] = $this->request->post[$field_name];
        } elseif (!is_null($this->config->get($field_name))) {
            $this->_data[$field_name] = $this->config->get($field_name);
        } else {
            $this->_data[$field_name] = $default_value;
        }
    }

    private function doRedirect($url) {
        if ($this->opencartVersion < 200) {
            $this->redirect($url);
        } else {
            $this->response->redirect($url);
        }
    }

    private function renderPage($template) {

        $this->_data['old'] = ($this->opencartVersion < 200);

        if ($this->_data['old']) {

            $this->data = array_merge($this->data, $this->_data);

            $this->template = $template.'.tpl';

            $this->children = array(
                'common/header',
                'common/footer'
            );

            $this->response->setOutput($this->render());

        } else
        {

            $this->_data['header']      = $this->load->controller('common/header');
            $this->_data['column_left'] = $this->load->controller('common/column_left');
            $this->_data['footer']      = $this->load->controller('common/footer');

            if ($this->opencartVersion < 220) $template .= '.tpl';

            $this->response->setOutput($this->load->view($template, $this->_data));
        }
    }

    private function addModuleSettings($p, $layout_id) {
        $this->request->post['yd_integration_module'][] = array(
            'image_width'  => 80,
            'image_height' => 80,
            'layout_id'    => $layout_id,
            'position'     => $p,
            'count'        => 5,
            'status'       => 1,
            'sort_order'   => ''
        );
    }
    private function addModuleToLayout($r, $p) {
        $this->load->model('design/layout');

        if ($this->opencartVersion < 200) {
            $found = false;
            $layouts = $this->model_design_layout->getLayouts();

            foreach ($layouts as $layout) {
                $routes = $this->model_design_layout->getLayoutRoutes($layout['layout_id']);

                foreach ($routes as $route) {
                    if ($route['route'] == $r) {
                        $found = true;
                        $this->addModuleSettings($p, $layout['layout_id']);
                    }
                }
            }
            if (!$found) {
                $data = array();
                $data['name'] = 'YD Info Module';
                $data['layout_route'][] = array('store_id' => 0, 'route' => $r);
                $this->model_design_layout->addLayout($data);
                $this->addModuleToLayout($r, $p);
            }
        } else {
	        if ($this->opencartVersion < 230) {
	            $this->load->model('module/yd_integration');
	            $this->model_module_yd_integration->insertModuleToLayout($r, $p);
        	}
	        else {
	            $this->load->model('extension/module/yd_integration');
        	    $this->model_extension_module_yd_integration->insertModuleToLayout($r, $p);
	        }
        }
    }

    public function index() {

        $this->_data = $this->language->load($this->getModuleRoute());

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {

            $this->addModuleToLayout('account/order/info', 'content_top');


            $this->model_setting_setting->editSetting('yd_integration', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');
            $this->doRedirect($this->getLink($this->getModulesRoute()));
        }

        if (isset($this->error['warning'])) {
            $this->_data['error_warning'] = $this->error['warning'];
        } else {
            $this->_data['error_warning'] = '';
        }

        $this->_data['breadcrumbs'] = array();

        $this->_data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->getHomeLink(),
            'separator' => false
        );

        $this->_data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->getLink($this->getModulesRoute()),
            'separator' => ' :: '
        );

        $this->_data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->getLink($this->getModuleRoute()),
            'separator' => ' :: '
        );

        $this->_data['action'] = $this->getLink($this->getModuleRoute());

        $this->_data['cancel'] = $this->getLink($this->getModulesRoute());

        $this->load->model('localisation/order_status');

        $this->_data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $this->_data['article_fields'] = explode(';', $this->language->get('text_article_fields'));

        $this->initField('yd_integration_order_status_id', 2);
        $this->initField('yd_integration_create_order_mode', 0);
        $this->initField('yd_integration_status');
        $this->initField('yd_integration_default_warehouse', '');
        $this->initField('yd_integration_default_requisite', '');
        $this->initField('yd_integration_address_input_mode', 0);
        $this->initField('yd_integration_address_prefix_block', 0);
        $this->initField('yd_integration_field_name_street');
        $this->initField('yd_integration_field_name_house');
        $this->initField('yd_integration_field_name_housing');
        $this->initField('yd_integration_field_name_build');
        $this->initField('yd_integration_field_name_flat');
        $this->initField('yd_integration_field_name_middle');
        $this->initField('yd_integration_article_field', 'id');

        $this->renderPage($this->getModuleRoute());
    }


    private function checkOnValidIds($value) {
        if ($value && count($value)) {
            return (preg_match('/^[0-9]+$/', $value));
        }
        return false;
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', $this->getModuleRoute())) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        $client_id = $this->config->get('yandex_delivery_client_id');
        $sender_id = $this->config->get('yandex_delivery_sender_id');

        if (empty($client_id) || empty($sender_id)) {
            $this->error['warning'] = $this->language->get('error_no_api_data');
        }
        if (!$this->error && !$this->checkOnValidIds($this->request->post['yd_integration_default_warehouse'])) $this->error['warning'] = 'Wrong warehouse_id';
        if (!$this->error && !$this->checkOnValidIds($this->request->post['yd_integration_default_requisite'])) $this->error['warning'] = 'Wrong requisite_id';


        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function install() {
        if ($this->opencartVersion < 230) {
            $this->load->model('module/yd_integration');
            $this->model_module_yd_integration->checkAndCreateTableIfNeeded();
        }
        else {
            $this->load->model('extension/module/yd_integration');
            $this->model_extension_module_yd_integration->checkAndCreateTableIfNeeded();
        }

        if ($this->opencartVersion >= 200) {

            $this->load->model('extension/event');

            if ($this->opencartVersion < 220) {
                $this->model_extension_event->addEvent('yandex_delivery_add_order', 'post.order.add', 'module/yandex_delivery/addOrderEvent');
                $this->model_extension_event->addEvent('yandex_delivery_edit_order', 'post.order.edit', 'module/yandex_delivery/editOrderEvent');
                $this->model_extension_event->addEvent('yandex_delivery_order_status', 'post.order.history.add', 'module/yandex_delivery/statusOrderEvent');
            }
            else {
                $ext = ($this->opencartVersion >= 230) ? 'extension/' : '';
                $this->model_extension_event->addEvent('yandex_delivery_add_order', 'catalog/model/checkout/order/addOrder/after', $ext.'module/yandex_delivery/addOrderEvent');
                $this->model_extension_event->addEvent('yandex_delivery_edit_order', 'catalog/model/checkout/order/editOrder/after', $ext.'module/yandex_delivery/editOrderEvent');
                $this->model_extension_event->addEvent('yandex_delivery_order_status', 'catalog/model/checkout/order/addOrderHistory/after', $ext.'module/yandex_delivery/statusOrderEvent');
            }
        }
    }

    public function uninstall() {
        if ($this->opencartVersion >= 200) {
            $this->load->model('extension/event');
            $this->model_extension_event->deleteEvent('yandex_delivery_add_order');
            $this->model_extension_event->deleteEvent('yandex_delivery_edit_order');
            $this->model_extension_event->deleteEvent('yandex_delivery_order_status');
        }
    }

}
class ControllerExtensionModuleYDIntegration extends YDIntegration {
}
class ControllerModuleYDIntegration extends YDIntegration {
}
?>