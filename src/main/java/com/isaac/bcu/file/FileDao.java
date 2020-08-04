package com.isaac.bcu.file;

import java.io.File;
import java.io.IOException;
import java.util.List;
import org.springframework.util.FileCopyUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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

	public int insert(MultipartFile mfile) throws IOException {

		FileVO fvo = new FileVO();

//		file_path(project/userId/)
//		file_id(추후 파일명 암호화 예정)
//		file_nm(파일명)
//		file_url(/homework/img/)
//		order_no(auto increment)
//		file_size(size)
//		file_type(.jpg)
//		fileDao.insert(fileVO);

		String orgName = mfile.getOriginalFilename();
		File target = new File(uploadPath, orgName);
		FileCopyUtils.copy(mfile.getBytes(), target);

		fvo.setFileNm(mfile.getOriginalFilename());
		fvo.setFilePath(uploadPath);
		fvo.setFileSize(mfile.getSize());
		fvo.setFileType(mfile.getContentType());
		fvo.setFileUrl("/hwImg/img/");
		fvo.setOrderNo(0);

		sqlSession.insert("_file.insert", fvo);
		System.out.println(fvo.getFileSeq());

		return fvo.getFileSeq();
	}
}