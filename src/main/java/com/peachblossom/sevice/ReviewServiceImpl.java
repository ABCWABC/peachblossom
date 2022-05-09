package com.peachblossom.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.ReviewVO;
import com.peachblossom.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper mapper;

	/** 리뷰페이지 리스트를 가져온다. */
	@Override
	public List<ReviewVO> getReviewListWithPaging(Criteria cri, Integer pro_num) throws Exception {
		return mapper.getReviewListWithPaging(cri, pro_num);
	}

	/** 해당 제품의 총리뷰수를 계산한다. */
	@Override
	public int getTotalCount(Integer pro_num) throws Exception {
		return mapper.getTotalCount(pro_num);
	}

	/** 리뷰를 등록한다. */
	@Override
	public void reviewInsert(ReviewVO vo) throws Exception {
		mapper.reviewInsert(vo);
		
	}

	/** 리뷰를 수정한다. */
	@Override
	public void reviewEdit(ReviewVO vo) throws Exception {
		mapper.reviewEdit(vo);
	}

	/** 리뷰를 삭제한다. */
	@Override
	public void reviewDel(Integer rew_num) throws Exception {
		mapper.reviewDel(rew_num);
	}

}
