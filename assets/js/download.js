var timeleft = 5;
var downloadTimer = setInterval(function(){
    if(timeleft <= 0){
        clearInterval(downloadTimer);
        document.getElementById("countdown").innerHTML = "0 second. ";
    }
    else if (timeleft == 1){
        document.getElementById("countdown").innerHTML = timeleft + " second. ";
    } 
    else {
        document.getElementById("countdown").innerHTML = timeleft + " seconds.";
    }

    timeleft -= 1;
}, 1000);