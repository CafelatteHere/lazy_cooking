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

function showBtn () {
  const recipeCards = document.querySelectorAll('.recipe-card');

  recipeCards.forEach((recipeCard) => {
    recipeCard.addEventListener('mouseover', function(){
      const editBtn = recipeCard.querySelector('.pencil');
      editBtn.classList.remove('hide');
      const deleteBtn = recipeCard.querySelector('.trash');
      deleteBtn.classList.remove('hide');
    });

    recipeCard.addEventListener('mouseleave', function(){
      const editBtn = recipeCard.querySelector('.pencil');
      editBtn.classList.add('hide');
      const deleteBtn = recipeCard.querySelector('.trash');
      deleteBtn.classList.add('hide');
    });
  });
};

if (location.pathname.match("calendars")){
  window.addEventListener('load', showForm);
  window.addEventListener('load', showBtn);
}