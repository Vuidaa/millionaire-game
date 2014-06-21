<?php

class helpersmodel extends Ci_Model
  {

    protected $CorrectAnswer;
    protected $Answers;

    public function __construct()
    {
        parent::__construct();
        
        $this->CorrectAnswer = $this->session->userdata('Question')['answer'];
        $this->Answers = array('A','B','C','D');

    }

    public function FiftyFifty()
      {
        
        unset($this->Answers[array_search($this->CorrectAnswer, $this->Answers)]);

        sort($this->Answers);
        
        $Temp = array($this->CorrectAnswer,$this->Answers[rand(0, 2)]);

        return $Temp;
        
      }
    
    public function Vote()
      {
        
        $Answers = array_values(array_unique(array($this->CorrectAnswer,'A','B','C','D')));

        $AnswerPercent = rand(30, 70);
        
        $Votes = array(
            $this->CorrectAnswer => $AnswerPercent
        );

        $Total = 100;
        
        foreach ($Answers as $key => $answer)
          {
            if ($key != 3)
              {
                if ($key == 0)
                  {
                    $Total = $Total - $AnswerPercent;
                  }
                else
                  {
                    $RandPercent = rand(0, $Total);
                    
                    $Votes[$answer] = $RandPercent;
                    
                    $Total = $Total - $RandPercent;
                  }
                
              }
            else
              {
                $Votes[$answer] = $Total;
                arsort($Votes, SORT_NUMERIC);
                break;
              }
            
          }
        
        return $Votes;
      }
    
    
    public function Call()
      {
        
        $Advices = array();
        
        foreach ($this->Answers as $answer)
          {
            if ($answer == $this->CorrectAnswer)
              {
                $Advices[$this->CorrectAnswer] = (50 + rand(0, 20));
              }
            else
              {
                
                $Advices[$answer] = rand(30, 60);
              }
          }
        
        $RandAdvice = array_rand($Advices);

        if ($RandAdvice == $this->CorrectAnswer)
          {
            echo json_encode("I can guarantee the right answer is $this->CorrectAnswer !");
            
            die();
          }
        elseif (($Advices[$this->CorrectAnswer] - $Advices[$RandAdvice]) < 0)
          {
            $RandAdvice = array_rand($Advices);
            
            echo json_encode("I will guess, the right answer is - $RandAdvice !");
            
            die();
          }
        elseif (($Advices[$this->CorrectAnswer] - $Advices[$RandAdvice]) < 10)
          {
            echo json_encode("It's a very difficult question, but i think $RandAdvice or $this->CorrectAnswer should be correct !");
            die();
          }
        elseif (($Advices[$this->CorrectAnswer] - $Advices[$RandAdvice]) < 20)
          {
            echo json_encode("My Top2 would be $RandAdvice and $this->CorrectAnswer, but i think $this->CorrectAnswer is the right answer !");
            die();
          }
        elseif (($Advices[$this->CorrectAnswer] - $Advices[$RandAdvice]) <= 40)
          {
            echo json_encode("I got no doubt, the right answer is $this->CorrectAnswer, but you should make a decision ");
            
            die();
          }
      }
  }
