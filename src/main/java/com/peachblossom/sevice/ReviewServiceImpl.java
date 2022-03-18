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

	@Override
	public List<ReviewVO> getReviewListWithPaging(Criteria cri, Integer pro_num) {
		return mapper.getReviewListWithPaging(cri, pro_num);
	}

	@Override
	public int getTotalCount(Integer pro_num) {
		return mapper.getTotalCount(pro_num);
	}

	@Override
	public void reviewInsert(ReviewVO vo) {
		mapper.reviewInsert(vo);
		
	}

	@Override
	public void reviewEdit(ReviewVO vo) {
		mapper.reviewEdit(vo);
	}

	@Override
	public void reviewDel(Integer rew_num) {
		mapper.reviewDel(rew_num);
	}

}
