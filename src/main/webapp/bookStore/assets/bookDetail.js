document.addEventListener('DOMContentLoaded', function() {
    const stars = document.querySelectorAll('.star-rating .star');
    const ratingInput = document.getElementById('rating-value');
    let selectedRating = 0;

    stars.forEach(star => {
        // 마우스 오버
        star.addEventListener('mouseenter', function() {
            const val = parseInt(this.getAttribute('data-value'));
            stars.forEach((s, i) => {
                s.classList.toggle('hovered', i < val);
            });
        });
        // 마우스 아웃
        star.addEventListener('mouseleave', function() {
            stars.forEach((s, i) => {
                s.classList.remove('hovered');
            });
        });
        // 클릭
        star.addEventListener('click', function() {
            selectedRating = parseInt(this.getAttribute('data-value'));
            ratingInput.value = selectedRating;
            stars.forEach((s, i) => {
                s.classList.toggle('selected', i < selectedRating);
            });
        });
    });
});

function toggleEditForm(reviewId) {
    const form = document.getElementById('edit-form-' + reviewId);
    if (form.style.display === 'none' || form.style.display === '') {
        form.style.display = 'block';
    } else {
        form.style.display = 'none';
    }
}

function setupStarRating(reviewId) {
  const stars = document.querySelectorAll(`#edit-form-${reviewId} .star-rating .star`);
  const ratingInput = document.getElementById(`edit-rating-value-${reviewId}`);

  stars.forEach(star => {
    star.addEventListener('click', () => {
      const val = star.getAttribute('data-value');
      ratingInput.value = val;
      stars.forEach(s => s.classList.remove('selected'));
      for(let i = 0; i < val; i++) {
        stars[i].classList.add('selected');
      }
    });
  });
}

// DOM이 완전히 로드된 후 실행
window.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.review-form').forEach(form => {
    const reviewIdInput = form.querySelector('input[name="review_id"]');
    if (reviewIdInput) {
      const reviewId = reviewIdInput.value;
      setupStarRating(reviewId);
    }
  });
});


