package model1.board;

public class BoardDTO {
	//멤버 변수 선언 : board테이블에 생성된 컬럼과 동일함.
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private String viseitcount;
	//member 테이블과의 join을 통해 회원 이름을 출력해야
	//할때를 위해 멤버변수를 추가한다.
	private String name;
	
	//특별한 이유가 없다면 생성자는 없어도된다.
	
	//게터/세터
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	
	public String getViseitcount() {
		return viseitcount;
	}
	public void setViseitcount(String viseitcount) {
		this.viseitcount = viseitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
