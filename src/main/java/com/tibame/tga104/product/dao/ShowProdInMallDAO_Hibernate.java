package com.tibame.tga104.product.dao;

import java.util.List;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tibame.tga104.product.vo.ShowProdDetailVO;
import com.tibame.tga104.product.vo.ShowProdInMallVO;

@Repository
public class ShowProdInMallDAO_Hibernate implements ShowProdInMallDAO {
	@PersistenceContext
	private Session session;
	public Session getSession() {
		return session;
	}
	@Autowired
	private ProdCategoryDAO pcDAO;
	@Override
	public List<ShowProdInMallVO> getAll() {
		return this.getSession().createQuery("from ShowProdInMallVO", ShowProdInMallVO.class).list();
	}

	@Override
	public List<ShowProdInMallVO> getFromProdCategory(Integer prodCategoryNo) {
		if (prodCategoryNo == null || prodCategoryNo < 1) {
			return null;
		}
		String hql = "from ShowProdInMallVO where prodCategoryNo = :prodCategoryNo";
		return this.getSession().createQuery(hql, ShowProdInMallVO.class)
				.setParameter("prodCategoryNo", prodCategoryNo).list();
	}

	@Override
	public ShowProdInMallVO select(Integer prodNo) {
		return this.getSession().get(ShowProdInMallVO.class, prodNo);
	}

	@Override
	public List<ShowProdInMallVO> select6ByCategory(Integer prodCategoryNo) {
		if (prodCategoryNo != null && prodCategoryNo > 0) {
			String nativeSQL = "select * FROM goodeattime.v_showprodinmall "
					+ "where prodCategoryNo = :prodCategoryNo order by rand() limit 6";
			NativeQuery<ShowProdInMallVO> query = this.getSession().createSQLQuery(nativeSQL);
			query.setParameter("prodCategoryNo", prodCategoryNo);
			query.addEntity(ShowProdInMallVO.class);
			List<ShowProdInMallVO> result = query.list();
			return result;
		}
		return null;
	}

}
