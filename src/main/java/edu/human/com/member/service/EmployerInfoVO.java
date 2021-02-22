package edu.human.com.member.service;

import java.util.Date;

/**
 * EmployerInfoVO클래스는 회원관리 테이블과 Get/Set하는 맴버변수를 생성한다.
 * 테이블명: (lettn)emplyinfo
 * @author 이규혁
 *
 */
public class EmployerInfoVO {
	private String EMPLYR_ID;
	private String ORGNZT_ID;
	private String USER_NM;
	private String PASSWORD;
	private String EMPL_NO;
	private String IHIDNUM;
	private String SEXDSTN_CODE;
	private String BRTHDY;
	private String FXNUM;
	private String HOUSE_ADRES;
	private String PASSWORD_HINT;
	private String PASSWORD_CNSR;
	private String HOUSE_END_TELNO;
	private String AREA_NO;
	private String DETAIL_ADRES;
	private String ZIP;
	private String OFFM_TELNO;
	private String MBTLNUM;
	private String EMAIL_ADRES;
	private String OFCPS_NM;
	private String HOUSE_MIDDLE_TELNO;
	private String GROUP_ID;
	private String PSTINST_CODE;
	private String EMPLYR_STTUS_CODE;
	private String ESNTL_ID;
	private String CRTFC_DN_VALUE;
	private Date SBSCRB_DE;
	
	@Override
	public String toString() {
		return "EmployerInfoVO [EMPLYR_ID=" + EMPLYR_ID + ", ORGNZT_ID=" + ORGNZT_ID + ", USER_NM=" + USER_NM
				+ ", PASSWORD=" + PASSWORD + ", EMPL_NO=" + EMPL_NO + ", IHIDNUM=" + IHIDNUM + ", SEXDSTN_CODE="
				+ SEXDSTN_CODE + ", BRTHDY=" + BRTHDY + ", FXNUM=" + FXNUM + ", HOUSE_ADRES=" + HOUSE_ADRES
				+ ", PASSWORD_HINT=" + PASSWORD_HINT + ", PASSWORD_CNSR=" + PASSWORD_CNSR + ", HOUSE_END_TELNO="
				+ HOUSE_END_TELNO + ", AREA_NO=" + AREA_NO + ", DETAIL_ADRES=" + DETAIL_ADRES + ", ZIP=" + ZIP
				+ ", OFFM_TELNO=" + OFFM_TELNO + ", MBTLNUM=" + MBTLNUM + ", EMAIL_ADRES=" + EMAIL_ADRES + ", OFCPS_NM="
				+ OFCPS_NM + ", HOUSE_MIDDLE_TELNO=" + HOUSE_MIDDLE_TELNO + ", GROUP_ID=" + GROUP_ID + ", PSTINST_CODE="
				+ PSTINST_CODE + ", EMPLYR_STTUS_CODE=" + EMPLYR_STTUS_CODE + ", ESNTL_ID=" + ESNTL_ID
				+ ", CRTFC_DN_VALUE=" + CRTFC_DN_VALUE + ", SBSCRB_DE=" + SBSCRB_DE + "]";
	}
	public String getEMPLYR_ID() {
		return EMPLYR_ID;
	}
	public void setEMPLYR_ID(String eMPLYR_ID) {
		EMPLYR_ID = eMPLYR_ID;
	}
	public String getORGNZT_ID() {
		return ORGNZT_ID;
	}
	public void setORGNZT_ID(String oRGNZT_ID) {
		ORGNZT_ID = oRGNZT_ID;
	}
	public String getUSER_NM() {
		return USER_NM;
	}
	public void setUSER_NM(String uSER_NM) {
		USER_NM = uSER_NM;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getEMPL_NO() {
		return EMPL_NO;
	}
	public void setEMPL_NO(String eMPL_NO) {
		EMPL_NO = eMPL_NO;
	}
	public String getIHIDNUM() {
		return IHIDNUM;
	}
	public void setIHIDNUM(String iHIDNUM) {
		IHIDNUM = iHIDNUM;
	}
	public String getBRTHDY() {
		return BRTHDY;
	}
	public void setBRTHDY(String bRTHDY) {
		BRTHDY = bRTHDY;
	}
	public String getFXNUM() {
		return FXNUM;
	}
	public void setFXNUM(String fXNUM) {
		FXNUM = fXNUM;
	}
	public String getHOUSE_ADRES() {
		return HOUSE_ADRES;
	}
	public void setHOUSE_ADRES(String hOUSE_ADRES) {
		HOUSE_ADRES = hOUSE_ADRES;
	}
	public String getPASSWORD_HINT() {
		return PASSWORD_HINT;
	}
	public void setPASSWORD_HINT(String pASSWORD_HINT) {
		PASSWORD_HINT = pASSWORD_HINT;
	}
	public String getPASSWORD_CNSR() {
		return PASSWORD_CNSR;
	}
	public void setPASSWORD_CNSR(String pASSWORD_CNSR) {
		PASSWORD_CNSR = pASSWORD_CNSR;
	}
	public String getHOUSE_END_TELNO() {
		return HOUSE_END_TELNO;
	}
	public void setHOUSE_END_TELNO(String hOUSE_END_TELNO) {
		HOUSE_END_TELNO = hOUSE_END_TELNO;
	}
	public String getAREA_NO() {
		return AREA_NO;
	}
	public void setAREA_NO(String aREA_NO) {
		AREA_NO = aREA_NO;
	}
	public String getDETAIL_ADRES() {
		return DETAIL_ADRES;
	}
	public void setDETAIL_ADRES(String dETAIL_ADRES) {
		DETAIL_ADRES = dETAIL_ADRES;
	}
	public String getZIP() {
		return ZIP;
	}
	public void setZIP(String zIP) {
		ZIP = zIP;
	}
	public String getOFFM_TELNO() {
		return OFFM_TELNO;
	}
	public void setOFFM_TELNO(String oFFM_TELNO) {
		OFFM_TELNO = oFFM_TELNO;
	}
	public String getMBTLNUM() {
		return MBTLNUM;
	}
	public void setMBTLNUM(String mBTLNUM) {
		MBTLNUM = mBTLNUM;
	}
	public String getEMAIL_ADRES() {
		return EMAIL_ADRES;
	}
	public void setEMAIL_ADRES(String eMAIL_ADRES) {
		EMAIL_ADRES = eMAIL_ADRES;
	}
	public String getOFCPS_NM() {
		return OFCPS_NM;
	}
	public void setOFCPS_NM(String oFCPS_NM) {
		OFCPS_NM = oFCPS_NM;
	}
	public String getHOUSE_MIDDLE_TELNO() {
		return HOUSE_MIDDLE_TELNO;
	}
	public void setHOUSE_MIDDLE_TELNO(String hOUSE_MIDDLE_TELNO) {
		HOUSE_MIDDLE_TELNO = hOUSE_MIDDLE_TELNO;
	}
	public String getGROUP_ID() {
		return GROUP_ID;
	}
	public void setGROUP_ID(String gROUP_ID) {
		GROUP_ID = gROUP_ID;
	}
	public String getPSTINST_CODE() {
		return PSTINST_CODE;
	}
	public void setPSTINST_CODE(String pSTINST_CODE) {
		PSTINST_CODE = pSTINST_CODE;
	}
	public String getEMPLYR_STTUS_CODE() {
		return EMPLYR_STTUS_CODE;
	}
	public void setEMPLYR_STTUS_CODE(String eMPLYR_STTUS_CODE) {
		EMPLYR_STTUS_CODE = eMPLYR_STTUS_CODE;
	}
	public String getESNTL_ID() {
		return ESNTL_ID;
	}
	public void setESNTL_ID(String eSNTL_ID) {
		ESNTL_ID = eSNTL_ID;
	}
	public String getCRTFC_DN_VALUE() {
		return CRTFC_DN_VALUE;
	}
	public void setCRTFC_DN_VALUE(String cRTFC_DN_VALUE) {
		CRTFC_DN_VALUE = cRTFC_DN_VALUE;
	}
	public Date getSBSCRB_DE() {
		return SBSCRB_DE;
	}
	public void setSBSCRB_DE(Date sBSCRB_DE) {
		SBSCRB_DE = sBSCRB_DE;
	}
	public String getSEXDSTN_CODE() {
		return SEXDSTN_CODE;
	}
	public void setSEXDSTN_CODE(String sEXDSTN_CODE) {
		SEXDSTN_CODE = sEXDSTN_CODE;
	}
	
}
