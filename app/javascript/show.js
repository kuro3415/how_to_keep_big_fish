$(function(){
  //正面と側面の選択によって表示する画像を変えたい
  let direction = 'front';
  let val = 0;

  let radio_btns = document.querySelectorAll(`input[type='radio'][name='type']`);

  for (let target of radio_btns) {
    target.addEventListener('change', function(){
      if(val == 0){
        direction = 'side';
        val++;
      }else{
        direction = 'front';
        val =0;
      }
      var select_width2 = $('select[name="width"]').val();
      var select_depth2 = $('select[name="depth"]').val();
      var select_length2 = $('select[name="length"]').val();
      $('.fish_tank_img').attr('src', `/images/fish_tanks/${direction}/` + `${select_width2}x${select_depth2}x${select_length2}.jpg`);
    });
  }

  //各セレクトを取得...これを選択済みのオプションのみ取得できるようにしたい
  let select_width = document.querySelector(`select[name='width'] option[selected='selected']`);
  let select_depth = document.querySelector(`select[name='depth'] option[selected='selected']`);
  let select_length = document.querySelector(`select[name='length'] option[selected='selected']`);
  let select_fish = $('select[name="fish"]').val();

  //各選択済みのセレクトのvalueを組み合わせて画像を表示させたい
  $('.fish_tank_img').attr('src', `/images/fish_tanks/${direction}/` + `${select_width.value}x${select_depth.value}x${select_length.value}.jpg`);
  $('.fish_img').attr('src', `${select_fish}`);

  //セレクタを変更したら画像の変更イベントを発生させたい
  $('select').change(function(){
    var select_width2 = $('select[name="width"]').val();
    var select_depth2 = $('select[name="depth"]').val();
    var select_length2 = $('select[name="length"]').val();
    var select_fish2 = $('select[name="fish"]').val();
    $('.fish_tank_img').attr('src', `/images/fish_tanks/${direction}/` + `${select_width2}x${select_depth2}x${select_length2}.jpg`);
    $('.fish_img').attr('src', `${select_fish2}`);
  });
});