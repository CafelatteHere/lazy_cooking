function showBtn () {
  const recipes = document.querySelectorAll('.recipe');

  recipes.forEach((recipe) => {
    recipe.addEventListener('mouseover', function(e){
      const editBtn = e.target.querySelector('.pencil');
      editBtn.classList.remove('hide');
      const deleteBtn = e.target.querySelector('.trash');
      deleteBtn.classList.remove('hide');
    });

    recipe.addEventListener('mouseleave', function(e){
      const editBtn = e.target.querySelector('.pencil');
      editBtn.classList.add('hide');
      const deleteBtn = e.target.querySelector('.trash');
      deleteBtn.classList.add('hide');
    });
  });
};

if (location.pathname.match("/")){
  window.addEventListener('load', showBtn);
}
