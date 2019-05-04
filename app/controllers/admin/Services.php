<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Services extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        $this->lang->admin_load('services', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('services_model');
    }
 
    function index()
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('services')));
        $meta = array('page_title' => lang('services'), 'bc' => $bc);
        $this->page_construct('services/index', $meta, $this->data);
    }

    function getServices()
    {
        $this->sma->checkPermissions('index', TRUE);

        if ((! $this->Owner || ! $this->Admin) && ! $warehouse_id) {
            $user = $this->site->getUser();
            $warehouse_id = $user->warehouse_id;
        }
        // echo "hi";
        // die();
        $detail_link = anchor('admin/services/view/$1', '<i class="fa fa-file-text-o"></i> ' . lang('service_details'));
        $delete_link = "<a href='#' class='tip po' title='<b>" . $this->lang->line("delete_service") . "</b>' data-content=\"<p>"
            . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete1' id='a__$1' href='" . admin_url('services/delete/$1') . "'>"
            . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i> "
            . lang('delete_service') . "</a>";
        $action = '<div class="text-center"><div class="btn-group text-left">'
            . '<button type="button" class="btn btn-default btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">'
            . lang('actions') . ' <span class="caret"></span></button>
        <ul class="dropdown-menu pull-right" role="menu">
            <li>' . $detail_link . '</li>
            <li><a href="' . admin_url('services/edit/$1') . '"><i class="fa fa-edit"></i> ' . lang('edit_service') . '</a></li>';
        
        $this->load->library('datatables');
        
            $this->datatables
                ->select($this->db->dbprefix('services') . ".id as serviceid, {$this->db->dbprefix('services')}.type_of_services as type, {$this->db->dbprefix('services')}.product as product, {$this->db->dbprefix('services')}.service_charges as service_charges, {$this->db->dbprefix('services')}.details as details")
                ->from('services')
                ->group_by("services.id");
        
        $this->datatables->add_column("Actions", $action, "serviceid, type, product, service_charges,details");
        echo $this->datatables->generate();
    }

    /* ------------------------------------------------------- */

    function add()
    {
        $this->sma->checkPermissions();
        $this->load->helper('security');
       
        $this->form_validation->set_rules('type_of_services', lang("type_of_services"), 'required');
        
        $this->form_validation->set_rules('product', lang("product"), 'required');
        
        $this->form_validation->set_rules('service_charges', lang("service_charges"), 'numeric');
        
        if ($this->form_validation->run() == true) {
            $data = array(
                'type_of_services' => $this->input->post('type_of_services'),
                'product' => $this->input->post('product'),
                'service_charges' => $this->input->post('service_charges'),
                'details' => $this->input->post('details'),
                'cf1' => $this->input->post('cf1'),
                'cf2' => $this->input->post('cf2'),
                'cf3' => $this->input->post('cf3'),
                'cf4' => $this->input->post('cf4'),
                'cf5' => $this->input->post('cf5'),
                'cf6' => $this->input->post('cf6'),
            );
        }
        // print_r($data);
        // die();

        if ($this->form_validation->run() == true && $this->services_model->addService($data)) {
            $this->session->set_flashdata('message', lang("service_added"));
            admin_redirect('services');
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('services'), 'page' => lang('services')), array('link' => '#', 'page' => lang('add_service')));
            $meta = array('page_title' => lang('add_service'), 'bc' => $bc);
            $this->page_construct('services/add', $meta, $this->data);
        }
    }


    /* -------------------------------------------------------- */

    function edit($id = NULL)
    {
        $this->sma->checkPermissions();
        $this->load->helper('security');
        if ($this->input->post('id')) {
            $id = $this->input->post('id');
        }
        $service = $this->services_model->getServiceByID($id);
        if (!$id || !$service) {
            $this->session->set_flashdata('error', lang('service_not_found'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
         $this->form_validation->set_rules('type_of_services', lang("type_of_services"), 'required');
        
        $this->form_validation->set_rules('product', lang("product"), 'required');
        
        $this->form_validation->set_rules('service_charges', lang("service_charges"), 'numeric');
        if ($this->form_validation->run('services/add') == true) {

            $data = array(
               'type_of_services' => $this->input->post('type_of_services'),
                'product' => $this->input->post('product'),
                'service_charges' => $this->input->post('service_charges'),
                'details' => $this->input->post('details'),
                'cf1' => $this->input->post('cf1'),
                'cf2' => $this->input->post('cf2'),
                'cf3' => $this->input->post('cf3'),
                'cf4' => $this->input->post('cf4'),
                'cf5' => $this->input->post('cf5'),
                'cf6' => $this->input->post('cf6'),
            );
        }

        if ($this->form_validation->run() == true && $this->services_model->updateService($id, $data)) {
            $this->session->set_flashdata('message', lang("service_updated"));
            admin_redirect('services');
            
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));

           
            $this->data['service'] = $service;
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('services'), 'page' => lang('services')), array('link' => '#', 'page' => lang('edit_service')));
            $meta = array('page_title' => lang('edit_service'), 'bc' => $bc);
            $this->page_construct('services/edit', $meta, $this->data);
        }
    }

    function delete($id = NULL)
    {
        $this->sma->checkPermissions(NULL, TRUE);

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        if ($this->services_model->deleteService($id)) {
            if($this->input->is_ajax_request()) {
                $this->sma->send_json(array('error' => 0, 'msg' => lang("service_deleted")));
            }
            $this->session->set_flashdata('message', lang('service_deleted'));
            admin_redirect('services');
        }

    }

    function view($id = NULL)
    {
        $this->sma->checkPermissions('index');

        $sr_details = $this->services_model->getServiceByID($id);
        if (!$id || !$sr_details) {
            $this->session->set_flashdata('error', lang('prduct_not_found'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('services'), 'page' => lang('services')), array('link' => '#', 'page' => $sr_details->product));
        $meta = array('page_title' => $sr_details->product, 'bc' => $bc);
        $this->data['service'] = $sr_details;
        $this->page_construct('services/view', $meta, $this->data);
    }
}
