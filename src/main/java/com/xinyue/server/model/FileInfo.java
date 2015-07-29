package com.xinyue.server.model;

import java.io.Serializable;

/**
 * 
 * @author wenhai.you
 * @2015年7月20日
 * @下午3:24:48
 */
public class FileInfo implements Serializable {

	private String id;
	private String name;
	private String fileName;
	private String fileDir;
	private String fileType;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileDir() {
		return fileDir;
	}
	public void setFileDir(String fileDir) {
		this.fileDir = fileDir;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	@Override
	public String toString() {
		return "FileInfo [id=" + id + ", fileName=" + fileName + ", fileDir="
				+ fileDir + ", fileType=" + fileType + "]";
	}
	
}
