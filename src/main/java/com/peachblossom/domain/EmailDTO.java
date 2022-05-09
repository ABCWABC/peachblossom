package com.peachblossom.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class EmailDTO {

	/** 발신인 */
	private String senderName;
	
	/** 발신 이메일 */
	private String senderMail;
	
	/** 수신 이메일 */
	private String receiveMail;
	
	/** 이메일 제목 */
	private String subject;
	
	/** 이메일 내용 */
	private String message;
	
}
