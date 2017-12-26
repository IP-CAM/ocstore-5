<?php

class ControllerExtensionPaymentLifepayCloudPrint extends Controller {


    public function send($route, $output)
    {

        $order_id = $output[0];
        $this->load->model('checkout/order');
        $order_info = $this->model_checkout_order->getOrder($order_id);

//        print_r($order_info);die;

        $this->_lifepayCloudPrint($order_info);

    }


    /**
     * @param $order_info
     */
    private function _lifepayCloudPrint($order_info) {

        $lp_settings['enable'] = $this->config->get('lifepay_status');

        $lifepay_url = "https://sapi.life-pay.ru/cloud-print/create-receipt";

        if ($lp_settings['enable'] == 1) {
            $lp_settings['test'] = $this->config->get('lifepay_test');
            $lp_settings['login'] = $this->config->get('lifepay_login');
            $lp_settings['apikey'] = $this->config->get('lifepay_api_key');
            $lp_settings['mode'] = $this->config->get('lifepay_mode');


            $data = $lp_settings;

            foreach ($this->cart->getProducts() as $product) {

                $option_data = array();

                foreach ($product['option'] as $option) {
                    $option_data[] = array(
                        'product_option_id'       => $option['product_option_id'],
                        'product_option_value_id' => $option['product_option_value_id'],
                        'option_id'               => $option['option_id'],
                        'option_value_id'         => $option['option_value_id'],
                        'name'                    => $option['name'],
                        'type'                    => $option['type']
                    );
                }

                $product_data[] = array(
                    'name'       => $product['name'],
                    'quantity'   => $product['quantity'],
                    'price'      => $product['price'],
//                            'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
                );

                $data['purchase']['products'] = $product_data;
            }

            $target_serial = $this->config->get('lifepay_target_serial');
            if (!empty($target_serial)) {
                $data['target_serial'] = $target_serial;
            }

            $data['type'] = 'payment';
            $data['customer_phone'] = preg_match('/[7]\d{9}/', $order_info['telephone']) ? $order_info['telephone'] : '';
            $data['customer_email'] = $order_info['email'];
            $data['card_amount'] = $order_info['total'];
            $data['ext_id'] = (string)$order_info['order_id'];

            $request = json_encode($data);

            $curl = curl_init();

            curl_setopt($curl, CURLOPT_URL, $lifepay_url);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($curl, CURLOPT_POST, TRUE);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $request);

            $result = curl_exec($curl);
            curl_close($curl);
            $resultJson = @json_decode($result);

            $this->load->library('log');
            $logger = new Log('lifepay.log');
            $logger->write("\nLIFE PAY: ".$lifepay_url."\nREQUEST: ".print_r($request,true). "\nRESPONSE: ".print_r($resultJson ? : $result, true));

        }

    }

}