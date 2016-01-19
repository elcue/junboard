package com.board.action;
 
import java.sql.*;
 
import java.util.ArrayList;
 
import javax.servlet.http.HttpServletRequest;
 
import javax.servlet.http.HttpServletResponse;
 
import com.board.beans.Board;
 
import com.board.controller.CommandAction;
 
public class ListAction implements CommandAction {
 
    @Override
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
 
        try {
 
            String driverName = "oracle.jdbc.driver.OracleDriver";
 
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
 
            ResultSet rs = null;
 
            Class.forName(driverName);
 
            Connection con = DriverManager.getConnection(url, "system", "1111");
 
            System.out.println("Oracle Database Connection Success.");
 
            Statement stmt = con.createStatement();
 
            String sql = "select * from board order by idx desc";
 
            rs = stmt.executeQuery(sql);
 
            ArrayList<Board> articleList = new ArrayList<Board>(); // Board��
                                                                    // �迭�������� ����
 
            while (rs.next()) {
 
                Board article = new Board(); // �����͵��� ������� Board��ü�� �޸𸮸� �Ҵ��ϴ�
                                                // �ڵ��Դϴ�.
 
                article.setIdx(Integer.parseInt(rs.getString("idx"))); // Integer.parseInt��
                                                                        // String����
                                                                        // int
                                                                        // ����ȯ
 
                article.setTitle(rs.getString("title"));
 
                article.setWriter(rs.getString("writer"));
 
                article.setRegdate(rs.getString("regdate"));
 
                article.setCount(Integer.parseInt(rs.getString("count")));
 
                articleList.add(article); // ���õ� ���� ����Ʈ�� �߰��մϴ�.
 
            }
 
            request.setAttribute("articleList", articleList); // ���õ� ����Ʈ�� �信
                                                                // �������մϴ�.
 
            con.close();
 
        } catch (Exception e) {
 
            System.err.println("Oracle Database Connection Something Problem.");
 
            System.out.println(e.getMessage());
 
            e.printStackTrace();
 
        }
 
        return "/junboard/list.jsp";
 
    }
 
}