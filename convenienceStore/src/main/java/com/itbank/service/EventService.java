package com.itbank.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.component.FileComponent;
import com.itbank.model.EventDTO;
import com.itbank.model.UserCouponDTO;
import com.itbank.repository.EventRepository;

@Service
public class EventService {

	@Autowired private EventRepository er;
	@Autowired private FileComponent fc;

	public List<EventDTO> getEndEventList(HashMap<String, Object> map) {
		return er.getEndEventList(map);
	}

	public List<EventDTO> getCurrentEventList(HashMap<String, Object> map) {
		return er.getCurrentEventList(map);
	}

	public int selectEndCount(String search) {
		return er.selectEndCount(search);
	}

	public int selectCurrentCount(String search) {
		return er.selectCurrentCount(search);
	}

	public int deleteEvent(int idx) {
		return er.deleteEvent(idx);
	}
	
	public EventDTO selectOne(int idx) {
		return er.selectOne(idx);
	}
	
	public int writeEvent(EventDTO dto) {
		List<MultipartFile> list = dto.getUpload();
		String image = "";
		for(MultipartFile f : list) {
			image += fc.upload(f) + ":";
		}
		image = image.substring(0, image.length() - 1);
		dto.setImage(image);
		return er.writeEvent(dto);
	}

	public int getUserCoupon(UserCouponDTO dto) {
		return er.getUserCoupon(dto);
	}

	public UserCouponDTO check(UserCouponDTO dto) {
		return er.check(dto);
	}

	public int modify(EventDTO dto) {
		if(dto.getUpload().stream().allMatch(MultipartFile::isEmpty)) {
			System.out.println("기존 이미지 유지");
		}
		else {
			List<MultipartFile> list = dto.getUpload();
			String image = "";
			for(MultipartFile f : list) {
				image += fc.upload(f) + ":";
			}
			image = image.substring(0, image.length() - 1);
			dto.setImage(image);
		}
		
		return er.modify(dto);
	}
}
