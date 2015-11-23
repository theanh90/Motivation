package com.theanh.first.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.theanh.first.model.User;

@Transactional
@Repository
public class UserDaoImpl implements UserDao {
	// sử dụng @Transactional gắn trên các method để nói với Spring quản lý
	// Transaction khi các method này được gọi.
	// Hoặc sử dụng @Transactional gắn luôn trên class để nó có tác dụng trên
	// mọi method của class đó.

	@Autowired
	private SessionFactory sessionFactory;

//	@Override
//	public User getUser(String name) {
//		Session session = sessionFactory.getCurrentSession();
//		List<User> ls = session.createQuery("From USER").list();
//	}


	@Override
	public List<User> listUser() {
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		List<User> ls = session.createQuery("From USER").list();
		session.getTransaction().commit();
		return ls;
	}
//
//	@Override
//	public User addUser(User user) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public User updateUser(User user) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void deleteUser(String name) {
//		// TODO Auto-generated method stub
//
//	}

}
