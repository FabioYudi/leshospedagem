package com.les.LesHotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.les.LesHotel.entities.Cupom;

@Repository
public interface CupomRepository extends JpaRepository<Cupom, Long>{

}
