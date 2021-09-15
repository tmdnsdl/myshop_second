package myshop.order;

import java.util.ArrayList;

import myshop.product.ProductDTO;
import myshop.product.ProductDao;


public class CartDTO {
	private ArrayList<ProductDTO> cart_list=null;
	ProductDao pdao=null;
	ProductDTO newPd=null;
	public CartDTO(){
		cart_list = new ArrayList<ProductDTO>();
	}
	
	public void addProduct(int pnum, int oqty) {
		pdao = ProductDao.getInstance();
		newPd = pdao.selectByPnum(pnum);
		
		for(ProductDTO b : cart_list) { 
			if(b.getPnum()==pnum){
				b.setPqty(b.getPqty()+oqty);
				b.setTotalPrice(b.getPrice()*b.getPqty());
				b.setTotalPoint(b.getPoint()*b.getPqty());
				return;
			}
		}
		newPd.setPqty(oqty);		
		newPd.setTotalPrice(newPd.getPrice()*oqty);
		newPd.setTotalPoint(newPd.getPoint()*oqty);
		cart_list.add(newPd);
	}
	
	public ArrayList<ProductDTO> getAllProducts(){
		return cart_list;
	}
	
	public void setEdit(int pnum, int oqty) {
		for(ProductDTO b : cart_list) { 
			if(b.getPnum()==pnum){
				b.setPqty(oqty);
				b.setTotalPrice(b.getPrice()*(oqty));
				b.setTotalPoint(b.getPoint()*(oqty));
			}
		}
	}
	
	public void removeProduct(int pnum) {
		for(int i=0;i<cart_list.size();i++) {
			if(cart_list.get(i).getPnum()==pnum) {
				cart_list.remove(i);
			}
		}
	}
	
	public void removeAllProduct() {
		cart_list.clear();
	}
}
