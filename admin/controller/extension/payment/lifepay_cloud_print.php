<?php

class ControllerExtensionPaymentLifepayCloudPrint extends Controller
{

    private $error = array();


    public function install() {
        $this->load->model('extension/event');
        $this->model_extension_event->addEvent('lifepay_cloud_print', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/payment/lifepay_cloud_print/send');
    }

    public function uninstall() {
        $this->load->model('extension/event');
        $this->model_extension_event->deleteEvent('lifepay_cloud_print');
    }

    public function index()
    {

        $this->load->model('setting/setting');
        $this->load->language('extension/payment/lifepay_cloud_print');
        $this->document->setTitle($this->language->get('heading_title'));

        // Сохранение настроек через POST запрос
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('lifepay', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'].'&type=payment', 'SSL'));
        }

        // Заголовок страницы
        $data['heading_title'] = $this->language->get('heading_title');

        // Хлебные крошки
        $data['breadcrumbs'] = $this->getBreadCrumbs();

        // Кнопки сохранения и отмены
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['action'] = $this->url->link('extension/payment/lifepay_cloud_print', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

        $data['status_enabled'] = $this->language->get('status_enabled');
        $data['status_disabled'] = $this->language->get('status_disabled');

        // LIFE PAY Статус: Включен/Выключен
        $data['entry_lifepay_status'] = $this->language->get('entry_lifepay_status');
        $data['lifepay_status'] = $this->config->get('lifepay_status');

        // LIFE PAY Тестовый режим: Включен/Выключен
        $data['entry_lifepay_testmode'] = $this->language->get('entry_lifepay_testmode');
        $data['lifepay_test'] = $this->config->get('lifepay_test');

        // LIFE PAY Логин в ЛК
        $data['entry_lifepay_login'] = $this->language->get('entry_lifepay_login');
        $data['lifepay_login'] = $this->config->get('lifepay_login');

        // LIFE PAY Api key
        $data['entry_lifepay_api_key'] = $this->language->get('entry_lifepay_api_key');
        $data['lifepay_api_key'] = $this->config->get('lifepay_api_key');

        // LIFE PAY Режим печати/отправки чека
        $data['entry_lifepay_mode'] = $this->language->get('entry_lifepay_mode');
        $data['lifepay_mode'] = $this->config->get('lifepay_mode');

        // Серийный номер принтера
        $data['entry_lifepay_target_serial'] = $this->language->get('entry_lifepay_target_serial');
        $data['entry_lifepay_target_serial_help'] = $this->language->get('entry_lifepay_target_serial_help');
        $data['lifepay_target_serial'] = $this->config->get('lifepay_target_serial');

        // Хедер, футер, левое меню для отрисовки страницы настроек модуля
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        if (isset($this->error['warning'])){
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        if (isset($this->error['login'])){
            $data['error_login'] = $this->error['login'];
        } else {
            $data['error_login'] = '';
        }
        if (isset($this->error['api_key'])){
            $data['error_api_key'] = $this->error['api_key'];
        } else {
            $data['error_api_key'] = '';
        }

        // Рендеринг шаблона
        $this->response->setOutput($this->load->view('extension/payment/lifepay_cloud_print', $data));
    }

    /**
     * Валидация данных.
     * В данном случае проверка прав на редактирование настроек платежного модуля.
     * @return bool
     */
    private function validate()
    {

        if (!$this->user->hasPermission('modify', 'extension/payment/lifepay_cloud_print')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if(!$this->request->post['lifepay_login']) {
            $this->error['login'] = $this->language->get('error_login');
        }
        if(!$this->request->post['lifepay_api_key']) {
            $this->error['api_key'] = $this->language->get('error_api_key');
        }

        return !$this->error;
    }


    private function getBreadCrumbs()
    {
        $breadcrumbs = array();

        $breadcrumbs[] = array(  // Главная
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );
        $breadcrumbs[] = array(  // Модули
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
        );
        $breadcrumbs[] = array(  // Этот модуль
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/payment/lifepay_cloud_print', 'token=' . $this->session->data['token'], 'SSL')
        );


        return $breadcrumbs;
    }
}