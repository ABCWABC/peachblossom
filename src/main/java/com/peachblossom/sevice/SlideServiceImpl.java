package com.peachblossom.sevice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.SlideVO;
import com.peachblossom.mapper.SlideMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class SlideServiceImpl implements SlideService {
	
	private SlideMapper mapper;
	
	@Override
	public int slide_insert(SlideVO svo) {
		return mapper.slide_insert(svo);
	}

	@Override
	public List<SlideVO> SlideGetListWithPaging(Criteria cri) {
		return mapper.SlideGetListWithPaging(cri);
	}

	@Override
	public int SlideGetTotalCount(Criteria cri) {
		return mapper.SlideGetTotalCount(cri);
	}

	@Override
	public SlideVO slide_modify(Integer slide_num) {
		return mapper.slide_modify(slide_num);
	}

	@Override
	public int slide_modifyOk(SlideVO svo) {
		return mapper.slide_modifyOk(svo);
	}

	@Override
	public int slide_delete(Integer slide_num) {
		return mapper.slide_delete(slide_num);
	}
}
