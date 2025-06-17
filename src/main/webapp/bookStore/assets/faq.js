const notices = [];
  for (let i = 0; i < 250; i++) {
    notices.push({
      title: `[자주 묻는 질문] ${i + 1}`,
      writer: '고객센터',
      date: '2025.03.06'
    });
  }

  let recordName = {
    totalRecord: notices.length,
    recPerPage: 10,
    pagePerBlock: 10,
    totalPage: 0,
    totalBlock: 0,
    nowPage: 1,
    nowBlock: 1,
    recOfBeginPage: 0,
    pageOfBeginBlock: 0
  };

  let pagination;
  let recordDataContainer;
  document.addEventListener("DOMContentLoaded", function () {
    mInit();
  });
  function mInit() {
    pagination = document.querySelector('.pagination');
    recordDataContainer = document.querySelector('.recordDataContainer');

    recordName.totalPage = Math.ceil(recordName.totalRecord / recordName.recPerPage);
    recordName.totalBlock = Math.ceil(recordName.totalPage / recordName.pagePerBlock);

    createPagination();
    createRecordData();
  }

  function createPagination() {
    pagination.innerHTML = '';

    const crtAFirst = document.createElement('a');
    crtAFirst.href = '#';
    crtAFirst.innerHTML = '&laquo;';
    crtAFirst.addEventListener('click', movePrevBlock);
    pagination.appendChild(crtAFirst);

    let startPage = (recordName.nowBlock - 1) * recordName.pagePerBlock + 1;
    let endPage = Math.min(startPage + recordName.pagePerBlock - 1, recordName.totalPage);

    for (let page = startPage; page <= endPage; page++) {
      const crtA = document.createElement('a');
      crtA.href = '#';
      crtA.innerHTML = page;
      crtA.addEventListener('click', function (e) {
        e.preventDefault();
        setActivePage(page);
      });
      pagination.appendChild(crtA);
    }

    const crtALast = document.createElement('a');
    crtALast.href = '#';
    crtALast.innerHTML = '&raquo;';
    crtALast.addEventListener('click', moveNextBlock);
    pagination.appendChild(crtALast);

    setActivePage(startPage);
  }

  function setActivePage(page) {
    let links = document.querySelectorAll('.pagination a');
    links.forEach(link => link.classList.remove('active'));

    links.forEach(link => {
      if (parseInt(link.innerHTML) === page) {
        link.classList.add('active');
      }
    });

    recordName.nowPage = page;
    recordName.nowBlock = Math.floor((recordName.nowPage - 1) / recordName.pagePerBlock) + 1;

    createRecord(recordName.recPerPage, recordName.nowPage);
  }

  function movePrevBlock(e) {
    e.preventDefault();
    if (recordName.nowBlock > 1) {
      recordName.nowBlock--;
      createPagination();
    } else {
      alert("첫 번째 블럭입니다.");
    }
  }

  function moveNextBlock(e) {
    e.preventDefault();
    if (recordName.nowBlock < recordName.totalBlock) {
      recordName.nowBlock++;
      createPagination();
    } else {
      alert("마지막 블럭입니다.");
    }
  }

  function createRecordData() {
    recordDataContainer.innerHTML = '';
    createRecord(recordName.recPerPage, recordName.nowPage);
  }

  function createRecord(recPerPage, nowPage) {
    recordDataContainer.innerHTML = '';

    let num = (nowPage - 1) * recPerPage;

    for (let i = 0; i < recPerPage; i++) {
      if (num + i >= recordName.totalRecord) break;

      const createData = document.createElement('div');
      createData.classList.add('recordData');

      let createDataInfo = document.createElement('div');
      createDataInfo.classList.add('recordDataNum');
      createDataInfo.innerHTML = num + i + 1;
      createData.appendChild(createDataInfo);

      createDataInfo = document.createElement('div');
      createDataInfo.classList.add('recordDataInfo');
      createDataInfo.innerHTML = notices[num + i].title;
      createData.appendChild(createDataInfo);

      let createDataWriter = document.createElement('div');
      createDataWriter.classList.add('recordDataWriter');
      createDataWriter.innerHTML = notices[num + i].writer;
      createData.appendChild(createDataWriter);

      let createDataDate = document.createElement('div');
      createDataDate.classList.add('recordDataDate');
      createDataDate.innerHTML = notices[num + i].date;
      createData.appendChild(createDataDate);

      recordDataContainer.appendChild(createData);
    }
  }