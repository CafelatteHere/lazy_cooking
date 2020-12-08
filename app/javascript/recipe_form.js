function showImg () {
  const imgInput = document.querySelector('#image');
  imgInput.addEventListener('change', (e)=>{
    const img_prev = document.querySelector('#img-preview');
    img_prev.src = URL.createObjectURL(e.target.files[0]);
    img_prev.classList.remove('hidden');
  });
};



if (location.pathname.match("recipes/new")){
  window.addEventListener('load', showImg);
}
