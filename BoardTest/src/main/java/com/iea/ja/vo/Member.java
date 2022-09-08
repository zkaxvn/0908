package com.iea.ja.vo;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class Member {
	private int memberSeq;
	private String memberId;
	private String memberPwd;
	private String memberMail;
	private String memberName;
	private String memberPhone;
	private String memberBirthd;
	private String memberGender;
	private String memberAlram;
	private String memberGubun;
	private String memberState;
	private String memberImg;
	private String proCareer;
	private String proTpo;
	private String proState;
	private String regdt;
	
	private String careerStart;
	private String careerEnd;
	private String workList;
	
	private String licenseTitle;
	private String licensePublish;
	private String licenseDate;
	private String licenseImg;
	
	private String tpoCode;
	private String officeName;
	private String officeAddress;
	private String proIntroduction;
	private String consultPhone;
	private String consultVisit;
	private String tpoTitle;
	private int reviewCnt;
	private int reviewAvg;
	
	
	public int getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberMail() {
		return memberMail;
	}
	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberBirthd() {
		return memberBirthd;
	}
	public void setMemberBirthd(String memberBirthd) {
		this.memberBirthd = memberBirthd;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberAlram() {
		return memberAlram;
	}
	public void setMemberAlram(String memberAlram) {
		this.memberAlram = memberAlram;
	}
	public String getMemberGubun() {
		return memberGubun;
	}
	public void setMemberGubun(String memberGubun) {
		this.memberGubun = memberGubun;
	}
	public String getMemberState() {
		return memberState;
	}
	public void setMemberState(String memberState) {
		this.memberState = memberState;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	public String getProCareer() {
		return proCareer;
	}
	public void setProCareer(String proCareer) {
		this.proCareer = proCareer;
	}
	public String getProTpo() {
		return proTpo;
	}
	public void setProTpo(String proTpo) {
		this.proTpo = proTpo;
	}
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	public String getLicenseTitle() {
		return licenseTitle;
	}
	public void setLicenseTitle(String licenseTitle) {
		this.licenseTitle = licenseTitle;
	}
	public String getLicensePublish() {
		return licensePublish;
	}
	public void setLicensePublish(String licensePublish) {
		this.licensePublish = licensePublish;
	}
	public String getLicenseDate() {
		return licenseDate;
	}
	public void setLicenseDate(String licenseDate) {
		this.licenseDate = licenseDate;
	}
	public String getLicenseImg() {
		return licenseImg;
	}
	public void setLicenseImg(String licenseImg) {
		this.licenseImg = licenseImg;
	}
	public String getCareerStart() {
		return careerStart;
	}
	public void setCareerStart(String careerStart) {
		this.careerStart = careerStart;
	}
	public String getCareerEnd() {
		return careerEnd;
	}
	public void setCareerEnd(String careerEnd) {
		this.careerEnd = careerEnd;
	}
	public String getWorkList() {
		return workList;
	}
	public void setWorkList(String workList) {
		this.workList = workList;
	}
	public String getProState() {
		return proState;
	}
	public void setProState(String proState) {
		this.proState = proState;
	}
	public String getOfficeName() {
		return officeName;
	}
	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
	public String getOfficeAddress() {
		return officeAddress;
	}
	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
	public String getProIntroduction() {
		return proIntroduction;
	}
	public void setProIntroduction(String proIntroduction) {
		this.proIntroduction = proIntroduction;
	}
	public String getTpoTitle() {
		return tpoTitle;
	}
	public void setTpoTitle(String tpoTitle) {
		this.tpoTitle = tpoTitle;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public int getReviewAvg() {
		return reviewAvg;
	}
	public void setReviewAvg(int reviewAvg) {
		this.reviewAvg = reviewAvg;
	}
	public String getTpoCode() {
		return tpoCode;
	}
	public void setTpoCode(String tpoCode) {
		this.tpoCode = tpoCode;
	}
	public String getConsultPhone() {
		return consultPhone;
	}
	public void setConsultPhone(String consultPhone) {
		this.consultPhone = consultPhone;
	}
	public String getConsultVisit() {
		return consultVisit;
	}
	public void setConsultVisit(String consultVisit) {
		this.consultVisit = consultVisit;
	}
	@Override
	public String toString() {
		return "Member [memberSeq=" + memberSeq + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberMail=" + memberMail + ", memberName=" + memberName + ", memberPhone=" + memberPhone
				+ ", memberBirthd=" + memberBirthd + ", memberGender=" + memberGender + ", memberAlram=" + memberAlram
				+ ", memberGubun=" + memberGubun + ", memberState=" + memberState + ", memberImg=" + memberImg
				+ ", proCareer=" + proCareer + ", proTpo=" + proTpo + ", proState=" + proState + ", regdt=" + regdt
				+ ", careerStart=" + careerStart + ", careerEnd=" + careerEnd + ", workList=" + workList
				+ ", licenseTitle=" + licenseTitle + ", licensePublish=" + licensePublish + ", licenseDate="
				+ licenseDate + ", licenseImg=" + licenseImg + ", tpoCode=" + tpoCode + ", officeName=" + officeName
				+ ", officeAddress=" + officeAddress + ", proIntroduction=" + proIntroduction + ", consultPhone="
				+ consultPhone + ", consultVisit=" + consultVisit + ", tpoTitle=" + tpoTitle + ", reviewCnt="
				+ reviewCnt + ", reviewAvg=" + reviewAvg + "]";
	}
}
