/**
 * 검색 결과 페이지 UI Control
 */
var uiSearch = {
  /**
   * 연관검색어 노출 되지 않을 때 우측 사이드배너 위치변경
   * 호출 : application/view/search/search_main.php
   * 호출 : application/view/productsearch/search_main.php
   */
  relationAreaCheck: function () {
    if ($('.wrap-relation-search').length < 1) {
      $('#container').addClass('not-has-relation');
    }
  },
  /**
   * 검색페이지 카테고리 2depth 클릭 및 포커스 레이어 오픈
   */
  searchLayerMoreCate: function () {
    $('.list_depth_02 .btn_more').click(function (e) {
      function layerClose() {
        $('.layer_more_cate').removeClass('layer_more_open');
      }
      if ($(this).next().hasClass('layer_more_open')) {
        layerClose();
      } else {
        layerClose();
        $(this).next().addClass('layer_more_open');
      }
    });
    $(document).click(function (e) {
      if ($(e.target).parents('.list_depth_02 > li').length == 0) {
        $('.layer_more_cate').removeClass('layer_more_open');
      }
    });
    $('.layer_more_cate').focusin(function () {
      $(this).addClass('layer_more_open');
    }).focusout(function () {
      $(this).removeClass('layer_more_open');
    });
  },
  /**
   * 검색페이지 검색어(카테고리)가 길어질 경우 ... 처리
   */
  searchesReducing: function () {
    var $keyword = $('.search__result_title .keyword');
    var _titleWidth = parseInt($('.search__result_title').width());
    var _titleInnerWidth = parseInt($('.search__result_title > .txt_inline').width());
    var _cateMinus;
    if (_titleInnerWidth > _titleWidth) {
      var _wrapCateWidth = parseInt($('.search__result_title .txt_cate').width());
      var _wrapCateWidth2 = parseInt($('.search__result_title .txt_cate2').width());
      var _keywordWidth = parseInt($('.text_red > .keyword').width());
      var _keywordGapWidth = parseInt($('.text_red').width()) - _keywordWidth;
      if ((_wrapCateWidth.length > 0) && (_wrapCateWidth2.length > 0)) {
        _cateMinus = _wrapCateWidth - _wrapCateWidth2;
      } else {
        _cateMinus = _wrapCateWidth;
      }
      var _titleInnerWidthGap = _titleInnerWidth - _cateMinus - _keywordWidth;
      var _keywordWidthEllipsis = _titleWidth - _cateMinus - _keywordGapWidth - _titleInnerWidthGap;

      $keyword.addClass('reduce').css('width', _keywordWidthEllipsis + 'px');
      $('[data-id=lang-change-ko]').addClass('ellipsis');
    }
  },
  /**
   * 이미지 체크박스 On, Off
   */
  searchPriceCheck: function () {
    var $label = $('[data-id="check_label"]');
    $label.each(function () {
      var sId = $(this).attr('for');
      var oChk = $('#' + sId);
      var $this = $(this);
      oChk.change(function () {
        if ($this.hasClass('disabled')) {
          return;
        }
        var $li = $this.closest('li');

        if ($li.hasClass('on')) {
          $li.removeClass('on');
        } else {
          $li.addClass('on');
        }
      });
    });
  }
};

/**
 * Document ready
 */
$(document).ready(function () {
  // 검색페이지 카테고리 2depth 클릭 및 포커스 레이어 오픈
  uiSearch.searchLayerMoreCate();

  // 이미지 체크박스 On, Off
  uiSearch.searchPriceCheck();

});