

// 기본 데이터 설정
const recordName = {
    totalRecord: 255,     // 총 레코드 수
    recPerPage: 10,       // 페이지당 보여줄 레코드 수
    pagePerBlock: 10,     // 블록당 페이지 수
    totalPage: 0,         // 총 페이지 수
    totalBlock: 0,        // 총 블록 수
    nowPage: 0,           // 현재 페이지
    nowBlock: 0,          // 현재 블록
    recOfBeginPage: 0,    // 시작 페이지
    pageOfBeginBlock: 0   // 시작 블록
};

let recordNameArr = Object.keys(recordName);    
let recordValueArr = Object.values(recordName); 

let recordContainer;
let recordValue;
let pagination;
let recordDataContainer;
let btn;

function tableDisplay() {
    const table = document.getElementById('tb1');
    const recordDataContainer = document.querySelector('.recordDataContainer');

    if (recordName.nowPage === 0) {
        table.style.display = 'table';
        recordDataContainer.style.display = 'none';
    } else {
        table.style.display = 'none';
        recordDataContainer.style.display = 'block';
    }
}


function mInit() {
    recordContainer = document.querySelector(".recordContainer");
    recordDataContainer = document.querySelector(".recordDataContainer");
    pagination = document.querySelector(".pagination");

    // recordContainer 작성 DOM
    for (let idx = 0; idx < recordNameArr.length - 2; idx++) {
        let subContainer = document.createElement("div");
        subContainer.classList.add("records");

        // recordName DIV 생성
        let subDiv = document.createElement("div");
        subDiv.classList.add("recordName");
        subDiv.innerHTML = recordNameArr[idx];
        subContainer.appendChild(subDiv);

        // recordValue DIV 생성
        subDiv = document.createElement("div");
        subDiv.classList.add("recordValue");
        subDiv.innerHTML = recordValueArr[idx];
        subContainer.appendChild(subDiv);

        recordContainer.appendChild(subContainer);
    }

    recordValue = document.querySelectorAll(".recordValue");

    // ------------------ totalPage, totalBlock 계산 ------------------
    recordName.totalPage = Math.ceil(recordName.totalRecord / recordName.recPerPage);
    recordName.totalBlock = Math.ceil(recordName.totalPage / recordName.pagePerBlock);

    recordValue[3].innerHTML = recordName.totalPage;
    recordValue[4].innerHTML = recordName.totalBlock;

    // ------------------ pagination ------------------
    for (let idx = 0; idx < recordName.pagePerBlock + 2; idx++) {
        let crtA = document.createElement("a");
        crtA.href = "#";
        crtA.innerHTML = idx;
        crtA.addEventListener('click', () => clickBtn(crtA, idx));
        pagination.appendChild(crtA);
    }

    // <<, >>
    pagination.children[0].innerHTML = '&laquo;';
    pagination.lastChild.innerHTML = '&raquo;';
    pagination.children[1].classList.add('active');

    createRecord(recordName.recPerPage, recordName.nowPage);

    // 무조건 초기화 여기서 해줘야 length가 0이 안됨
    btn = document.querySelectorAll('.pagination a');
    
    tableDisplay();
}


// 버튼 클릭 이벤트
function clickBtn(object, index) {
    formatBtnActive(index);  

    changePage(parseInt(object.innerHTML) - 1); // 현재 페이지 변경
    removeRecord();          // 레코드 초기화
    createRecord(recordName.recPerPage, recordName.nowPage);
    
    tableDisplay();
    
    // 버튼 액티브 초기화
    function formatBtnActive(selectBtnIdx) {
         // 초기화
         btn.forEach(item=> {
            item.classList.remove('active');
        });
        btn[selectBtnIdx].classList.add('active');
    }

    // << : Before Block Btn Click
    if (index == 0) { // << 위치
        let isValidBlock = validationBlock(-1, recordName.nowBlock, recordName.totalBlock);

        // first 또는 last 이면 false / 아니면 true
        if (isValidBlock == false) {
            formatBtnActive(1);
            changePage(0);
            removeRecord();
            createRecord(recordName.recPerPage, recordName.nowPage);
            tableDisplay();
            return;
        }

        // 현재 블록 변경
        changeBlock(-1, recordName.nowBlock, recordName.pagePerBlock);
        concealBtn(false);  // btn 숨김 해제

        formatBtnActive(1);  // First Page Chk
        changePage(parseInt(btn[1].innerHTML) - 1);
        removeRecord();
        createRecord(recordName.recPerPage, recordName.nowPage);
        changeBeginningRecord(recordName.nowPage, recordName.recPerPage);
        changeBeginningPage(recordName.nowBlock, recordName.pagePerBlock);
    }

    // >> : After Block Btn Click
    else if (index == btn.length - 1) {
        let isValidBlock = validationBlock(1, recordName.nowBlock, recordName.totalBlock);
        if (isValidBlock == false) {
            formatBtnActive(1);
            changePage(parseInt(btn[1].innerHTML) - 1);
            removeRecord();
            createRecord(recordName.recPerPage, recordName.nowPage);
            tableDisplay();
            return;
        }

        changeBlock(1, recordName.nowBlock, recordName.pagePerBlock);

        // Btn Hidden
        if (recordName.nowBlock + 1 == recordName.totalBlock) {
            concealBtn(true);
        }

        formatBtnActive(1);  // First Page Chk
        changePage(parseInt(btn[1].innerHTML) - 1);
        removeRecord();
        createRecord(recordName.recPerPage, recordName.nowPage);
        changeBeginningRecord(recordName.nowPage, recordName.recPerPage);
        changeBeginningPage(recordName.nowBlock, recordName.pagePerBlock);
    }
}

// 레코드 전체 지우기
function removeRecord() {
    while(recordDataContainer.firstChild) {
        recordDataContainer.removeChild(recordDataContainer.lastChild);
    }
}

// 현재 페이지 바꾸기
function changePage(nowPage) {
    recordValue[5].innerHTML = nowPage;
    recordName.nowPage = nowPage;
}

function createRecord(recPerPage, nowPage) {
	// 첫번째 페이지는 안보여줌
	if(nowPage == 0) {
		return;
	}
    let num = nowPage * recPerPage;
    
    // 10회 반복
    for(let i = 0; i < recPerPage; i++) {
        if(num + i > recordName.totalRecord) {
            break;
        }
        let createData = document.createElement('div');
        createData.classList.add('recordData');

        let createDataInfo = document.createElement('div');
        createDataInfo.classList.add('recordDataNum');
        createDataInfo.innerHTML = num + i;
        createData.appendChild(createDataInfo);

        createDataInfo = document.createElement('div');
        createDataInfo.classList.add('recordDataInfo');
        createDataInfo.innerHTML = "No." + (num+i) + " Record";
        createData.appendChild(createDataInfo);

        recordDataContainer.appendChild(createData);
    }        
}

// -----------------------------------------------------------
function changeBeginningRecord(nowPage, recordPerPage) {
    recordName.recOfBeginPage = nowPage * recordPerPage;
}

function changeBeginningPage(nowBlock, pagePerBlock) {
    recordName.pageOfBeginBlock = nowBlock * pagePerBlock;
}

function concealBtn(isLastBlock) {
    if (isLastBlock == true) {
        btn.forEach((item) => {
            if (parseInt(item.innerHTML) > recordName.totalPage) {
                item.style.display = 'none';
            }
        });
        btnConceal = true;
    } else {
        btn.forEach((item) => {
            item.style.display = 'inline';
        });
        btnConceal = false;
    }
}

function changeBlock(nextBlock, nowBlock, pagePerBlock) {
    // 현재 블록 정보 변경
    nowBlock += nextBlock;
    recordValue[6].innerHTML = nowBlock;
    recordName.nowBlock = nowBlock;

    // 버튼 innerHTML 변경
    btn.forEach((item, idx) => {
        if (idx == 0 || idx == btn.length - 1)  {
            return;
        } // <<, >> : Block Btn Chk

        if (nextBlock == -1) {
            item.innerHTML = parseInt(item.innerHTML) - pagePerBlock;
        } else if (nextBlock == 1) {
            item.innerHTML = parseInt(item.innerHTML) + pagePerBlock;
        }
    });
}

// 끝 값 정의
function validationBlock(blockChk, nowBlock, totalBlock) {
    if (nowBlock + blockChk < 0) {  // 현재 블록에 blockChk 값을 더한 값이 0보다 작다면 경고
        alert("first block");
        return false;
    }
    else if (nowBlock + blockChk >= totalBlock) { // 현재 블록에 blockChk 값을 더한 값이 총 블록값보다 클 경우 경고
        alert("last block");
        return false;
    }
    return true;
}

// 그냥 window.onload로 하면 header에 있는 로그인 쿼리랑 중복 onload로 script 오류남
document.addEventListener('DOMContentLoaded', function() {
	  mInit(); 
}); 