function showForm () {
  const days = document.querySelectorAll('.wday');
  days.forEach((day) => {
    day.addEventListener('click', function(){
      openCloseForm();
    });
  });
  const xBtn = document.querySelector('.modal-close');
  xBtn.addEventListener('click', ()=>{
    openCloseForm();
  });
};

function openCloseForm () {
  const form = document.querySelector('.modal');
  form.classList.toggle('hide');
}



if (location.pathname.match("calendars")){
  window.addEventListener('load', showForm);
}