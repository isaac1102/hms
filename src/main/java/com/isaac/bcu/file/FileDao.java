package com.isaac.bcu.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

	@Autowired
	@Qualifier("uploadPath")
	String uploadPath;

	public List<HomeworkVO> list(HomeworkVO hwVO){
		return sqlSession.selectList("_homework.list", hwVO);
	}

	public HomeworkVO view(HomeworkVO hwVO){
		return sqlSession.selectOne("_homework.view", hwVO);
	}

//		file_path(project/userId/)
//		file_id(추후 파일명 암호화 예정)
//		file_nm(파일명)
//		file_url(/homework/img/)
//		order_no(auto increment)
//		file_size(size)
//		file_type(.jpg)
//		fileDao.insert(fileVO);
	public List<Integer> insert(MultipartHttpServletRequest mRequest) throws IOException {

		List<MultipartFile> fileList = mRequest.getFiles("file");

		int orderNo = 0;
		List<Integer> fileSeqs = new ArrayList<Integer>();
		for( MultipartFile  mfile : fileList ) {
			FileVO fvo = new FileVO();

			String orgName = mfile.getOriginalFilename();
			File target = new File(uploadPath, orgName);
			FileCopyUtils.copy(mfile.getBytes(), target);

			fvo.setFileNm(mfile.getOriginalFilename());
			fvo.setFilePath(uploadPath);
			fvo.setFileSize(mfile.getSize());
			fvo.setFileType(mfile.getContentType());
			fvo.setFileUrl("C:\\img");
//			fvo.setFileUrl("/hwImg/img/");
			fvo.setOrderNo(orderNo);
			orderNo++;
			int fileSeq = sqlSession.insert("_file.insert", fvo);
			fileSeqs.add(fileSeq);
		}


//
//		String orgName = mfile.getOriginalFilename();
//		File target = new File(uploadPath, orgName);
//		FileCopyUtils.copy(mfile.getBytes(), target);
//
//		fvo.setFileNm(mfile.getOriginalFilename());
//		fvo.setFilePath(uploadPath);
//		fvo.setFileSize(mfile.getSize());
//		fvo.setFileType(mfile.getContentType());
//		fvo.setFileUrl("/hwImg/img/");
//		fvo.setOrderNo(0);

//		sqlSession.insert("_file.insert", fvo);
//		System.out.println(fvo.getFileSeq());

		return fileSeqs;
//		return fvo.getFileSeq();
	}
}