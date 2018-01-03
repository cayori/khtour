package service;

public class pagingActionQuestionCo {
	private int currentPageCo; // ����������
	private int totalCountCo; // ��ü �Խù� ��
	private int totalPageCo; // ��ü ������ ��
	private int blockCountCo; // �� �������� �Խù��� ��
	private int blockPageCo; // �� ȭ�鿡 ������ ������ ��
	private int startCountCo; // �� ���������� ������ �Խñ��� ���� ��ȣ
	private int endCountCo; // �� ���������� ������ �Խñ��� �� ��ȣ
	private int startPageCo; // ���� ������
	private int endPageCo; // ������ ������

	private StringBuffer pagingHtmlCo;

	// ����¡ ������
	public pagingActionQuestionCo(int currentPageCo, int totalCountCo, int blockCountCo, int blockPageCo, int cupage,
			int quno) {

		this.blockCountCo = blockCountCo;
		this.blockPageCo = blockPageCo;
		this.currentPageCo = currentPageCo;
		this.totalCountCo = totalCountCo;

		// ��ü ������ ��
		totalPageCo = (int) Math.ceil((double) totalCountCo / blockCountCo);
		if (totalPageCo == 0) {
			totalPageCo = 1;
		}

		// ���� �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if (currentPageCo > totalPageCo) {
			currentPageCo = totalPageCo;
		}

		// ���� �������� ó���� ������ ���� ��ȣ ��������.
		startCountCo = (currentPageCo - 1) * blockCountCo;
		endCountCo = startCountCo + blockCountCo - 1;

		// ���� �������� ������ ������ �� ���ϱ�.
		startPageCo = (int) ((currentPageCo - 1) / blockPageCo) * blockPageCo + 1;
		endPageCo = startPageCo + blockPageCo - 1;

		// ������ �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if (endPageCo > totalPageCo) {
			endPageCo = totalPageCo;
		}

		// ���� block ������
		pagingHtmlCo = new StringBuffer();
		if (currentPageCo > blockPageCo) {
			pagingHtmlCo.append("<a href=SelectQuestion.action?question_no=" + (quno) + "&currentPage=" + (cupage)
					+ "&currentPageCo=" + (startPageCo - 1) + ">");
			pagingHtmlCo.append("����");
			pagingHtmlCo.append("</a>");
		}

		pagingHtmlCo.append("&nbsp;|&nbsp;");

		// ������ ��ȣ.���� �������� ���������� �����ϰ� ��ũ�� ����.
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

		// ���� block ������
		if (totalPageCo - startPageCo >= blockPageCo) {
			pagingHtmlCo.append("<a href=SelectQuestion.action?question_no=" + (quno) + "&currentPage=" + (cupage)
					+ "&currentPageCo=" + (endPageCo + 1) + ">");
			pagingHtmlCo.append("����");
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