package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import domain.Item;

public class ItemDbUtil {

	// フィールド
	private DataSource dataSource;
	// コンストラクタ
	public ItemDbUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public List<Item> findAll() throws Exception {
		List<Item> itemList = new ArrayList<>();

		// DB接続用のオブジェクトを定義
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 接続先の確保
			con = dataSource.getConnection();
			// SQL文の作成
			String sql = "SELECT id, name, description, price_m, price_l, image_path, deleted FROM items ORDER BY price_m";
			// 接続準備
			pstmt = con.prepareStatement(sql);
			// SQL実行
			rs = pstmt.executeQuery();
			// マッピング
			while (rs.next()) {
				Item item = new Item();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDescription(rs.getString("description"));
				item.setPriceM(rs.getInt("price_m"));
				item.setPriceL(rs.getInt("price_l"));
				item.setImagePath(rs.getString("image_path"));
				item.setDeleted(rs.getBoolean("deleted"));
				itemList.add(item);
			}
			// オブジェクトの受け渡し
			return itemList;
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
	
	public Item load(Integer itemId) throws Exception{
		Item item = new Item();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String sql = "SELECT id, name, description, price_m, price_l, image_path, deleted FROM items "
					+ "WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDescription(rs.getString("description"));
				item.setPriceM(rs.getInt("price_m"));
				item.setPriceL(rs.getInt("price_l"));
				item.setImagePath(rs.getString("image_path"));
				item.setDeleted(rs.getBoolean("deleted"));
			}
			return item;
		}finally {
			close(con, pstmt, rs);
		}
	}

}
