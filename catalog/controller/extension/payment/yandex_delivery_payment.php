<?php
class PaymentYandexDeliveryPayment extends Controller {

    private $_data = array();

    private function getOCVersion() {
        $ov = explode('.', VERSION);
        return floatval($ov[0].$ov[1].$ov[2].'.'.(isset($ov[3]) ? $ov[3] : 0));
    }

    private function renderPage($ov, $template) {

        $this->_data['old'] = ($ov < 200);
        if ($ov >= 230) $template = 'extension/'.$template;

        if ($this->_data['old']) {

            $this->data = array_merge($this->data, $this->_data);

            $template = (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/'.$template.'.tpl')) ?
                $this->config->get('config_template') . '/template/payment/cod.tpl' : 'default/template/'.$template.'.tpl';

            $this->template = $template;

            return $this->render();

        } else
        {
            if ($ov < 220)  {
                $template = (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/'.$template.'.tpl')) ?
                    $this->config->get('config_template') . '/template/'.$template.'.tpl' : 'default/template/'.$template.'.tpl';
            }

            return $this->load->view($template, $this->_data);
        }
    }

    private function getModuleRoute($ov) {
        return ($ov < 230) ? "payment/yandex_delivery_payment" : "extension/payment/yandex_delivery_payment";
    }

    public function index() {

        $this->_data['button_confirm'] = $this->language->get('button_confirm');

        $this->_data['route'] = $this->getModuleRoute($this->getOCVersion());

        $this->_data['continue'] = $this->url->link('checkout/success');

        return $this->renderPage($this->getOCVersion(), 'payment/yandex_delivery');

    }

    public function confirm() {

        $opencartVersion = $this->getOCVersion();

        if ($this->session->data['payment_method']['code'] == 'yandex_delivery_payment') {

            $this->load->model('checkout/order');

            if ($opencartVersion < 200)
                $this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('yandex_delivery_payment_order_status_id'));
            else
                $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('yandex_delivery_payment_order_status_id'));
        }
    }
}
class ControllerExtensionPaymentYandexDeliveryPayment extends PaymentYandexDeliveryPayment {
}
class ControllerPaymentYandexDeliveryPayment extends PaymentYandexDeliveryPayment {
}
?>