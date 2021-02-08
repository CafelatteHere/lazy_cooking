function showBtn () {
  const recipes = document.querySelectorAll('.recipe');

  recipes.forEach((recipe) => {
    recipe.addEventListener('mouseover', function(e){
      const editBtn = e.target.querySelector('.pencil');
      if ((editBtn)&&(editBtn.classList.contains('hide'))){
        editBtn.classList.remove('hide');
      };
      const deleteBtn = e.target.querySelector('.trash');
     if ((deleteBtn) && (deleteBtn.classList.contains('hide'))){
      deleteBtn.classList.remove('hide');
     };
    });

    recipe.addEventListener('mouseleave', function(e){
      const editBtn = e.target.querySelector('.pencil');
      if ((editBtn) && (!(editBtn.classList.contains('hide')))){
        editBtn.classList.add('hide');
      };
      const deleteBtn = e.target.querySelector('.trash');
     if ((deleteBtn) && (!deleteBtn.classList.contains('hide'))){
      deleteBtn.classList.add('hide');
     };
    });
  });
};

function showMenu(){
  const menu = document.querySelector('.settings');
  const settingsMenu = document.querySelector('.settings-menu');
  menu.addEventListener('click', function(){
    settingsMenu.classList.toggle('hide');
  });

  // menu.addEventListener('click', function(e){
  //   if (e.target != menu)
  //   {settingsMenu.classList.add('hide');};
  // });
}

if (location.pathname.match("/")){
  window.addEventListener('load', showBtn);
  window.addEventListener('load', showMenu);
}
