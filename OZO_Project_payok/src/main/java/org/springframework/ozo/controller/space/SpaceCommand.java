package org.springframework.ozo.controller.space;

import java.io.Serializable;


import org.springframework.ozo.domain.Space;
import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("serial")
public class SpaceCommand implements Serializable{
	
	private Space space;
	
	
	private MultipartFile images;
	
	public SpaceCommand() {
		this.space = new Space();
	}
	
	public SpaceCommand(Space space)	{
		this.space = space;
	}
	
	public Space getSpace() {
		return space;
	}
	public void setSpace(Space space) {
		this.space = space;
	}
	
	public MultipartFile getImages() {
		return images;
	}

	public void setImages(MultipartFile images) {
		this.images = images;
	}
	
	
	
	
	
	
	
	
	
	
}
