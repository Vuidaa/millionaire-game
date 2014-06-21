<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class about extends CI_Controller {

	public function index()
	{
		$this->load->view('Head');
		$this->load->view('About/Body');
	}
	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */