package com.isaac.bcu.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

public class FileService {

	@Autowired
	FileDao dao;
}