
if (document.URL.match( /records/ )) {
// エラー時のrenderで読み込まれなくなるため暫定措置
// if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      // 複数枚対応で追加
      imageElement.setAttribute('class', "image-element");
      let imageElementNum = document.querySelectorAll('.image-element').length;

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'img-fluid');

      // ファイル選択ボタンを生成(複数枚対応)
      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('id', `fish_record_image_${imageElementNum}`);
      inputHTML.setAttribute('name', 'fish_record[images][]');
      inputHTML.setAttribute('type', 'file');

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML);  // 複数枚対応で追加
      ImageList.appendChild(imageElement);

      // 複数枚対応
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob);
      });
    };

    document.getElementById('fish_record_image').addEventListener('change', function(e){

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}