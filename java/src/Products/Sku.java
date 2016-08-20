package Products;

public class Sku {

	public String title;
	public String id;
	public int price;
	public String description;

	public Sku(String id, String title, String description, int price) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.price = price;
	}
}
