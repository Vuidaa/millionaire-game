<h1 class='pageheading'> Game Records  </h1>
<h3> Top 15 players </h3>
<table id='RecordsTable'>
   <thead>
      <tr>
         <th>Name</th>
         <th>Prize</th>
         <th>Country</th>
         <th>Time spent</th>
      </tr>
   </thead>
   <tbody>
      <?php
         foreach ($Records as $Record) 
         {
          echo '<tr><td>'.$Record->name .'</td><td>'.$Record->prize.'</td><td>'.$Record->country.'</td><td>'.$Record->time.'</td></tr>';
         }
         
         ?>
   </tbody>
</table>
<a href='/' class='button info-btn'> Back to meniu </a>
</html>