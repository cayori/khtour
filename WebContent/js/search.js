
/*
 * 검색 카테고리링크 (폼 추가)
 */
/* global vv */
//eslint disable영역의 경우 기존 레거시 로직으로 eslint 예외구간으로 지정합니다
/* eslint-disable camelcase */
function category_search(tid, pid, lid, q, _service, _type, _no) {
  var formObj = $('#search_form');
  var rAction = [];
  rAction.push('/search');
  if (tid) {
    rAction.push(tid);
    if (pid) {
      rAction.push(pid);
      if (lid) {
        rAction.push(lid);
      }
    }
  }
  var action = rAction.join('/');
  formObj.attr('action', action);
  formObj.find('[name=search_keyword]').val(unescape(q));

  var serviceNode = $('<input type="hidden" name="_service">');
  serviceNode.val(_service);
  formObj.append(serviceNode);

  var typeNode = $('<input type="hidden" name="_type">');
  typeNode.val(_type);
  formObj.append(typeNode);

  if (_no) {
    var noNode = $('<input type="hidden" name="_no">');
    noNode.val(_no);
    formObj.append(noNode);
  }

  formObj.submit();
}

/*
 * 구버전 호환을 위해 별도 생성
 * price query 추가
 * price : "from~to" 형식
 */
function price_search(tid, pid, lid, q, sort_type, _service, _type, _no) {
  var ranges = get_selected_price_range();

  var formObj = $('#search_form');
  var rAction = [];
  rAction.push('/search');
  if (tid) {
    rAction.push(tid);
    if (pid) {
      rAction.push(pid);
      if (lid) {
        rAction.push(lid);
      }
    }
  }

  var sortNode = $('<input type="hidden" name="sort">');
  sortNode.val(sort_type);

  var priceNode = $('<input type="hidden" name="price">');
  priceNode.val(ranges);

  var action = rAction.join('/');
  formObj.attr('action', action);
  formObj.find('[name=search_keyword]').val(unescape(q));

  formObj.append(sortNode);
  formObj.append(priceNode);

  var serviceNode = $('<input type="hidden" name="_service">');
  serviceNode.val(_service);
  formObj.append(serviceNode);

  var typeNode = $('<input type="hidden" name="_type">');
  typeNode.val(_type);
  formObj.append(typeNode);

  if (_no) {
    var noNode = $('<input type="hidden" name="_no">');
    noNode.val(_no);
    formObj.append(noNode);
  }

  formObj.submit();
}


function get_selected_price_range() {
  var $priceCheckbox = $('[name="price"]');
  var i;
  var ranges = '';

  if ($priceCheckbox.size() == 0) {
    return '';
  }

  for (i = 0; i < $priceCheckbox.size(); i++) {
    if ($priceCheckbox[i].checked) {
      if (ranges.length > 0) {
        ranges += ',';
      }
      ranges += $priceCheckbox[i].value;
    }
  }

  return ranges;
}


/*
 * 구버전 호환을 위해 별도 생성
 * 배송비 조건 검색 기능 추가
 * price query 추가
 * price : "from~to" 형식
 */
function ship_search(tid, pid, lid, q, sort_type, _service, _type, _no) {

  var formObj = $('#search_form');
  var rAction = [];
  rAction.push('/search');
  if (tid) {
    rAction.push(tid);
    if (pid) {
      rAction.push(pid);
      if (lid) {
        rAction.push(lid);
      }
    }
  }

  var sortNode = $('<input type="hidden" name="sort">');
  sortNode.val(sort_type);
  formObj.append(sortNode);

  var ranges = get_selected_price_range();
  if (ranges && 0 < ranges.length) {
    var priceNode = $('<input type="hidden" name="price">');
    priceNode.val(ranges);
    formObj.append(priceNode);
  }

  var ships = get_selected_ship_type();
  if (ships && 0 < ships.length) {
    var shipNode = $('<input type="hidden" name="freeShip">');
    shipNode.val(ships);
    formObj.append(shipNode);
  }

  var fast_ship = get_selected_fast_ship_type();
  if (fast_ship && 0 < fast_ship.length) {
    var fastShipNode = $('<input type="hidden" name="fastShip">');
    fastShipNode.val(fast_ship);
    formObj.append(fastShipNode);
  }

  var action = rAction.join('/');
  formObj.attr('action', action);
  formObj.find('[name=search_keyword]').val(unescape(q));

  var serviceNode = $('<input type="hidden" name="_service">');
  serviceNode.val(_service);
  formObj.append(serviceNode);

  var typeNode = $('<input type="hidden" name="_type">');
  typeNode.val(_type);
  formObj.append(typeNode);

  if (_no) {
    var noNode = $('<input type="hidden" name="_no">');
    noNode.val(_no);
    formObj.append(noNode);
  }

  formObj.submit();
}


function get_selected_ship_type() {
  var sReturn = '';
  $('[name=shipType]').each(function () {

    var $this = $(this);
    if ($this.prop('checked')) {
      if (sReturn != '') {
        sReturn += ',';
      }
      sReturn += $this.val();
    }
  });

  return sReturn;
}

function get_selected_fast_ship_type() {
  var $chk = $('#fast_ship');
  if ($chk.prop('checked')) {
    return $('#fast_ship').val();
  } else {
    return '';
  }
}


/*
 * 검색 정렬링크 (폼 추가)
 */
function dealsort(q, sort_type, _service, _type, _no) {
  var formObj = $('#search_form');
  var sortNode = $('<input type="hidden" name="sort">');
  sortNode.val(sort_type);
  formObj.append(sortNode);

  var ranges = get_selected_price_range();
  if (ranges && 0 < ranges.length) {
    var priceNode = $('<input type="hidden" name="price">');
    priceNode.val(ranges);
    formObj.append(priceNode);
  }

  var ships = get_selected_ship_type();
  if (ships && 0 < ships.length) {
    var shipNode = $('<input type="hidden" name="freeShip">');
    shipNode.val(ships);
    formObj.append(shipNode);
  }

  var fast_ship = get_selected_fast_ship_type();
  if (fast_ship && 0 < fast_ship.length) {
    var fastShipNode = $('<input type="hidden" name="fastShip">');
    fastShipNode.val(fast_ship);
    formObj.append(fastShipNode);
  }

  formObj.find('[name=search_keyword]').val(unescape(q));

  var serviceNode = $('<input type="hidden" name="_service">');
  serviceNode.val(_service);
  formObj.append(serviceNode);

  var typeNode = $('<input type="hidden" name="_type">');
  typeNode.val(_type);
  formObj.append(typeNode);

  if (_no) {
    var noNode = $('<input type="hidden" name="_no">');
    noNode.val(_no);
    formObj.append(noNode);
  }

  formObj.submit();
}
/* eslint-enable camelcase */





var searchContents = (function () {

  var iCurPage = 2;
  var isLoading = '';
  var data = {};
  var iDealListTotalPage = vv.gvars('dealListTotalPage');
  var gnb1 = vv.gvars('gnb1');
  var gnb2 = vv.gvars('gnb2');
  var gnb3 = vv.gvars('gnb3');

  function getDealMore(sUrl) {
    $.ajax({
      cache: false,
      type: 'post',
      data: {
        url: sUrl,
        template: '@contents/resources/dealList.twig',
        certAdult: vv.gvars('certAdult'),
        totalPage: iDealListTotalPage
      },
      url: '/render/getDealMore',
      dataType: 'json',
      success: function (result) {
        var oResult = $(result.html).find('li');
        $('#search_deal_area').append(oResult);
        lazyload();
        if (iCurPage > result.totalPage) {
          isLoading = 'endPage';
        } else {
          isLoading = 'complete';
        }
        iCurPage++;
      },
      error: function (result) {
        isLoading = 'complete';
        return;
      }
    });
  }

  function lazyload() {
    $('img.lazy').lazyload({
      effect: 'fadeIn',
      threshold: 200,
      container: $('.content-main'),
      load: function () {
        $(this).removeClass('lazy');
      }
    });
  }

  function showNextDeadLineDeal(iMax) {
    var iCurPage = parseInt($('[data-id-deadlineCurPage]').attr('data-id-deadlineCurPage'));
    var iNextPage = iCurPage + 1;
    if (iNextPage > iMax) {
      iNextPage = 1;
    }
    $('[data-id-deadlinePage]').hide();
    $('[data-id-deadlinePage=' + iNextPage + ']').show();
    $('[data-id-deadlineCurPage]').attr('data-id-deadlineCurPage', iNextPage);
    $('[data-id-deadlineCurPage]').text(iNextPage);
  }
  function showPrevDeadLineDeal(iMax) {
    var iCurPage = parseInt($('[data-id-deadlineCurPage]').attr('data-id-deadlineCurPage'));
    var iPrevPage = iCurPage - 1;
    if (iPrevPage < 1) {
      iPrevPage = iMax;
    }
    $('[data-id-deadlinePage]').hide();
    $('[data-id-deadlinePage=' + iPrevPage + ']').show();
    $('[data-id-deadlineCurPage]').attr('data-id-deadlineCurPage', iPrevPage);
    $('[data-id-deadlineCurPage]').text(iPrevPage);
  }





  if (iDealListTotalPage > 1) {
    isLoading = 'init';
  } else {
    isLoading = 'endPage';
  }

  $(window).scroll(function () {

    var bCondition = $(window).scrollTop() + $(window).height() > parseInt(window.document.body.scrollHeight * 0.5);
    if ((isLoading == 'init' || isLoading == 'complete') && bCondition) {
      data.keyword = encodeURIComponent($('#hidden_search_keyword').val());
      data.price = get_selected_price_range();
      data.queryType = $('#hidden_query_type').val();
      data.ship = get_selected_ship_type();
      data.fastship = get_selected_fast_ship_type();
      data.sort = vv.gvars('sort');
      isLoading = 'loading';

      var sUrl = '';
      sUrl += 'price=' + data.price + '&search_keyword=' + data.keyword + '&perPage=30&page=' + iCurPage + '&fastShip=' + data.fastship + '&freeShip=' + data.ship;
      sUrl += '&queryType=' + data.queryType;
      var _sort = !!data.sort;
      if (_sort) {
        sUrl += '&sort=' + data.sort;
      }
      if (gnb1) {
        sUrl += '&gid1=' + gnb1;
      }
      if (gnb2) {
        sUrl += '&gid2=' + gnb2;
      }
      if (gnb3) {
        sUrl += '&gid3=' + gnb3;
      }
      getDealMore(sUrl);

    }

  });
  return {
    showPrevDeadLineDeal: showPrevDeadLineDeal,
    showNextDeadLineDeal: showNextDeadLineDeal,
    lazyload: lazyload
  };
})();