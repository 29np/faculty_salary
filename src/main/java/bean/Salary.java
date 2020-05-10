package bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
//@IdClass(Salary.TimePK.class)
public class Salary
{
	/*public class TimePK implements Serializable {
		protected String id;
		protected int year;
		protected int monthno;

		public TimePK() {}

		public TimePK(String id, int year, int monthno) {
			this.id = id;
			this.year = year;
			this.monthno = monthno;
		}
		// equals, hashCode
	}*/

	private String id;
	private int year;
	private int monthno;
	@Id
	private String transaction_id1;
	private String transaction_id2;
	private String transaction_id3;
	private Date part1;
	private Date part2;
	private Date part3;
	private int amount1;
	private int amount2;
	private int amount3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonthno() {
		return monthno;
	}
	public void setMonthno(int monthno) {
		this.monthno = monthno;
	}
	public String getTransaction_id1() {
		return transaction_id1;
	}
	public void setTransaction_id1(String transaction_id1) {
		this.transaction_id1 = transaction_id1;
	}
	public String getTransaction_id2() {
		return transaction_id2;
	}
	public void setTransaction_id2(String transaction_id2) {
		this.transaction_id2 = transaction_id2;
	}
	public String getTransaction_id3() {
		return transaction_id3;
	}
	public void setTransaction_id3(String transaction_id3) {
		this.transaction_id3 = transaction_id3;
	}
	public Date getPart1() {
		return part1;
	}
	public void setPart1(Date part1) {
		this.part1 = part1;
	}
	public Date getPart2() {
		return part2;
	}
	public void setPart2(Date part2) {
		this.part2 = part2;
	}
	public Date getPart3() {
		return part3;
	}
	public void setPart3(Date part3) {
		this.part3 = part3;
	}
	public int getAmount1() {
		return amount1;
	}
	public void setAmount1(int amount1) {
		this.amount1 = amount1;
	}
	public int getAmount2() {
		return amount2;
	}
	public void setAmount2(int amount2) {
		this.amount2 = amount2;
	}
	public int getAmount3() {
		return amount3;
	}
	public void setAmount3(int amount3) {
		this.amount3 = amount3;
	}
	@Override
	public String toString() {
		return "Salary [id=" + id + ", year=" + year + ", monthno=" + monthno + ", transaction_id1=" + transaction_id1
				+ ", transaction_id2=" + transaction_id2 + ", transaction_id3=" + transaction_id3 + ", part1=" + part1
				+ ", part2=" + part2 + ", part3=" + part3 + ", amount1=" + amount1 + ", amount2=" + amount2
				+ ", amount3=" + amount3 + "]";
	}
	
	
	
	
}
