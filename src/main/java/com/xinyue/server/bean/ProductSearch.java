package com.xinyue.server.bean;

public class ProductSearch {

	private String productType; //ywh 产品类型id
	private String loanAmount; //ywh  贷款金额
	private String loanPeriod; // ywh  贷款期限
	private String province;
	private String city;
	private String zone;
	private String bank;
	private String productName;
	
	
	//youwh
	private int productTypeIndex;
	private int loanAmountIndex;
	private String topage;
	private String zoneid;
	private String cityid;
	//youwh
	
	/**
	 * @return the productType
	 */
	public String getProductType() {
		return productType;
	}
	public String getZoneid() {
		return zoneid;
	}
	public void setZoneid(String zoneid) {
		this.zoneid = zoneid;
	}
	public String getCityid() {
		return cityid;
	}
	public void setCityid(String cityid) {
		this.cityid = cityid;
	}
	public String getTopage() {
		return topage;
	}
	public void setTopage(String topage) {
		this.topage = topage;
	}
	public int getProductTypeIndex() {
		return productTypeIndex;
	}
	public void setProductTypeIndex(int productTypeIndex) {
		this.productTypeIndex = productTypeIndex;
	}
	public int getLoanAmountIndex() {
		return loanAmountIndex;
	}
	public void setLoanAmountIndex(int loanAmountIndex) {
		this.loanAmountIndex = loanAmountIndex;
	}
	/**
	 * @param productType the productType to set
	 */
	public void setProductType(String productType) {
		this.productType = productType;
	}
	/**
	 * @return the loanAmount
	 */
	public String getLoanAmount() {
		return loanAmount;
	}
	/**
	 * @param loanAmount the loanAmount to set
	 */
	public void setLoanAmount(String loanAmount) {
		this.loanAmount = loanAmount;
	}
	/**
	 * @return the loanPeriod
	 */
	public String getLoanPeriod() {
		return loanPeriod;
	}
	/**
	 * @param loanPeriod the loanPeriod to set
	 */
	public void setLoanPeriod(String loanPeriod) {
		this.loanPeriod = loanPeriod;
	}
	/**
	 * @return the province
	 */
	public String getProvince() {
		return province;
	}
	/**
	 * @param province the province to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}
	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return the zone
	 */
	public String getZone() {
		return zone;
	}
	/**
	 * @param zone the zone to set
	 */
	public void setZone(String zone) {
		this.zone = zone;
	}
	/**
	 * @return the bank
	 */
	public String getBank() {
		return bank;
	}
	/**
	 * @param bank the bank to set
	 */
	public void setBank(String bank) {
		this.bank = bank;
	}
	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
}
