<?php
class ControllerInformationCertificates extends Controller {
    public function index() {
        // set title of the page
        $this->document->setTitle("Сертификаты");

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        // set data to the variable
        $data['my_custom_text'] = "This is my custom page.";

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/certificates.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/certificates.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('information/certificates.tpl', $data));
        }
    }
}
?>