
// 체크박스 전체 선택
// 참고 : https://hianna.tistory.com/432
function selectAll(selectAll) {
    const checkboxes = document.getElementsByName('book_id');

    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    });
}

// DOMContentLoaded 이벤트는 HTML 문서가 모두 로드된 후 실행됨.
document.addEventListener("DOMContentLoaded", function () {
    var bookList = document.querySelector(".book-list");  // HTML에서 .book-list 요소를 가져옴
    var books = bookList.children; // 모든 book-item을 가져옴, <div class="book-item"> 들이 배열처럼 저장됨.
    var dropdown = document.getElementById("pg-size");

    function updateBookList(limit) {
        for (var i = 0; i < books.length; i++) {
            if (i < limit) {
                books[i].style.display = "flex"; // 보이게 설정
            } else {
                books[i].style.display = "none"; // 숨김
            }
        }
    }

    dropdown.addEventListener("change", function () { // change 이벤트
        var selectedValue = parseInt(dropdown.value); // 드롭다운 선택한 값을 숫자로 변환
        updateBookList(selectedValue);
    });

    updateBookList(5); // 기본값 5개씩 보기
});