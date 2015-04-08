<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Site extends CI_Controller
{
    public function index()
    {
        $this->home();
    }

    function home()
    {
        $this->load->helper('url');
        $data['title'] = "Hope Center Utah";
        $data['base_url'] = base_url();
        $this->load->view("view_header", $data);
        $this->load->view("view_nav");
        $this->load->view("view_title");
        $this->load->view("view_event_banner");
        $this->load->view("view_main");
        $this->load->view("view_footer");

    }

    function about()
    {
        $data['title'] = "About";
        $this->load->view("view_header");
        $this->load->view("view_nav");
        $this->load->view("view_about", $data);
        $this->load->view("view_footer");
    }

    function contact()
    {
        $this->load->view();
    }

    public function getValues()
    {
        $this->load->model("get_db");
        $data['results'] = $this->get_db->getAll();
        $this->load->view("view_db", $data);

    }
}

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

