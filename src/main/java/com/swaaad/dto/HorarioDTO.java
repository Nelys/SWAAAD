package com.swaaad.dto;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Arrays;

public class HorarioDTO {
	int cbxCursos;
	String checkbox1;
	String checkbox2;
	String checkbox3;
	String checkbox4;
	String checkbox5;
	String checkbox6;
	String checkbox7;
	int[] hour;
	int[] minute;
	public HorarioDTO() {
		super();
	}
	public HorarioDTO(int cbxCursos, String checkbox1, String checkbox2, String checkbox3, String checkbox4,
			String checkbox5, String checkbox6, String checkbox7, int[] hour, int[] minute) {
		super();
		this.cbxCursos = cbxCursos;
		this.checkbox1 = checkbox1;
		this.checkbox2 = checkbox2;
		this.checkbox3 = checkbox3;
		this.checkbox4 = checkbox4;
		this.checkbox5 = checkbox5;
		this.checkbox6 = checkbox6;
		this.checkbox7 = checkbox7;
		this.hour = hour;
		this.minute = minute;
	}
	public int getCbxCursos() {
		return cbxCursos;
	}
	public void setCbxCursos(int cbxCursos) {
		this.cbxCursos = cbxCursos;
	}
	public String getCheckbox1() {
		return checkbox1;
	}
	public void setCheckbox1(String checkbox1) {
		this.checkbox1 = checkbox1;
	}
	public String getCheckbox2() {
		return checkbox2;
	}
	public void setCheckbox2(String checkbox2) {
		this.checkbox2 = checkbox2;
	}
	public String getCheckbox3() {
		return checkbox3;
	}
	public void setCheckbox3(String checkbox3) {
		this.checkbox3 = checkbox3;
	}
	public String getCheckbox4() {
		return checkbox4;
	}
	public void setCheckbox4(String checkbox4) {
		this.checkbox4 = checkbox4;
	}
	public String getCheckbox5() {
		return checkbox5;
	}
	public void setCheckbox5(String checkbox5) {
		this.checkbox5 = checkbox5;
	}
	public String getCheckbox6() {
		return checkbox6;
	}
	public void setCheckbox6(String checkbox6) {
		this.checkbox6 = checkbox6;
	}
	public String getCheckbox7() {
		return checkbox7;
	}
	public void setCheckbox7(String checkbox7) {
		this.checkbox7 = checkbox7;
	}
	public int[] getHour() {
		return hour;
	}
	public void setHour(int[] hour) {
		this.hour = hour;
	}
	public int[] getMinute() {
		return minute;
	}
	public void setMinute(int[] minute) {
		this.minute = minute;
	}
	@Override
	public String toString() {
		return "HorarioDTO [cbxCursos=" + cbxCursos + ", checkbox1=" + checkbox1 + ", checkbox2=" + checkbox2
				+ ", checkbox3=" + checkbox3 + ", checkbox4=" + checkbox4 + ", checkbox5=" + checkbox5 + ", checkbox6="
				+ checkbox6 + ", checkbox7=" + checkbox7 + ", hour=" + Arrays.toString(hour) + ", minute="
				+ Arrays.toString(minute) + "]";
	}

	
}
