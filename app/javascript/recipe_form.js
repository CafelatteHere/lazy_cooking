function showImg () {
  const imgInput = document.querySelector('#image');
  imgInput.addEventListener('change', (e)=>{
    const img_prev = document.querySelector('#img-preview');
    img_prev.src = URL.createObjectURL(e.target.files[0]);
    img_prev.classList.remove('hidden');
  });
};

function  portionCounter () {
  const portion_input = document.querySelector('.portion-input');
  const plus = document.querySelector('.plus');
  const minus = document.querySelector('.minus');
  plus.addEventListener('click', ()=>{
    portion_input.value = Number(portion_input.value);
    if (portion_input.value <= 9) {
      portion_input.value++;
    }
  });
  minus.addEventListener('click', ()=>{
    portion_input.value = Number(portion_input.value);
    if (portion_input.value >= 1) {
      portion_input.value--;
    }
  });
};



if (location.pathname.match("recipes/new")){
  window.addEventListener('load', showImg);
  window.addEventListener('load', portionCounter);
}
