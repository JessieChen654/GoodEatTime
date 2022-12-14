package com.tibame.tga104.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.tibame.tga104.common.connection.ServiceLocator;
import com.tibame.tga104.product.vo.ProdCategoryVO;

public class ProdCategoryDAO_JNDI implements ProdCategoryDAO {
	private DataSource dataSource;

	public ProdCategoryDAO_JNDI() {
		dataSource = ServiceLocator.getInstance().getDataSource();
	}

	@Override
	public ProdCategoryVO insert(ProdCategoryVO prodCategory) {
		String insertSQL = "insert into prodCategory (prodCategory) value(?);";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS)) {
			ps.setString(1, prodCategory.getProdCategory());
			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			while (rs.next()) {
				return findByPrimaryKey(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean update(ProdCategoryVO prodCategory) {
		String updateSQL = "update prodCategory set prodCategory = ? where prodCategoryNo = ?;";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(updateSQL)) {
			ps.setString(1, prodCategory.getProdCategory());
			ps.setInt(2, prodCategory.getProdCategoryNo());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	
	}

	@Override
	public boolean delete(Integer prodCategoryNo) {
		String deleteSQL = "delete from prodCategory where prodCategoryNo = ?";
		int rowCount = 0;
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(deleteSQL)) {
			ps.setInt(1, prodCategoryNo);
			rowCount = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowCount != 0;
	}

	@Override
	public ProdCategoryVO findByPrimaryKey(Integer prodCategoryNo) {
		ProdCategoryVO myProdCategory = null;
		String findByPRimaryKeySQL = "select * from prodCategory where prodCategoryNo = ?";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(findByPRimaryKeySQL)) {
			ps.setInt(1, prodCategoryNo);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				myProdCategory = new ProdCategoryVO();
				myProdCategory.setProdCategoryNo(rs.getInt("prodCategoryNo"));
				myProdCategory.setProdCategory(rs.getString("prodCategory"));
			}
		} catch (SQLException e) {

		}
		return myProdCategory;
	}

	@Override
	public List<ProdCategoryVO> getAll() {
		ProdCategoryVO myProdCategory = null;
		List<ProdCategoryVO> list = new ArrayList<>();
		String getAllSQL = "select * from prodCategory";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(getAllSQL)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				myProdCategory = new ProdCategoryVO();
				myProdCategory.setProdCategoryNo(rs.getInt("prodCategoryNo"));
				myProdCategory.setProdCategory(rs.getString("prodCategory"));
				list.add(myProdCategory);
			}
		} catch (SQLException e) {

		}
		return list;
	}
}
