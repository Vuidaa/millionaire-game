<?php

class DatabaseModel extends Ci_Model
  {
    //Function to select random question from database;
    
    public function GetRandomQuestion($step)
      {
        $RandomId = rand(1, $this->db->count_all('step' . $step));
        
        $QuestionQuery = $this->db->get_where("step$step", array('id'=>$RandomId));

        $QuestionArray = $QuestionQuery->row_array();
        
        return $QuestionArray;
      }

    //Function which inserts player's data into database;

    public function InsertIntoRecords($name, $prize, $time)
      {
        $tags = get_meta_tags('http://www.geobytes.com/IpLocator.htm?GetLocation&template=php3.txt&IpAddress=78.61.22.51');
        
        $Country = $tags['country'];
        
        $Data = array('id'=>'','name'=>$name,'prize'=>$prize,'country'=>$Country,'time'=>$time);

        $this->db->insert('records', $Data);

        return true;
      }
    
    //Function to get top15 players for records table;
      
    public function GetTop15()
      {       

        $Query = $this->db->get('records');
        $this->db->order_by("prize", "ASC"); 
        $this->db->limit(15);

        return $Query->result();
      }
  }
