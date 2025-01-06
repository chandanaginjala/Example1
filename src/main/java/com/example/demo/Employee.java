package com.example.demo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Employee {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int eid; //no need to give input it starts from 1
private String ename;
private String phono;
public int getEid() {
return eid;
}
public void setEid(int eid) {
this.eid = eid;
}
public String getEname() {
return ename;
}
public void setEname(String ename) {
this.ename = ename;
}
public String getPhono() {
return phono;
}
public void setPhono(String phono) {
this.phono = phono;
}

}