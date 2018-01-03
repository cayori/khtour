package service;

public class pagingActionQuestionCo {
	private int currentPageCo; // 현재페이지
	private int totalCountCo; // 전체 게시물 수
	private int totalPageCo; // 전체 페이지 수
	private int blockCountCo; // 한 페이지의 게시물의 수
	private int blockPageCo; // 한 화면에 보여줄 페이지 수
	private int startCountCo; // 한 페이지에서 보여줄 게시글의 시작 번호
	private int endCountCo; // 한 페이지에서 보여줄 게시글의 끝 번호
	private int startPageCo; // 시작 페이지
	private int endPageCo; // 마지막 페이지

	private StringBuffer pagingHtmlCo;

	// 페이징 생성자
	public pagingActionQuestionCo(int currentPageCo, int totalCountCo, int blockCountCo, int blockPageCo, int cupage,
			int quno) {

		this.blockCountCo = blockCountCo;
		this.blockPageCo = blockPageCo;
		this.currentPageCo = currentPageCo;
		this.totalCountCo = totalCountCo;

		// 전체 페이지 수
		totalPageCo = (int) Math.ceil((double) totalCountCo / blockCountCo);
		if (totalPageCo == 0) {
			totalPageCo = 1;
		}

		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPageCo > totalPageCo) {
			currentPageCo = totalPageCo;
		}

		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCountCo = (currentPageCo - 1) * blockCountCo;
		endCountCo = startCountCo + blockCountCo - 1;

		// 시작 페이지와 마지막 페이지 값 구하기.
		startPageCo = (int) ((currentPageCo - 1) / blockPageCo) * blockPageCo + 1;
		endPageCo = startPageCo + blockPageCo - 1;

		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPageCo > totalPageCo) {
			endPageCo = totalPageCo;
		}

		// 이전 block 페이지
		pagingHtmlCo = new StringBuffer();
		if (currentPageCo > blockPageCo) {
			pagingHtmlCo.append("<a href=SelectQuestion.action?question_no=" + (quno) + "&currentPage=" + (cupage)
					+ "&currentPageCo=" + (startPageCo - 1) + ">");
			pagingHtmlCo.append("이전");
			pagingHtmlCo.append("</a>");
		}

		pagingHtmlCo.append("&nbsp;|&nbsp;");

		// 페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPageCo; i <= endPageCo; i++) {
			if (i > totalPageCo) {
				break;
			}
			if (i == currentPageCo) {
				pagingHtmlCo.append("&nbsp;<b> <font color='#f37720'>");
				pagingHtmlCo.append(i);
				pagingHtmlCo.append("</font></b>");
			} else {
				pagingHtmlCo.append("<a href=SelectQuestion.action?question_no=" + (quno) + "&currentPage=" + (cupage)
						+ "&currentPageCo=");
				pagingHtmlCo.append(i);
				pagingHtmlCo.append(">");
				pagingHtmlCo.append(i);
				pagingHtmlCo.append("</a>");
			}

			pagingHtmlCo.append("&nbsp;");
		}

		pagingHtmlCo.append("&nbsp;&nbsp;|&nbsp;&nbsp;");

		// 다음 block 페이지
		if (totalPageCo - startPageCo >= blockPageCo) {
			pagingHtmlCo.append("<a href=SelectQuestion.action?question_no=" + (quno) + "&currentPage=" + (cupage)
					+ "&currentPageCo=" + (endPageCo + 1) + ">");
			pagingHtmlCo.append("다음");
			pagingHtmlCo.append("</a>");
		}
	}

	public int getCurrentPageCo() {
		return currentPageCo;
	}

	public void setCurrentPageCo(int currentPageCo) {
		this.currentPageCo = currentPageCo;
	}

	public int getTotalCountCo() {
		return totalCountCo;
	}

	public void setTotalCountCo(int totalCountCo) {
		this.totalCountCo = totalCountCo;
	}

	public int getTotalPageCo() {
		return totalPageCo;
	}

	public void setTotalPageCo(int totalPageCo) {
		this.totalPageCo = totalPageCo;
	}

	public int getBlockCountCo() {
		return blockCountCo;
	}

	public void setBlockCountCo(int blockCountCo) {
		this.blockCountCo = blockCountCo;
	}

	public int getBlockPageCo() {
		return blockPageCo;
	}

	public void setBlockPageCo(int blockPageCo) {
		this.blockPageCo = blockPageCo;
	}

	public int getStartCountCo() {
		return startCountCo;
	}

	public void setStartCountCo(int startCountCo) {
		this.startCountCo = startCountCo;
	}

	public int getEndCountCo() {
		return endCountCo;
	}

	public void setEndCountCo(int endCountCo) {
		this.endCountCo = endCountCo;
	}

	public int getStartPageCo() {
		return startPageCo;
	}

	public void setStartPageCo(int startPageCo) {
		this.startPageCo = startPageCo;
	}

	public int getEndPageCo() {
		return endPageCo;
	}

	public void setEndPageCo(int endPageCo) {
		this.endPageCo = endPageCo;
	}

	public StringBuffer getPagingHtmlCo() {
		return pagingHtmlCo;
	}

	public void setPagingHtmlCo(StringBuffer pagingHtmlCo) {
		this.pagingHtmlCo = pagingHtmlCo;
	}

}