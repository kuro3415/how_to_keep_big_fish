$(function(){
  const imgs = ['120x00x60.jpg', '00x60x60.jpg'];
  let show = 0;

  $('.img').attr('src', '/images/' + imgs[show]);

  let radio_btns = document.querySelectorAll(`input[type='radio'][name='type']`);

  for (let target of radio_btns) {
    target.addEventListener('change', function(){
      if(show == imgs.length -1){
        show =0;
      }else{
        show++;
      }
      console.log(show);
      $('.img').attr('src', '/images/' + imgs[show]);
    });
  }
});