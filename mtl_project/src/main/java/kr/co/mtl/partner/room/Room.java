package kr.co.mtl.partner.room;

import lombok.Data;

@Data
public class Room {
	
	private int idx;
	private String room_type;
	private String description;
	private int count;
	private int standard;
	private int maximum;
	private String basic_price;
	private String weekend_price;
	

}
