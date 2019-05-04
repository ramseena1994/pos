<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Services_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getAllServices()
    {
        $q = $this->db->get('services');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getServiceByID($id)
    {
        $q = $this->db->get_where('services', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function addService($data)
    {
        if ($this->db->insert('services', $data)) {
            $service_id = $this->db->insert_id();
            }
            return $service_id;
    }

    public function addAjaxService($data)
    {
        if ($this->db->insert('services', $data)) {
            $service_id = $this->db->insert_id();
            return $this->getProductByID($service_id);
        }
        return false;
    }

    public function updateService($id, $data)
    {
        $this->db->update('services', $data, array('id' => $id));
        return true;
    }


    public function deleteService($id)
    {
        if ($this->db->delete('services', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }


}
