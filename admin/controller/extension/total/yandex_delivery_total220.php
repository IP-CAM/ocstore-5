<?php
class YandexDeliveryTotal220 extends Controller {
    private $error = array();

    private function getLink($ov, $url) {
        if ($ov >= 230)
            return $this->url->link($url, 'token=' . $this->session->data['token'] . '&type=total', true);
        return $this->url->link($url, 'token=' . $this->session->data['token'], true);
    }

    private function getModuleRoute($ov) {
        return ($ov < 230) ? "total/yandex_delivery_total220" : "extension/total/yandex_delivery_total220";
    }

    private function getModulesRoute($ov) {
        return ($ov < 230) ? "extension/total" : "extension/extension";
    }

    public function index() {

        $ov = explode('.', VERSION);
        $opencartVersion = floatval($ov[0].$ov[1].$ov[2].'.'.(isset($ov[3]) ? $ov[3] : 0));

        $this->language->load($this->getModuleRoute($opencartVersion));

        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate($opencartVersion))) {
            $this->model_setting_setting->editSetting('yandex_delivery_total220', $this->request->post);
        
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->getLink($opencartVersion, $this->getModulesRoute($opencartVersion)));
        }
        
        $data['heading_title']    = $this->language->get('heading_title');
        
        $data['text_enabled']     = $this->language->get('text_enabled');
        $data['text_disabled']    = $this->language->get('text_disabled');
        
        $data['entry_status']     = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        
        $data['button_save']      = $this->language->get('button_save');
        $data['button_cancel']    = $this->language->get('button_cancel');

         if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->getLink($opencartVersion, 'common/dashboard')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_total'),
            'href' => $this->getLink($opencartVersion, $this->getModulesRoute($opencartVersion))
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->getLink($opencartVersion, $this->getModuleRoute($opencartVersion))
        );

        $data['action'] = $this->getLink($opencartVersion, $this->getModuleRoute($opencartVersion));

        $data['cancel'] = $this->getLink($opencartVersion, $this->getModulesRoute($opencartVersion));

        if (isset($this->request->post['yandex_delivery_total220_status'])) {
            $data['yandex_delivery_total220_status'] = $this->request->post['yandex_delivery_total220_status'];
        } else {
            $data['yandex_delivery_total220_status'] = $this->config->get('yandex_delivery_total220_status');
        }

        if (isset($this->request->post['yandex_delivery_total220_sort_order'])) {
            $data['yandex_delivery_total220_sort_order'] = $this->request->post['yandex_delivery_total220_sort_order'];
        } else {
            $data['yandex_delivery_total220_sort_order'] = $this->config->get('yandex_delivery_total220_sort_order');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        if ($opencartVersion < 230)
            $view = 'total/yandex_delivery220';
        else
            $view = 'extension/total/yandex_delivery220';

        $this->response->setOutput($this->load->view($view, $data));
    }

    private function validate($ov) {
        if (!$this->user->hasPermission('modify', $this->getModuleRoute($ov))) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        if (!$this->error) {
            return true;
        } else {
            return false;
        }    
    }
}
class ControllerTotalYandexDeliveryTotal220 extends YandexDeliveryTotal220 {
}
class ControllerExtensionTotalYandexDeliveryTotal220 extends YandexDeliveryTotal220 {
}
?>