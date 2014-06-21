 <?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class game extends CI_Controller
{
    
    public $GameState;
    
    public $Level;
    
    public $GuranteePrize;
    public $FinishGamePrize;
    
    public function __construct()
    {
        parent::__construct();
        
        $this->load->model('databasemodel');
        
        $this->GameState = $this->session->userdata('GameState');
        $this->Level     = $this->session->userdata('Level');

        $this->GuranteePrize   = $this->session->userdata('GuaranteePrize');
        $this->FinishGamePrize = $this->session->userdata('FinishGamePrize');
        
    }

    public function index()
    {   
        //Lets start new game;
        if ($this->Level == 0)
        {  
            //Get random question from first Level;
            $QuestionArray = $this->databasemodel->GetRandomQuestion(1);

            //===============Set game settings into session==============//

            $this->session->set_userdata('Question',$QuestionArray);

            $this->session->set_userdata('Helpers', array(
                'Vote' => 'Vote',
                'FiftyFifty' => 'FiftyFifty',
                'Call' => 'Call'
            ));
            $this->session->set_userdata('Time', time());
            $this->session->set_userdata('GuaranteePrize', 0);
            $this->session->set_userdata('Level', 1);
            $this->session->set_userdata('FinishGamePrize', 0);
            $this->session->set_userdata('GameState','Running');

            //===============Set game settings into session==============//

            //Load a view;
            $this->load->view('Game/Head');
            $this->load->view('Game/Game');
        }
        else
        //Game already started;
        {
            //Answer correct ? Let`s generate new question from next level;
            if ($this->GameState == 'Answered')
            {
                //Final answer answered ? Redirect to Millionaire page;
                if($this->Level == 15)
                {
                    redirect('game/millionaire');
                }
                
                //Question for 1000, 32000 completed ? Set GuranteePrize;  
                if ((($this->Level) % 5) == 0)
                {
                    $this->session->set_userdata('GuaranteePrize', $this->FinishGamePrize);
                }
                
                //Set next Level, and get random question from database;
                $NextLevel = $this->Level +1;

                $QuestionArray = $this->databasemodel->GetRandomQuestion($NextLevel);

                //===============Update game settings ==============//
                $this->session->set_userdata('Question',$QuestionArray);
                $this->session->set_userdata('GameState', 'Running');
                $this->session->set_userdata('Level', $NextLevel);
                $this->session->set_userdata('Time', time());

                //===============Upate game settings ==============//

                //Load the view;
                $this->load->view('Game/Head');
                $this->load->view('Game/Game');
            }
            //Page refreshed ? Display same question again;
            else
            {
                $this->load->view('Game/Head');
                $this->load->view('Game/Game');
            }
        }
    }
    
    public function gameoversummary()
    {  
       if($this->GameState =='Running')
       {
        redirect('game');
       }
        //Let`s find out the way game was finished ?;
        switch ($this->GameState)
        {
            case 'Gameover-wronganswer': //Wrong answer ?;

                if($this->Level > 10)
                {
                    redirect('game/millionaire');
                }

                if ($this->GuranteePrize == 0) //Failed in first 5 questions ?;
                {
                    $Prize = '<h3>No, your answer is not correct. Bad luck!</h3>';
                }
                else //Wrong answer, but GuranteePrize is set ?;
                {
                    $Prize = '<h3> Congratulations, you just won a ' . $this->GuranteePrize . ' dollars ! </h3>';
                }
                break;
            case 'Gameover-timeover': //Time over ?;

             if($this->Level > 10)
                {
                    redirect('game/millionaire');
                }

                if ($this->GuranteePrize == 0)//Failed in first 5 questions ?;
                {
                    $Prize = '<h3>I`m afraid you have run out of time, better luck next time !</h3>';
                }
                else //Time-over, but GuranteePrize is set ?;
                {
                    $Prize = '<h3> I`m afraid you have run out of time, but still you won a ' . $this->GuranteePrize . ' dollars ! </h3>';
                }
                break;
            case 'Answered': //Game finished by player;
             if($this->Level > 10)
                {
                    redirect('game/millionaire');
                }
                if ($this->FinishGamePrize > $this->GuranteePrize)//Game finished by player in step higher then GuranteePrize ?;
                {
                    
                    $Prize = '<h3> Congratulations, you just won a ' . $this->FinishGamePrize . ' dollars ! </h3>';
                }
                else //Game finished in GuranteePrize step;
                {
                    $Prize = '<h3> Congratulations, you just won a ' . $this->GuranteePrize . ' dollars ! </h3>';
                }
                break;
            default:
                $this->session->sess_destroy(); 
                redirect('/');
                break;
        }

        //Load a view;
        $this->load->view('Game/Head');
        $this->load->view('Game/Gameover-Summary', array(
            'Prize' => $Prize
        )); 
    }
    
    
    public function millionaire()
    {
        //If game still running, and user just trying to 'jump' into Millionaire page;
        if($this->GameState == 'Running' || $this->GameState == '' || ($this->GameState == 'Answered' && $this->Level < 10))
        {
            redirect('/');
        }
        
        $this->load->helper('form');
        $this->load->library('form_validation');
        
        $this->form_validation->set_rules('username', 'Name', 'required|min_length[3]|max_length[15]|alpha|xss_clean');
        
        //Wrong answer ? The prize will be GuranteePrize;
        if ($this->GameState == 'Gameover-wronganswer' || $this->GameState == 'Gameover-timeover')
        {
            $Prize = $this->GuranteePrize;
        }
        else // Game finished by user;
        {
            $Prize = ($this->GuranteePrize < $this->FinishGamePrize) ? $this->FinishGamePrize : $this->GuranteePrize;
        }
        
        if ($this->form_validation->run() == FALSE)
        {
            //Validation failed, display form and prize info;
            $this->load->view('Game/Head');
            $this->load->view('Game/Millionaire', array(
                'Prize' => $Prize
            ));
            
        }
        else
        { //Validation passed, insert players info into database, and redirect to Records page;
            if ($this->GameState !== false)
            {
                $ElapsedTime = time() - $this->session->userdata('last_activity');
        
                $Seconds = $ElapsedTime % 60;
        
                $Minutes = ($ElapsedTime - $Seconds) / 60;
        
                
                $Name = $this->input->post('username');
                $Time = ($Minutes > 0) ? $Minutes . 'min ' . $Seconds . 'sec' : $Seconds . 'sec';
                
                $this->databasemodel->InsertIntoRecords($Name, $Prize, $Time);
                
                $this->session->sess_destroy();
                
                redirect('/records');
            }
            else
            {
                redirect('/');
            }
            
        }
    }
    
    public function check()
    {   //Page for ajax calls only;
        if ($this->input->is_ajax_request())
        {
            if ($this->session->userdata('Level') == '')
            {
                echo json_encode('refreshed');
                die();
            }

            //Check if question answered still on time;
            if (($this->session->userdata('Time') + 17) > time())
            {
                $UserAnswer    = $this->input->post('answer');
                $CorrectAnswer = $this->session->userdata('Question')['answer'];

                if($UserAnswer == 'Gameover-timeover')
                {
                    $this->session->set_userdata('GameState', 'Gameover-timeover');
                    die();
                }
                
                //User chosen answer is correct ?;
                if ($UserAnswer == $CorrectAnswer)
                {
                    //Update game settings;
                    $this->session->set_userdata('GameState', 'Answered');
                    $this->session->set_userdata('FinishGamePrize', $this->session->userdata('Question')['step']);
                    
                    echo json_encode(true);
                    die();
                }
                else //User chosen answer is wrong, gameover;
                {
                    //Update game settings;
                    echo json_encode(false);
                    $this->session->set_userdata('GameState', 'Gameover-wronganswer');
                    die();
                }
            }
            else//User run-out of time;
            {
                //Update game settings;
                echo json_encode('timeover');
                $this->session->set_userdata('GameState', 'Gameover-timeover');
                die();
            }
        }
        else
        {
            redirect('/');
        }
        
    }
    
    public function helpers()
    {   //Page for ajax calls only;
        if ($this->input->is_ajax_request())
        {
            $this->load->model('helpersmodel');
            
            //User requested help;
            $RequestedHelp = $this->input->post('help');
            
            $Helpers = $this->session->userdata('Helpers');
            
            //Remove requested help from session;
            unset($Helpers[$RequestedHelp]);

            switch ($RequestedHelp)
            {
                
                case 'FiftyFifty':
                    
                    $this->session->set_userdata('Helpers', $Helpers); //Update session with remaining helpers;
                    
                    $Remaining = $this->helpersmodel->FiftyFifty(); //Get data from 'helpers' model;
                    echo json_encode($Remaining, JSON_UNESCAPED_UNICODE); //Pass data to javacript;
                    
                    die();
                    
                    break;
                
                case 'Call':
                    
                    $this->session->set_userdata('Helpers', $Helpers);
                    
                    $Advice = $this->helpersmodel->Call();
                    
                    echo json_encode($Advice, JSON_UNESCAPED_UNICODE);
                    
                    die();
                    
                    break;
                
                case 'Vote':
                    
                    $this->session->set_userdata('Helpers', $Helpers);
                    
                    $Votes = $this->helpersmodel->Vote();
                    
                    echo json_encode($Votes, JSON_UNESCAPED_UNICODE);
                    
                    die();
                    
                    break;
                
                default:
                    redirect('/');
                    break;
            }
        }
        else
        {
            redirect('/');
        }
    }
    
    
}