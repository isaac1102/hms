package com.isaac.bcu.file;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.isaac.bcu.homework.HomeworkVO;

@Repository
public class FileDao{

	@Autowired
	SqlSession sqlSession;

//	������Ƽ ���Ϸ� �ű� ����
	@Autowired
	@Qualifier("uploadPath")
	String uploadPath;

//	������Ƽ ���Ϸ� �ű� ����
	String fileUrlForTomcat = "/hwImg/img/";

	public List<HomeworkVO> list(HomeworkVO hwVO){
		return sqlSession.selectList("_homework.list", hwVO);
	}

	public HomeworkVO view(HomeworkVO hwVO){
		return sqlSession.selectOne("_homework.view", hwVO);
	}

	public boolean insert(MultipartHttpServletRequest mRequest, HomeworkVO hwVO) throws IOException {

		int success, orderNo = 1;

		List<MultipartFile> fileList = mRequest.getFiles("file");

		// �������
		String filePath = pathMaker(uploadPath, hwVO.getRegId());
		// �������
		String fileUrl = fileUrlMaker(filePath);
		File Folder = new File(filePath);


		// �ش� ���丮�� ������� ���丮�� �����մϴ�.
		if (!Folder.exists()) {
			try{
			    Folder.mkdirs(); //���� �����մϴ�.
	        }catch(Exception e){
			    e.getStackTrace();
			}
        }

		for( MultipartFile  mfile : fileList ) {

			FileVO fvo = new FileVO();
			String fileNm = changeFileName();
			String orgName = mfile.getOriginalFilename();
			String fileType = extractFileType(mfile.getOriginalFilename());

			File target = new File(filePath , fileNm);
			FileCopyUtils.copy(mfile.getBytes(), target);

			fvo.setHwSeq(hwVO.getHwSeq());
			fvo.setFileNm(fileNm);
			fvo.setFilePath(filePath);
			fvo.setFileSize(mfile.getSize());
			fvo.setFileType(fileType);
			fvo.setFileUrl(fileUrl);
			fvo.setOrderNo(orderNo);
			fvo.setOrgFileNm(orgName);
			success = sqlSession.insert("_file.insert", fvo);

			if ( success != 1 ) return false;

			orderNo++;
		}

		return true;
	}

	public String pathMaker(String uploadPath, String regId) {
//		  ����
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy\\MM\\dd");
		Calendar cld = Calendar.getInstance();
		String time = sdf.format(cld.getTime());
		String path = uploadPath + "\\" + time + "\\" + regId+ "\\";

		// ����
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		Calendar cld = Calendar.getInstance();
//		String time = sdf.format(cld.getTime());
//		String path = uploadPath + "/" + time + "/" + regId+ "/";

		return path;
	}

	public String fileUrlMaker(String filePath) {

		String serverpath = filePath.replace(uploadPath, "");
		// \ -> / ����, ���� ���� /���� ����
		// ����
		serverpath = serverpath.replace("\\", "/").substring(1, serverpath.length());

		// ����
//		serverpath = serverpath.substring(1, serverpath.length());

		return fileUrlForTomcat + serverpath;
	}

	public String changeFileName() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar cld = Calendar.getInstance();
		String time = sdf.format(cld.getTime());

		UUID uuid = UUID.randomUUID();

		return uuid.toString() + "_" + time;
	}

	public String extractFileType(String fileName) {
		String dot = ".";
		int index = fileName.lastIndexOf(dot);

		return fileName.substring(index, fileName.length());

	}

	public static void main(String[] args) {

	}
}