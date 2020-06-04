package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import domain.Topping;

public class ToppingDbUtil {

	private DataSource dataSource;

	public ToppingDbUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public List<Topping> findAll() throws Exception {
		List<Topping> toppingList = new ArrayList<>();

		// DB接続用のオブジェクトを定義
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 接続先の確保
			con = dataSource.getConnection();
			// SQL文の作成
			String sql = "SELECT id, name, price_m, price_l FROM toppings ORDER BY name";
			// 接続準備
			pstmt = con.prepareStatement(sql);
			// SQL実行
			rs = pstmt.executeQuery();
			// マッピング
			while (rs.next()) {
				Topping topping = new Topping();
				topping.setId(rs.getInt("id"));
				topping.setName(rs.getString("name"));
				topping.setPriceM(rs.getInt("price_m"));
				topping.setPriceL(rs.getInt("price_l"));
				toppingList.add(topping);
			}
			// オブジェクトの受け渡し
			return toppingList;
		} finally {
			// 切断
			close(con, pstmt, rs);
		}
	}

	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (con != null) {
				con.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
