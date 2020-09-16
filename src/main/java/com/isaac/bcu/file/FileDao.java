package com.isaac.bcu.file;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

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

	public boolean insert(MultipartHttpServletRequest mRequest, int hwSeq) throws IOException {

		int success, orderNo = 1;

		List<MultipartFile> fileList = mRequest.getFiles("file");

		for( MultipartFile  mfile : fileList ) {

			FileVO fvo = new FileVO();

			String orgName = mfile.getOriginalFilename();
			File target = new File(uploadPath, orgName);
			FileCopyUtils.copy(mfile.getBytes(), target);

			fvo.setHwSeq(hwSeq);
			fvo.setFileNm(mfile.getOriginalFilename());
			fvo.setFilePath(uploadPath);
			fvo.setFileSize(mfile.getSize());
			fvo.setFileType(mfile.getContentType());
			fvo.setFileUrl("/hwImg/img/");
			fvo.setOrderNo(orderNo);
			success = sqlSession.insert("_file.insert", fvo);

			if ( success != 1 ) return false;

			orderNo++;
		}

		return true;
	}
}