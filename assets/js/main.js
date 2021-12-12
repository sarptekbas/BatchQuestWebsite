$(document).ready(function () {

  $("body").fadeIn(200);

  $(".bp").click(function (event) {
    event.preventDefault();

    newLocation = this.href;

    $("body").fadeOut(200, newpage);
  });

  function newpage() {
    window.location = newLocation;
  }
});
