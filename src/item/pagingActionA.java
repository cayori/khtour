package item;

public class pagingActionA {
	private int currentPage;   
	private int totalCount;	 
	private int totalPage;	 
	private int blockCount;	 
	private int blockPage;	
	private int startCount;	 
	private int endCount;	 
	private int startPage;	 
	private int endPage;	 
	private int no;
	private StringBuffer pagingHtml;


	
	public pagingActionA(int currentPage, int totalCount, int blockCount, int blockPage, int no)
	{
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.no = no;
		totalPage = (int) Math.ceil((double) totalCount / blockCount); //전체 글의 페이지 수 
		if (totalPage == 0) {
			totalPage = 1; //전체 페이지수가 0 이면 1로 저장한다
		}

		if (currentPage > totalPage) { //현재페이지가 전체 페이지수보다 크면 현재페이지는 전체페이지이다.
			currentPage = totalPage;
		}

		startCount = (currentPage - 1) * blockCount; // (1-1)*10 = 0
		endCount = startCount + blockCount - 1;// 0+10-1=9  한페이지에 마지막 글 번호 

		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1; //((1-1)/5)*5+1 = 1
		endPage = startPage + blockPage - 1; //1+5-1 = 5;

		if (endPage > totalPage) {
			endPage = totalPage; //최종페이지를 엔드 페이지로 저장
		}

		pagingHtml = new StringBuffer();
		if(totalCount>0){
		if (currentPage > blockPage) {
			pagingHtml.append("<a href=SelectAir.action?no="+no+"&currentPage="
					+ (startPage - 1) + ">");
			pagingHtml.append("[이전]");
			pagingHtml.append("</a>");
		}


		
		for (int i = startPage; i <= endPage; i++) {
				pagingHtml.append("<a href=SelectAir.action?no="+no+"&currentPage=");
				pagingHtml.append(i+">");
				pagingHtml.append("["+i+"]");
				pagingHtml.append("</a>");
		}
		
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a href=SelectAir.action?no="+no+"&currentPage="
					+ (endPage + 1) + ">");
			pagingHtml.append("[다음]");
			pagingHtml.append("</a>");
		}
	}
	}



	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public int getTotalCount() {
		return totalCount;
	}



	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}



	public int getTotalPage() {
		return totalPage;
	}



	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}



	public int getBlockCount() {
		return blockCount;
	}



	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}



	public int getBlockPage() {
		return blockPage;
	}



	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}



	public int getStartCount() {
		return startCount;
	}



	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}



	public int getEndCount() {
		return endCount;
	}



	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}



	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}



	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
	
	
}
