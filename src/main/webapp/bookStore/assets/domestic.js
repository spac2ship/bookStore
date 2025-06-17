document.addEventListener('DOMContentLoaded', function() {
  // ========== Swiper 초기화 ========== //
  // 메인 배너 (좌우 스와이프)
  const mainSwiper = new Swiper('#mainSwiper', {
    direction: 'horizontal',
    loop: true,
    autoplay: { delay: 3000, disableOnInteraction: false },
    navigation: {
      nextEl: '#mainSwiper .swiper-button-next',
      prevEl: '#mainSwiper .swiper-button-prev',
    },
	pagination: { // 이 부분 추가
	      el: '#mainSwiper .custom-pagination', // JSP에 추가한 div의 선택자
	      clickable: true, // 불릿(버튼) 클릭으로 슬라이드 이동 가능하게 설정
    },
    speed: 800,
    slidesPerView: 1,
  });

  // 사이드 배너 (페이드 효과)
  const sideSwiper = new Swiper('#sideSwiper', {
    effect: 'fade',
    loop: true,
    autoplay: { delay: 5000, disableOnInteraction: false },
    allowTouchMove: false,
  });

  // ========== 이미지 세트 전환 로직 ========== //
  const imagePath = '../assets/images/';

  // [1] 그리드 섹션 이미지 전환
  let gridIndex = 0;
  const gridLinks = document.querySelectorAll('.grid-section .image-link');
  const gridImageSets = [
    { 
      images: ['dbanner20.jpg','dbanner21.jpg','dbanner22.jpg','dbanner23.jpg','dbanner24.jpg'],
      links: ['102','105','106','100','127']
    },
    { 
      images: ['dbanner25.jpg','dbanner26.jpg','dbanner27.jpg','dbanner28.jpg','dbanner29.jpg'],
      links: ['107','120','116','126','124']
    },
    { 
      images: ['dbanner30.jpg','dbanner31.jpg','dbanner32.jpg','dbanner33.jpg','dbanner34.jpg'],
      links: ['119','114','123','130','122']
    },
    { 
      images: ['dbanner35.jpg','dbanner36.jpg','dbanner37.jpg','dbanner38.jpg','dbanner39.jpg'],
      links: ['104','110','125','118','111']
    }
  ];

  // [2] 서브 배너 이미지 전환
  let subIndex = 0;
  const subb1 = document.getElementById('subb1');
  const subb2 = document.getElementById('subb2');
  const subImageSets = [
    ['dbanner14.jpg', 'dbanner15.jpg'],
    ['dbanner16.jpg', 'dbanner17.jpg'],
    ['dbanner18.jpg', 'dbanner19.jpg']
  ];

  // [3] 사이드 배너 이미지 전환
  let sideIndex = 0;
  const bannerImg = document.getElementById('banner-img');
  const sideImages = [
    'dbanner11.jpg','dbanner12.jpg','dbanner13.jpg',
    'dbanner45.jpg','dbanner46.jpg','dbanner47.jpg'
  ];

  // ========== 공통 전환 함수 ========== //
  function updateGridImages() {
    gridIndex = (gridIndex + 1) % gridImageSets.length;
    const set = gridImageSets[gridIndex];
    gridLinks.forEach((link, idx) => {
      link.href = `./bookDetail.jsp${window.dquery}&book_id=${set.links[idx]}`;
      link.querySelector('img').src = imagePath + set.images[idx];
    });
  }

  function updateSubImages() {
    subIndex = (subIndex + 1) % subImageSets.length;
    const [img1, img2] = subImageSets[subIndex];
    subb1.src = imagePath + img1;
    subb2.src = imagePath + img2;
  }

  function updateSideBanner() {
    sideIndex = (sideIndex + 1) % sideImages.length;
    bannerImg.src = imagePath + sideImages[sideIndex];
    bannerImg.alt = `배너 이미지 ${sideIndex + 1}`;
  }

  // ========== 인터벌 시작 ========== //
  setInterval(updateGridImages, 5000);
  setInterval(updateSubImages, 5000);
  setInterval(updateSideBanner, 5000);
});