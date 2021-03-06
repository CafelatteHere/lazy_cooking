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

  const newBtn = document.querySelector('.new-card');
  newBtn.addEventListener('click', function(){
    openCloseForm();
  });
};

function openCloseForm () {
  const form = document.querySelector('.modal');
  form.classList.toggle('hide');
}

function showBtn () {
  const recipeCards = document.querySelectorAll('.recipe-card');

  recipeCards.forEach((recipeCard) => {
    recipeCard.addEventListener('mouseover', function(){
      const deleteBtn = recipeCard.querySelector('.trash');
      deleteBtn.classList.remove('hide');
    });

    recipeCard.addEventListener('mouseleave', function(){
      const deleteBtn = recipeCard.querySelector('.trash');
      deleteBtn.classList.add('hide');
    });
  });
};

if (location.pathname.match("calendars")){
  window.addEventListener('load', showForm);
  window.addEventListener('load', showBtn);
}