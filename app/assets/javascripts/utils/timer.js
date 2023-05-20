document.addEventListener('DOMContentLoaded', function() {
    var timerElement = document.getElementById('timer'); // HTML element to display the timer
    var startTime = new Date(); // Start time of the timer
  
    function updateTimer() {
      var currentTime = new Date();
      var timeElapsed = Math.floor((currentTime - startTime) / 1000); // Time elapsed in seconds
  
      var minutes = Math.floor(timeElapsed / 60);
      var seconds = timeElapsed % 60;
  
      // Format the minutes and seconds as two-digit numbers
      var formattedTime = ('00' + minutes).slice(-2) + ':' + ('00' + seconds).slice(-2);
  
      // Update the timer element with the formatted time
      timerElement.innerHTML = formattedTime;
    }
  
    // Update the timer every second
    setInterval(updateTimer, 1000);
  });