/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package model.DAO;

import java.util.List;

/**
 *
 * @author phuct
 * @param <T>
 */
public interface Acccessible<T> {
    int insertRec(T obj);
    int deleteRec(String id);
    int updateRec(T obj);
    T getObjectById(String id);
    List<T> listAll();
}
