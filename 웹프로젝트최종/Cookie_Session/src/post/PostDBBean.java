package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


//글입력 
public class PostDBBean {

	private static PostDBBean instance = new PostDBBean();
	public static PostDBBean getInstance() {
		return instance;
	}
	
	private PostDBBean() {}

	public int insertPost(PostDataBean article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int x = -1;
		
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
			
			String sql = "insert into POST values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article.getNum());
			pstmt.setString(2, article.getId());
			pstmt.setString(3, article.getTitle());
			pstmt.setString(4, article.getCategory());
			pstmt.setString(5, article.getContent());
			pstmt.executeUpdate();
			

			//insertHashTag(content); ** 일단은 취소 
	        
			x = 1;
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(conn != null) try {conn.close();} catch(SQLException e) {}
					if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
				}
		return x;
	}

	



//******************** 개인 포스트 보기 ********************************
//총 생성된 포스트의 갯수를 가져온다.
public int getArticleCount(String id) {
	Connection conn =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int x = 0;
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		String sql = "select count(*) from POST where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			x=rs.getInt(1);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(conn!=null) try {conn.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		if(rs!=null)try {rs.close();}catch(SQLException e){}
	}
	return x;
}


//list처리빈 post_List_** 에서 사용, 개인용 포스트들을 가져옵니다. 
public List<PostDataBean> getArticles(int end, String id){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<PostDataBean> articleList = null;
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		String sql = "select * from POST where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			articleList = new ArrayList<PostDataBean>(end);
			
			do {
				PostDataBean article = new PostDataBean();
				
				//빈에 각 row의 정보들 저장 
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setCategory(rs.getString("category"));
				
				articleList.add(article); //한줄씩 읽어온 게시글 정보를 리스트로 저장한다.
			}while(rs.next());			
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(conn!=null) try {conn.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		if(rs!=null)try {rs.close();}catch(SQLException e){}
	}
	
	return articleList;
}
//******************** 개인 포스트 보기 ********************************


//************** 전체 포스트 보기  *********************************
public int getTotalArticleCount() {
	Connection conn =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int x = 0;
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		String sql = "select count(*) from POST";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			x=rs.getInt(1);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(conn!=null) try {conn.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		if(rs!=null)try {rs.close();}catch(SQLException e){}
	}
	return x;
}

//전체 게시판
public List<PostDataBean> getTotalArticles(int end){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<PostDataBean> articleList = null;
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		String sql = "select * from POST";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			articleList = new ArrayList<PostDataBean>(end);
			
			do {
				PostDataBean article = new PostDataBean();
				
				//빈에 각 row의 정보들 저장 
				article.setId(rs.getString("id"));
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setCategory(rs.getString("category"));
				
				articleList.add(article); //한줄씩 읽어온 게시글 정보를 리스트로 저장한다.
			}while(rs.next());			
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(conn!=null) try {conn.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		if(rs!=null)try {rs.close();}catch(SQLException e){}
	}
	
	return articleList;
}

// ******************8 전체 포스트 보기  ********************



// 수정할 포스트의 정보를 가져옵니다.
public PostDataBean getArticleInfo(int num) throws Exception {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	PostDataBean article = new PostDataBean();
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl,"jspid", "jsppass");
		
		String sql = "select * from POST where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			article = new PostDataBean();
			article.setNum(rs.getInt("num"));
			article.setId(rs.getString("id"));
			article.setTitle(rs.getString("title"));
			article.setContent(rs.getString("content"));
			article.setCategory(rs.getString("category"));
		}
					
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(rs != null)try {rs.close();} catch(SQLException e) {}
		if(conn !=null)try {conn.close();} catch(SQLException e) {}
		if(pstmt !=null)try {pstmt.close();} catch(SQLException e) {}
	}
	return article;
}

//포스트 수정
public int modifyPost(PostDataBean article) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	int x = -1;
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		
		String sql = "update POST set title = ?, content = ?, Category = ? where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, article.getTitle());
		pstmt.setString(2,  article.getContent());
		pstmt.setString(3, article.getCategory());
		pstmt.setInt(4, article.getNum());
		pstmt.executeUpdate();
		
		x = 1; // 수정 성공 
		
	}catch(Exception e){
		e.printStackTrace();
	}finally {
		if(conn!=null)try {conn.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
	}		
	return x;
}


public void deletePost(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		
			String sql = "delete from POST where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null ) try {pstmt.close();}catch(Exception e) {}
			if(conn != null ) try {conn.close();}catch(Exception e) {}
	}
}



//******************** 카테고리 찾기  ********************************
//총 생성된 카테고리의 갯수를 가져온다.
public int getCategoryCount(String category) {
	Connection conn =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int x = 0;
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		String sql = "select count(*) from POST where category = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, category);		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			x=rs.getInt(1);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(conn!=null) try {conn.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		if(rs!=null)try {rs.close();}catch(SQLException e){}
	}
	return x;
}

 
public List<PostDataBean> getCategories(int end, String category){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<PostDataBean> articleList = null;
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		String sql = "select * from POST where category = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, category);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			articleList = new ArrayList<PostDataBean>(end);
			
			do {
				PostDataBean article = new PostDataBean();
				
				//빈에 각 row의 정보들 저장 
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setCategory(rs.getString("category"));
				
				articleList.add(article); //한줄씩 읽어온 게시글 정보를 리스트로 저장한다.
			}while(rs.next());			
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(conn!=null) try {conn.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		if(rs!=null)try {rs.close();}catch(SQLException e){}
	}
	
	return articleList;
	}
}
//******************** 카테고리 찾기  ********************************












/*	
 * 
 * **** 고급 기술 시도해봤으나 계속 오류 떠서 일단은 포기.
 * **** 방학때 모델1로 해보고 모델2로 바꾸어볼 것
public void insertHashTag(String content) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	HashTagGenerator hash = new HashTagGenerator();
	String url = "Cookie_Session/post/hash_Post_List.jsp?hash=";
	ResultSet rs = null;
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		
		String sql = " select num, content from POST where content = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, content);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			//불러온 포스트를 새로운 내용으로 교체하기 위함.
			String oldContent = rs.getString("content");
			int num = rs.getInt("num");
			//원래 있던 내용을 HashTagGenerator 클래스의 setAutoLinkHashTag메소드를 이용해
			//내용 안에 있는 해시태그를 인식하여 하이퍼링크의 형태로 바꿔준다.
			String newContent = hash.setAutoLinkHashTag(url, oldContent, num);
			
			//새로 바뀐 내용부분을 수정하여 DB에 재입력
			sql = "update POST set content = ? where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newContent);
			pstmt.setInt(2, num);
		}
			}catch(Exception e) {
		e.printStackTrace();
			}finally {
				if(conn != null) try {conn.close();} catch(SQLException e) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
				if(rs != null) try {rs.close();} catch(SQLException e) {}
			}

}

public List<PostDataBean> getHashtagPost(String hash){
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<PostDataBean> list = null;
	
	HashDBBean hashPro = new HashDBBean();
	int hashId = hashPro.getHashId(hash);
	
	try {
		String jdbcurl = "jdbc:mysql://localhost:3306/jsptest";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "jspid", "jsppass");
		
		String sql = "select * from POST" +
					 "where id in (SELECT num from POST_HASH_REL where hash_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  hashId);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			list = new ArrayList<PostDataBean>();
			
			do {
				PostDataBean article = new PostDataBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setContent(rs.getString("content"));
				list.add(article);
			}while(rs.next());
		}else {
			list = Collections.EMPTY_LIST;
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(conn != null) try {conn.close();} catch(SQLException e) {}
		if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
		if(rs != null) try {rs.close();} catch(SQLException e) {}
	}
	
	return list;
	
}
*/


	
