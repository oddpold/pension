package pension.board;

public class BoardDto {
   private int id, readnum, bimil, sung;
   private String name,title,content,birth,hobby,writeday,pwd;
   
   
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getReadnum() {
	return readnum;
}
public void setReadnum(int readnum) {
	this.readnum = readnum;
}
public int getBimil() {
	return bimil;
}
public void setBimil(int bimil) {
	this.bimil = bimil;
}
public int getSung() {
	return sung;
}
public void setSung(int sung) {
	this.sung = sung;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getBirth() {
	return birth;
}
public void setBirth(String birth) {
	this.birth = birth;
}
public String getHobby() {
	return hobby;
}
public void setHobby(String hobby) {
	this.hobby = hobby;
}
public String getWriteday() {
	return writeday;
}
public void setWriteday(String writeday) {
	this.writeday = writeday;
}
   
   
}
