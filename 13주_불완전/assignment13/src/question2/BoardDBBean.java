package question2;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




// BoardDBBean을 인스턴스화해서 각 함수들을 호출해서값들을 가지고 옵니다.
public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	public static BoardDBBean getInstance() {
		//jsp에서 데이터 처리빈에 접근하기 위한 객체 생성 .
		return instance;
	}
	
	
	 
//과제 제출시 tocat 폴더 server.xml같이 제출하기 
	
	//커넥션 풀 연결
	//커넥션풀 연결하여 connection 객체를 얻어온다
	//커넥션풀 dbcp 환경설정은 이클립스 / 톰캣 폴더의 server.xml의 환경설정을 모두 건드려야한다.
	//커넥션풀 JNDI 리소스 설정은 web.xml에서 건드려야한다.
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsptest");	
		return ds.getConnection();		
	}
	
	
	
	//insert db처리빈 추가 = board-insert.jsp 사용 
	public void insertArticle(BoardDataBean article) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			// db연결 
			conn = getConnection();	
			String sql = "insert into board_tbl(name,e_mail,title,content) values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			
			//query를 통해 db에 데이터 입력 
			pstmt.setString(1,article.getName());
			pstmt.setString(2,article.getE_mail());
			pstmt.setString(3,article.getTitle());
			pstmt.setString(4,article.getContent());
			pstmt.executeUpdate(); //쿼리 실행!
		}catch(Exception e) {
			e.printStackTrace();
		}finally {//연결된 자원 해제 
			if(rs != null)try {rs.close();} catch(SQLException e) {}
			if(pstmt != null)try {pstmt.close();} catch(SQLException e) {}
			if(conn != null)try {conn.close();} catch(SQLException e) {}
		}			
	}
	
	
	
	//테이블에 저장된 글의 수를 가져온다 => list를 가져온
	public int getArticleCount() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0; // 반환 될 카운트 수
	
		try {
			conn = getConnection();
			String sql = "select count(*) from board_tbl"; //데이터의 갯수를 세는 카운트 쿼리 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x=rs.getInt(1); //리스트에서 가장 높은 숫자를 가져옴
								//삭제 기능이 없는 리스트이기때문에 
								//id의 값은 증가만 할 뿐 중간에 modify필요가 없다.
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try{rs.close();}catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null)try {conn.close();} catch(SQLException e) {}
		}
		return x; //저장된 최대 게시글 수, 데이터빈 인덱스 지정 시 사용 
	}
	
	
	
	//list 처리 빈 추가 = board-list.jsp에서 사용, end = x를 가져온다.
	//List를 이용한다.
	public List<BoardDataBean> getArticles(int end) throws Exception{
											//end = 데이터베이스의 최대갯수 = x
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDataBean> articleList = null;
		
		try {
			conn = getConnection();
			String sql = "select * from board_tbl";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
						
			//name e_mail, title, content 
			if(rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do {
					BoardDataBean article = new BoardDataBean();
					
					// Bean에 각 row의 정보들을 저장 
					article.setId(rs.getInt("id"));
					article.setName(rs.getString("name"));
					article.setE_mail(rs.getString("e_mail"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					
					articleList.add(article); //BoardDataBean, 정보 저장빈을 리스트로 저장
				}while(rs.next());				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return articleList; //board_tbl의 자료가 Bean List형으로 저장됨.
	}
	
	

	// 글 내용 읽기 데이터 처리 빈 .
	public BoardDataBean readArticle(int id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		
		try {
			conn = getConnection();
			
			String sql = "select * from board_tbl where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				article = new BoardDataBean();
				article.setName(rs.getString("name"));
				article.setE_mail(rs.getString("e_mail"));
				article.setContent(rs.getString("content"));
				article.setTitle(rs.getString("title"));
			}
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
			if(rs != null)try {rs.close();}catch(SQLException e) {}
		}
		
		return article;
	}
}


	

