package bai4.shopping.dao;

import java.util.List;

import bai4.shopping.entities.Product;

public interface ProductDAO {
	public List<Product> findAll();
	public Product getById(int id);
	public void addProduct(Product p);
}
