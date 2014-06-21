<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class records extends CI_Controller 
{
	public function __construct()
    {
        parent::__construct();
        
        $this->load->model('databasemodel');
    }

	public function Index()
	{
		//Get top15 players data from database;
		$Records = $this->databasemodel->GetTop15();

		//Load a view
		$this->load->view('Head');
		$this->load->view('Records/Body',array('Records'=>$Records));
	}
}