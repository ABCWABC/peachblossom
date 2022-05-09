package com.peachblossom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ReviewVO;

public interface ReviewMapper {

	/** 리뷰페이지 리스트를 가져온다. */
	public List<ReviewVO> getReviewListWithPaging(@Param("cri") Criteria cri,  @Param("pro_num") Integer pro_num) throws Exception;
	
	/** 해당 제품의 총리뷰수를 계산한다. */
	public int getTotalCount(Integer pro_num) throws Exception;
	
	/** 리뷰를 등록한다. */
	public void reviewInsert(ReviewVO vo) throws Exception;
	
	/** 리뷰를 수정한다. */
	public void reviewEdit(ReviewVO vo) throws Exception;
	
	/** 리뷰를 삭제한다. */
	public void reviewDel(Integer rew_num) throws Exception;
	
}
