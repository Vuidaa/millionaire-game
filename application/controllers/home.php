<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class home extends CI_Controller {

	public function Index()
	{
		//Load a view;
		$this->load->view('Head');
		$this->load->view('Home/Body');

		//Destroy any remaining session;
		$this->session->sess_destroy();
	}
	
}
