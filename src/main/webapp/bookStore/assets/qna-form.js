
// 참고 : https://seven7day.tistory.com/56
const input = document.getElementById('imageInput');
const preview = document.getElementById('preview');

input.addEventListener('change', () => {
	preview.innerHTML = '';
	let files = input.files;
	
	Array.from(files).forEach(file => {
		if (!file.type.startsWith('image/')) {
			return;
		}
		let reader = new FileReader();
		reader.onload = (e) => {
			let img = document.createElement('img');
			img.src = e.target.result;
			img.style.maxWidth = '200px';
			img.style.marginRight = '10px';
			img.style.border = '1px solid #ccc';
			img.style.padding = '5px';
			preview.appendChild(img);
		};
		reader.readAsDataURL(file);
	});
});