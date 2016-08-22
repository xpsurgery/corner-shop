package Products;

public class Sku implements Comparable<Sku> {

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

	@Override
	public int compareTo(Sku other) {
		return id.compareTo(other.id);
	}
}
