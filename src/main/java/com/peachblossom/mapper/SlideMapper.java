package com.peachblossom.mapper;

import java.util.List;

import com.peachblossom.domain.Criteria;
import com.peachblossom.domain.SlideVO;

public interface SlideMapper {
	
	public int slide_insert(SlideVO svo);
	
	public List<SlideVO> SlideGetListWithPaging(Criteria cri);
	
	public int SlideGetTotalCount(Criteria cri);
	
	public SlideVO slide_modify(Integer slide_num);
	
	public int slide_modifyOk(SlideVO svo);
	
	public int slide_delete(Integer slide_num);
}
