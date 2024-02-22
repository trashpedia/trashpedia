package com.kks.trashpedia.trash.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TrashPost {
	private int trashPostNo;
	private String trashTitle;
	private String trashContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	public int getTrashPostNo() {
		return trashPostNo;
	}
	public void setTrashPostNo(int trashPostNo) {
		this.trashPostNo = trashPostNo;
	}
	public String getTrashTitle() {
		return trashTitle;
	}
	public void setTrashTitle(String trashTitle) {
		this.trashTitle = trashTitle;
	}
	public String getTrashContent() {
		return trashContent;
	}
	public void setTrashContent(String trashContent) {
		this.trashContent = trashContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
