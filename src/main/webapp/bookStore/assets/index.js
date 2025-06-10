
let currentSlide = 0; // slide 인덱스
// querySelectorAll : HTML 문서나 특정한 요소 내에서 지정한 CSS 선택자와 일치하는 모든 요소를 반환
const slides = document.querySelectorAll('.slide');
const slideCount = slides.length; // slide 개수
let interval;

// 참고 : https://www.tojobcn.com/bbs/board.php?bo_table=html_board&wr_id=72
function showSlide(n) {
    slides.forEach(slide => slide.style.display = 'none');
    slides[n].style.display = 'block';
}

function nextSlide() {
    currentSlide = (currentSlide + 1) % slideCount;
    showSlide(currentSlide);
}

function prevSlide() {
    currentSlide = (currentSlide - 1 + slideCount) % slideCount;
    showSlide(currentSlide);
}

function restartInterval() {
    clearInterval(interval);
    interval = setInterval(nextSlide, 3000);
}


const preBtn = document.querySelector('#preBtn');
const nextBtn = document.querySelector('#nextBtn');

// 참고 https://heimish77.tistory.com/18

/*이전 버튼을 눌렀을 때 실행될 함수,
현재 index가 0일때 이전 버튼을 누르면 마지막 이미지가 출력돼야 하므로
slides.length에서 하나를 빼준다. (배열은 0부터 시작하므로)*/
preBtn.addEventListener('click', () => {
    if (currentSlide > 0) {
        currentSlide -= 1;
    } else {
        currentSlide = slides.length - 1;
    }
    showSlide(currentSlide);
    restartInterval();
});

// 다음 버튼 눌렀을 때 실행될 함수
nextBtn.addEventListener('click', () => {
    if (currentSlide < slides.length - 1) { // 1 ~ n 번째 인덱스
        currentSlide += 1;
    } else { // 마지막 인덱스일 경우 첫번째 인덱스로 이동
        currentSlide = 0;
    }
    showSlide(currentSlide);
    restartInterval();
});

// 도트 요소 선택
const dots = document.querySelectorAll('.banner-dot');

// 도트 활성화 함수
function updateDots(idx) {
    dots.forEach((dot, i) => {
        dot.classList.toggle('active', i === idx);
    });
}

// 초기 활성화
updateDots(currentSlide);

// 슬라이드 변경 시 도트도 변경
function showSlide(n) {
    slides.forEach(slide => slide.style.display = 'none');
    slides[n].style.display = 'block';
    updateDots(n);
}

// 도트 클릭 시 해당 슬라이드로 이동
dots.forEach((dot, i) => {
    dot.addEventListener('click', () => {
        currentSlide = i;
        showSlide(currentSlide);
    	restartInterval();
    });
});


document.addEventListener('DOMContentLoaded', () => { // 문서 로드 시 발생
    showSlide(currentSlide);
    interval = setInterval(nextSlide, 3000); // 3초마다 자동 슬라이드
});



// 오늘 날짜 생성
var date = new Date().toLocaleDateString();
document.getElementById("current_date").innerHTML = date;

