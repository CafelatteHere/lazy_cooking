function searchRecipe () {
  const searchInput = document.querySelector('#calendar_recipe_id');
  const submitBtn = document.querySelector('.cal-search-btn');

  searchInput.addEventListener('keyup', ()=>{
    const keyword = document.querySelector('#calendar_recipe_id').value;
    console.log(keyword);
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `calendars/search/?keyword=${keyword}`, true);
    XHR.responseType = "json";
    XHR.send();

    XHR.onload = () => {
        const recipeName = XHR.response.keyword;
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
        recipeName.forEach ((recipe) => {
          const searchResultChild = document.createElement("div");
          searchResultChild.setAttribute("class", "result-child");
          searchResultChild.setAttribute("id", recipe.id);
          searchResultChild.innerHTML = recipe.name;
          searchResult.appendChild(searchResultChild);

          const clickElement = document.getElementById(recipe.id);
          clickElement.addEventListener('click', ()=> {
            document.querySelector('#calendar_recipe_id').value = clickElement.textContent;
            searchResult.innerHTML = "";
          });
        });
      };
    };
  });


  // days.forEach((day) => {
  //   day.addEventListener('click', function(){
  //     openCloseForm();
  //   });
  // });
  // const xBtn = document.querySelector('.modal-close');
  // xBtn.addEventListener('click', ()=>{
  //   openCloseForm();
  // });
};


if (location.pathname.match("calendars")){
  window.addEventListener('load', searchRecipe);
}