package org.springframework.ozo.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileUploadService implements ApplicationContextAware {

	private String path;
	private WebApplicationContext context = null;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {

		context = (WebApplicationContext) applicationContext;
		path = context.getServletContext().getRealPath("/resources/img");
	}

	public List<String> restore(MultipartHttpServletRequest request, List<MultipartFile> multipartFiles) {

		List<String> urls = new ArrayList<String>();

		for (MultipartFile mf : multipartFiles) {
			String originFilename = mf.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			String saveFileName = getSaveFileName(extName);

			try {
				writeFile(mf, saveFileName);
				urls.add(saveFileName);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}

		return urls;
	}

	public String changeProfile(MultipartFile multipartFile,  String fileName) {

		String originalFileName = multipartFile.getOriginalFilename();
		String extName = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
		fileName += extName;

		try {

			writeFile(multipartFile, fileName);
			return fileName;

		}catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		

	}

	

	private String getSaveFileName(String extName) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}

	
	private boolean writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName, false);
		fos.write(data);
		fos.close();

		return result;
	}

}
