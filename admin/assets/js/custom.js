


function increase(vehicle,isIncrease) {           
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        document.getElementById('vote_'+vehicle).innerHTML = JSON.parse(this.responseText).vote
        }
      };
      if(isIncrease){
        xmlhttp.open("POST","adjust_vote.php?vehicle="+vehicle+"&inrease=true",true);

      }else{
        xmlhttp.open("POST","/admin/adjust_vote.php?vehicle="+vehicle+"&inrease=false",true);
      }
     
      xmlhttp.send();


    
  }
